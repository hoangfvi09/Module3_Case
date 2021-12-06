package model;

public class Review {
    private int userId;
    private int productId;
    private String content;
    private int rate;
    private String time;

    public Review(int userId, int productId, String content, int rate, String date) {
        this.userId = userId;
        this.productId = productId;
        this.content = content;
        this.rate = rate;
        this.time = date;
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

    public String getTime() {
        return time;
    }

}
