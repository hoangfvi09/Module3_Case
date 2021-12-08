package model;

public class Review {
    private int userId;
    private int productId;
    private String content;
    private int rate;

    public Review(int userId, int productId, String content, int rate) {
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.rate = rate;

    }

    public Review() {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }


}
