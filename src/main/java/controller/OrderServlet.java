package controller;

import model.Cart;
import model.Order;
import model.Product;
import model.User;
import service.implement.OrderService;
import service.implement.ProductDetailService;
import service.implement.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "OrderServlet", value = "/orders")
public class OrderServlet extends HttpServlet {
    OrderService orderService = new OrderService();
    ProductDetailService productDetailService = new ProductDetailService();
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int role = getRole(request,response);
        switch (role){
            case 1:
                try {
                    handleAdmin(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 2:
                handleUser(request,response);
                break;
        }

    }

    private void handleAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "cancel":
                cancelOrder(request,response);
                break;
            default:
                showOrderAd(request,response);
                break;
        }
    }

    private void showOrderAd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Order> orderList = orderService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/my-orders.jsp");
        request.setAttribute("myOrders", orderList);
        requestDispatcher.forward(request, response);
    }

    private void handleUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "cancel":
                cancelOrder(request,response);
                break;
            default:
                try {
                    show(request,response);
                } catch (SQLException | ServletException e) {
                    e.printStackTrace();
                }
                break;
        }
    }
    private int getRole(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession(false);
        int role;
        if (session != null){
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null){
                role = 0;
            }else {
                role = currentUser.getRole();
            }
        }else{
            role =0;
        }
        return role;
    }
    private void cancelOrder(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        orderService.changeStatus(orderId,0);
        response.sendRedirect("/orders");

    }

    private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        List<Order> myOrders = null;
        List<Product> productList = null;
        myOrders= orderService.findByUserId(currentUser.getId());
//        for (Order order:myOrders
//             ) {
//            productList.add(productService.findById(order.getId()));
//        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order/my-orders.jsp");
        request.setAttribute("myOrders", myOrders);
        requestDispatcher.forward(request, response);
        // chua hien thi dc order detail
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
