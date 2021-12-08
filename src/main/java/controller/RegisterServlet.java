package controller;

import model.User;
import service.implement.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register/register.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repass = request.getParameter("repass");
        try {
            if (repass.equals(password) && !userService.isExisting(email)) {
                User newUser = new User(name, email, password);
                try {
                    userService.save(newUser);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register/register-success.jsp");
                requestDispatcher.forward(request, response);
            } else {
                if (!repass.equals(password)) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register/register.jsp");
                    request.setAttribute("verifyResult1", "Passwords does not match. Please try again! ");
                    requestDispatcher.forward(request, response);
                }
                if (userService.isExisting(email)) {
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/register/register.jsp");
                    request.setAttribute("verifyResult2", "The email you have entered is already registered. Please try again! ");
                    requestDispatcher.forward(request, response);
                }
            }
            ;
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
