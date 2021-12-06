package model;

public class ProductDetail {
    private int size;
    private int productId;
    private int inStock;
    private double price;
    private String color;


    public ProductDetail() {
    }

    public ProductDetail(int size, int productId, int inStock, double price, String color) {
        this.size = size;
        this.productId = productId;
        this.inStock = inStock;
        this.price = price;
        this.color = color;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
