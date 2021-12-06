package model;

public class ProductDetailUpdated {

    private int productId;
    private int inStock;
    private double price;
    private int status;



    public ProductDetailUpdated() {
    }

    public ProductDetailUpdated(int productId, int inStock, double price, int status) {
        this.productId = productId;
        this.inStock = inStock;
        this.price = price;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getInStock() {
        return inStock;
    }

    public void setInStock(int inStock) {
        this.inStock = inStock;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
