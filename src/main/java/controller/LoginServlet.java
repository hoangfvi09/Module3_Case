package controller;

import model.User;
import service.implement.UserService;
import service.serviceInterface.IUserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    IUserService userService = new UserService();
    private RequestDispatcher requestDispatcher = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User user = null;
        try {
            user = userService.verifyLogin(email, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (user == null) {
            request.setAttribute("mess", "Wrong email or password");
            requestDispatcher = request.getRequestDispatcher("login/login.jsp");
            requestDispatcher.forward(request, response);
        } else {
            response.sendRedirect("/users");
        }
    }
}
//@WebServlet(name = "LoginServlet", value = "/login")
//public class LoginServlet2 extends HttpServlet {
//    UserService userService = new UserService();
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        showForm(request, response);
//    }
//
//    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        RequestDispatcher dispatcher = request.getRequestDispatcher("login/login.jsp");
//        dispatcher.forward(request, response);
//
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            verify(request, response);
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    private void verify(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
//
//        HttpSession session = request.getSession(true);
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        User user = userService.verifyLogin(email, password);
//        if (user == null) {
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login/login.jsp");
//            request.setAttribute("verifyResult", "Incorrect password or email. Please try again");
//            requestDispatcher.forward(request,response);
//        } else {
//            session.setAttribute("currentUser", user);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
//            requestDispatcher.forward(request,response);
//        }
//    }
//}
