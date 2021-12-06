package model;

public class CartUpdated {
    private int userId;
    private int productId;
    private int quantity;
    private int size;
    private int colorId;

    public CartUpdated() {
    }

    public CartUpdated(int userId, int productId, int quantity, int size, int colorId) {
        this.userId = userId;
        this.productId = productId;
        this.quantity = quantity;
        this.size = size;
        this.colorId = colorId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getColorId() {
        return colorId;
    }

    public void setColorId(int colorId) {
        this.colorId = colorId;
    }
}
