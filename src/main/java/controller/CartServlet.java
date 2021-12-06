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
            default:
                try {
                    show(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "empty-cart":
                emptyCart(request, response);
                break;
        }

    }

    private void emptyCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        cartService.deleteAllProducts(currentUser.getId());
        response.sendRedirect("/carts");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession(false);
        List<Cart> cart = new ArrayList<>();
        cart = (ArrayList<Cart>) session.getAttribute("cart");
        if (cart.size() < 1) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/empty-cart.jsp");
            requestDispatcher.forward(request, response);
        } else {
            int productId = Integer.parseInt(request.getParameter("id"));
            User currentUser = (User) session.getAttribute("currentUser");
            cartService.deleteProduct(productId, currentUser.getId());
            response.sendRedirect("/carts");
        }

    }

    private void decrease(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/my-cart.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(false);
        List<Cart> cart;
        cart = (List<Cart>) session.getAttribute("cart");
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser != null) {
            cartService.decreaseQuantity(id, currentUser.getId());
        }
//        request.setAttribute("myCart", cart);
//        requestDispatcher.forward(request, response);
        response.sendRedirect("/carts");
    }

    private void increase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/my-cart.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession(false);
        List<Cart> cart = (List<Cart>) session.getAttribute("cart");
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser != null) {
            cartService.increaseQuantity(id, currentUser.getId());
        }
        response.sendRedirect("/carts");
//        request.setAttribute("myCart",cart);
//        requestDispatcher.forward(request, response);
    }

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        List<Cart> myCart = new ArrayList<>();
        try {
            myCart = cartService.findByUserId(currentUser.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        List<Double> priceList = new ArrayList<>();
        List<Product> productList = new ArrayList<>();
        for (Cart cart : myCart
        ) {
            double price = productDetailService.findPriceByProductId(cart.getProductId());
            priceList.add(price);
            Product product = productService.findById(cart.getProductId());
            productList.add(product);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/my-cart.jsp");
        request.setAttribute("myCart", myCart);
        request.setAttribute("priceList", priceList);
        request.setAttribute("productList", productList);
        requestDispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
