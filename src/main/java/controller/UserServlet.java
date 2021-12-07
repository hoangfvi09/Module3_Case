package controller;

import model.User;
import service.implement.UserService;
import service.serviceInterface.IUserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();
    private RequestDispatcher requestDispatcher = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                default:
                    showAllUser(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.delete(id);
        response.sendRedirect("/users");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.findById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit_user.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create_user.jsp");
        dispatcher.forward(request, response);
    }

    private void showAllUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<User> userList = userService.findAll();
        request.setAttribute("userList", userList);
        requestDispatcher = request.getRequestDispatcher("user/list_user.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
            }
        } catch (SQLException e) {
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        int role = Integer.parseInt(request.getParameter("role"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String image = request.getParameter("image");
        User user = new User( id, name, email, password,role, image);
        userService.update(id,user);
        response.sendRedirect("/home");
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String re_password = request.getParameter("repass");
         User a = userService.checkAccountExist(email);
            if (a == null){
                if (!password.equals(re_password)){
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create_user.jsp");
                    request.setAttribute("verifyResult", "Confirm password do not match. Please try again");
                    requestDispatcher.forward(request,response);
                }else {
                    User newUser = new User(name, email, password);
                    userService.save(newUser);
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/login.jsp");
                    request.setAttribute("verifyResult", "Sign-up Success . You can login");
                    requestDispatcher.forward(request,response);
                }
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("user/create_user.jsp");
                request.setAttribute("verifyResult", "Account already exists. Please try again");
                requestDispatcher.forward(request,response);
            }

    }
}
