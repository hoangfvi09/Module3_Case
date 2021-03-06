package controller;

import model.Category;
import model.Product;
import model.ProductDetailUpdated;
import model.User;
import service.implement.CategoryService;
import service.implement.ProductDetailService;
import service.implement.ProductService;
import service.serviceInterface.ICategoryService;
import service.serviceInterface.IProductDetailService;
import service.serviceInterface.IProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IProductService productService = new ProductService();
    private final IProductDetailService productDetailService = new ProductDetailService();
    private final ICategoryService categoryService = new CategoryService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int role = getRole(request, response);
        switch (role) {
            case 0:
                try {
                    handleGuest(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 1:
                try {
                    handleAdmin(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case 2:
                try {
                    handleUser(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
        }

    }

    private void handleUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                viewProduct(request, response);
                break;
            case "purchased":
                showPurchased(request, response);
                break;
            case "list":
                try {
                    showList(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            case "list-price-asc":
                try {
                    showListPriceAsc(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            case "list-price-desc":
                try {
                    showListPriceDesc(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            case "find":
                try {
                    showResult(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            default:
                showList(request, response);
                break;
        }
    }

    private void showPurchased(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        List<Product> productList = productService.findPurchasedProducts(currentUser.getId());
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Products you have already bought");
        RequestDispatcher dispatcher;

        dispatcher = request.getRequestDispatcher("product/list.jsp");

        dispatcher.forward(request, response);
    }

    private void handleAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                viewProduct(request, response);
                break;
            case "deleted-list":
                showDeletedProduct(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            case "delete":
                try {
                    deleteProduct(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
                editForm(request, response);
                break;

            case "list":
                try {
                    showListAdmin(request, response);
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
            default:
                showList(request, response);
                break;
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/detail.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        request.setAttribute("product", product);
        request.setAttribute("productDetail", productDetailService.findById(id));
        request.setAttribute("category", categoryService.findById(product.getCategoryId()).getName());
        requestDispatcher.forward(request, response);

    }

    private void showDeletedProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList = filterDeletedProducts(productService.findAll());
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void handleGuest(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                viewProduct(request, response);
                break;
            case "list":
                try {
                    showList(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            case "list-price-asc":
                try {
                    showListPriceAsc(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            case "list-price-desc":
                try {
                    showListPriceDesc(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            case "find":
                try {
                    showResult(request, response);
                } catch (SQLException | ServletException | IOException e) {
                    e.printStackTrace();
                }
                break;
            default:
                showList(request, response);
                break;
        }

    }

    private int getRole(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        int role;
        if (session != null) {
            User currentUser = (User) session.getAttribute("currentUser");
            if (currentUser == null) {
                role = 0;
            } else {
                role = currentUser.getRole();
            }
        } else {
            role = 0;
        }
        return role;
    }

    private void showListAdmin(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList = filterDisplayedProducts(productService.findAll());
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/ad-edit.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("oldPro", productService.findById(id));
        request.setAttribute("oldProDetail", productDetailService.findById(id));
        requestDispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        productDetailService.updateStatus(id, 0);

        response.sendRedirect("/products?action=list");
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/ad-create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showResult(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String info = request.getParameter("info");
        List<Product> productList = filterDisplayedProducts(productService.find(info));
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Products related to " + info);
        RequestDispatcher dispatcher;
        if (getRole(request, response) == 1) {
            dispatcher = request.getRequestDispatcher("product/list.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("product/list.jsp");
        }
        dispatcher.forward(request, response);
    }

    private void showListPriceDesc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Product> productList = filterDisplayedProducts(productService.findAllPriceDesc());
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List with Descending Price");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showListPriceAsc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        List<Product> productList = filterDisplayedProducts(productService.findAllPriceAsc());
        request.setAttribute("productList", productList);
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List with Ascending Price");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String category = request.getParameter("category");

        List<Product> productList;
        if (category == null) {
            productList = productService.findAll();
        } else {
            productList = productService.findByCategory(Integer.parseInt(category));
        }
        productList = filterDisplayedProducts(productList);
        request.setAttribute("productList", productList);
//        List<Product> productList = productService.findAll();
//        request.setAttribute("productList", filterDisplayedProducts(productList));
        List<Category> categoryList = categoryService.findByProductList(productList);
        request.setAttribute("categoryList", categoryList);
        List<ProductDetailUpdated> productDetailList = productDetailService.findByProductList(productList);
        request.setAttribute("productDetailList", productDetailList);
        request.setAttribute("listName", "Product List");
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int role = getRole(request, response);
        if (role == 1) {
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
                        editProduct(request, response);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    break;
            }
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/ad-edit-success.jsp");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int sold = Integer.parseInt(request.getParameter("sold"));
        Product product = new Product(name, categoryId, description, image, sold);
        productService.update(id, product);

        int inStock = Integer.parseInt(request.getParameter("inStock"));
        double price = Double.parseDouble(request.getParameter("price"));
        int status = Integer.parseInt(request.getParameter("status"));
        ProductDetailUpdated productDetail = new ProductDetailUpdated(inStock, price, status);
        productDetailService.update(id, productDetail);
//        response.sendRedirect("/products?action=list");
        request.setAttribute("product", product);
        request.setAttribute("productDetail", productDetail);
        requestDispatcher.forward(request, response);
    }

    private void saveProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/ad-create-success.jsp");
        String name = request.getParameter("name");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        int sold = Integer.parseInt(request.getParameter("sold"));
        Product product = new Product(name, categoryId, description, image, sold);
        productService.save(product);

        int inStock = Integer.parseInt(request.getParameter("inStock"));
        double price = Double.parseDouble(request.getParameter("price"));
        int status = Integer.parseInt(request.getParameter("status"));
        ProductDetailUpdated productDetail = new ProductDetailUpdated(inStock, price, status);
        productDetailService.save(productDetail);
        request.setAttribute("product", product);
        request.setAttribute("productDetail", productDetail);
        requestDispatcher.forward(request, response);
    }

    private List<Product> filterDisplayedProducts(List<Product> products) throws SQLException {
        List<Product> displayedProducts = new ArrayList<>();
        for (Product product : products
        ) {
            boolean isDisplayed = productDetailService.findById(product.getId()).getStatus() == 1;
            if (isDisplayed) {
                displayedProducts.add(product);
            }
        }
        return displayedProducts;
    }

    private List<Product> filterDeletedProducts(List<Product> products) throws SQLException {
        List<Product> deletedProducts = new ArrayList<>();
        for (Product product : products
        ) {
            boolean isDeleted = productDetailService.findById(product.getId()).getStatus() == 0;
            if (isDeleted) {
                deletedProducts.add(product);
            }
        }
        return deletedProducts;
    }


}
