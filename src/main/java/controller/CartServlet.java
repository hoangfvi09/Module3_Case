package controller;

import model.Cart;
import model.Product;
import model.User;
import service.implement.CartService;
import service.implement.ProductDetailService;
import service.implement.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/carts")
public class CartServlet extends HttpServlet {
    CartService cartService = new CartService();
    ProductDetailService productDetailService = new ProductDetailService();
    ProductService productService = new ProductService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "increase":
                increase(request, response);
                break;
            case "decrease":
                decrease(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "empty-cart":
                emptyCart(request, response);
                break;
            case "add-product":
                try {
                    addProduct(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            default:
                try {
                    show(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }

    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id =Integer. parseInt(request.getParameter("id"));
        int quantity =Integer. parseInt(request.getParameter("quantity"));
        if (isLoggedIn(request,response)){
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");
            List<Cart> currentCart = cartService.findByUserId(currentUser.getId());
            int result = cartService.alreadyInCart(id,currentCart);
            if (result == -1){
                cartService.save(new Cart(currentUser.getId(),id,quantity));
            }else{
                cartService.increaseQuantity(id, currentUser.getId());
            }
        }else{
            List<Cart> currentCart = findGuestCart(request,response);
            int result = cartService.alreadyInCart(id,currentCart);
            if (result == -1){
                currentCart.add(new Cart(id,quantity));
            }else{
                cartService.increaseQuantity(id,currentCart);
            }
        }
        response.sendRedirect("products?action=list");
    }

    private List<Cart> findGuestCart(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(true);
        List<Cart> currentCart = (List<Cart>) session.getAttribute("currentCart");
        if (currentCart == null) {
            currentCart = new ArrayList<>();
            session.setAttribute("currentCart", currentCart);
        }
        return currentCart;
    }

    private boolean isLoggedIn(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser != null) {
                return true;
            } else {
                return false;
            }

        }
        return false;
    }

    private void emptyCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (isLoggedIn(request, response)) {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");
            cartService.deleteAllProducts(currentUser.getId());

        } else {
            //chua dang nhap
            List<Cart> currentCart = new ArrayList<>();
            HttpSession session = request.getSession(false);
            session.setAttribute("currentCart", currentCart);
        }
        response.sendRedirect("/carts");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int productId = Integer.parseInt(request.getParameter("id"));
        if (isLoggedIn(request, response)) {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");
            cartService.deleteProduct(productId, currentUser.getId());
        } else {
            ///khi chua dang nhap thi lgi
            List<Cart> currentCart = findGuestCart(request, response);
            cartService.deleteProduct(productId,currentCart);

        }
        response.sendRedirect("/carts");
    }

    private void decrease(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (isLoggedIn(request, response)) {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");
            cartService.decreaseQuantity(id, currentUser.getId());
        } else {
            //chua dang nhap
            List<Cart> currentCart = findGuestCart(request, response);
            cartService.decreaseQuantity(id,currentCart);
        }
        response.sendRedirect("/carts");
    }

    private void increase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        if (isLoggedIn(request, response)) {

            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser != null) {
                cartService.increaseQuantity(id, currentUser.getId());
            }

        } else {
            //chua dang nhap
            List<Cart> currentCart = findGuestCart(request, response);
            cartService.increaseQuantity(id,currentCart);
        }
        response.sendRedirect("/carts");
    }

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Double> priceList = new ArrayList<>();
        List<Product> productList = new ArrayList<>();
        List<Cart> myCart = new ArrayList<>();
        if (isLoggedIn(request, response)) {
            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("currentUser");
            try {
                myCart = cartService.findByUserId(currentUser.getId());
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            myCart = findGuestCart(request,response);
        }
        int total=0;
        for (Cart cart : myCart
        ) {
            double price = productDetailService.findPriceByProductId(cart.getProductId());
            priceList.add(price);
            Product product = productService.findById(cart.getProductId());
            productList.add(product);
            int quantity= cart.getQuantity();
            total +=quantity*price;
        }

        if(myCart.size()==0){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/my-cart.jsp");
            requestDispatcher.forward(request, response);
        }else {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/my-cart.jsp");
            request.setAttribute("myCart", myCart);
            request.setAttribute("priceList", priceList);
            request.setAttribute("productList", productList);
            request.setAttribute("total", total);

            requestDispatcher.forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
