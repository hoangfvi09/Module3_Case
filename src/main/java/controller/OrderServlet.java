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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                try {
                    show(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
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
