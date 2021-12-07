package controller;

import model.User;
import service.implement.CartService;
import service.implement.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    UserService userService = new UserService();
    CartService cartService = new CartService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        showForm(request, response);
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            verify(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private void verify(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {

        HttpSession session = request.getSession(true);
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = userService.verifyLogin(email, password);
        if (user == null) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/login.jsp");
            request.setAttribute("verifyResult", "Incorrect password or email. Please try again");
            requestDispatcher.forward(request,response);
        } else {
            session.setAttribute("currentUser", user);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request,response);
        }
    }
}
