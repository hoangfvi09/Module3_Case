package controller;

import model.User;
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

@WebServlet(name = "HomePageServlet", value = "/home-page")
public class HomePageServlet extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        try {
            request.setAttribute("productList",productService.findAll());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession session=request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        if (currentUser == null){
            request.setAttribute("welcome-line","Welcome guest!");
        }else{
            request.setAttribute("welcome-line","welcome "+ currentUser.getName());
        }
        requestDispatcher.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
