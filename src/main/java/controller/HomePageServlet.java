package controller;

import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "HomePageServlet", value = "/home-page")
public class HomePageServlet extends HttpServlet {
    static {

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
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
