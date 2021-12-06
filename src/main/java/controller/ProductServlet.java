package controller;

import model.Product;
import model.ProductDetailUpdated;
import service.implement.ProductDetailService;
import service.implement.ProductService;
import service.serviceInterface.IProductDetailService;
import service.serviceInterface.IProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IProductService productService = new ProductService();
    private IProductDetailService productDetailService = new ProductDetailService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                try {
                    deleteProduct(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                editForm(request,response);
                break;
            case "list":
                try {
                    showList(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "list-price-asc":
                try {
                    showListPriceAsc(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "list-price-desc":
                try {
                    showListPriceDesc(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "find":
                try {
                    showResult(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;


        }

    }

    private void editForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            RequestDispatcher requestDispatcher=request.getRequestDispatcher("product/ad-edit.jsp");
            requestDispatcher.forward(request,response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        response.sendRedirect("/products?action=list");
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/ad-create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String info = request.getParameter("info");
        List<Product> productList = productService.find(info);
        request.setAttribute("productList", productList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Products related to " + info);
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showListPriceDesc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> productList = productService.findAllPriceDesc();
        request.setAttribute("productList", productList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List with Descending Price");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showListPriceAsc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> productList = productService.findAllPriceAsc();
        request.setAttribute("productList", productList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List with Ascending Price");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    saveProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                try {
                    editProduct(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        int categoryId= Integer.parseInt(request.getParameter("categoryId"));
        String description= request.getParameter("description");
        String image =request.getParameter("image");
        int sold = Integer.parseInt(request.getParameter("sold"));
        Product product=new Product(name,categoryId,description,image,sold);
        productService.update(id,product);
        response.sendRedirect("/products?action=list");
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int sold = Integer.parseInt(request.getParameter("sold"));
        productService.save(new Product(name,categoryId,description,image,sold));
        response.sendRedirect("/products?action=list");
    }



}
