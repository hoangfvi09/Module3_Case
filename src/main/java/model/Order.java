package model;

public class Order {
    private int id;
    private int userId;
    private String time;
    private String address;
    private String phoneNo;
    private int status;

    public Order() {
    }

    public Order(int id, int userId, String time, String address, String phoneNo, int status) {
        this.id = id;
        this.userId = userId;
        this.time = time;
        this.address = address;
        this.phoneNo = phoneNo;
        this.status = status;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }


    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTime() {
        return time;
    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
}
