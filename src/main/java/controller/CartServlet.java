package controller;

import model.Cart;
import model.User;
import service.implement.CartService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/carts")
public class CartServlet extends HttpServlet {
    CartService cartService = new CartService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        List<Cart> myCart = null;
        try {
            myCart= cartService.findByUserId(currentUser.getId());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/cart/my-cart.jsp");
        request.setAttribute("myCart",myCart);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
