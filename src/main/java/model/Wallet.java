package model;

public class Wallet {
    private int userId;
    private double balance;

    public Wallet() {
    }

    public Wallet(int userId, double balance) {
        this.userId = userId;
        this.balance = balance;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public static class User {
        private int id;
        private String name;
        private String email;
        private String password;
        private int role;
        private String image;

        public User() {
        }

        public User(int id, String name, String email, String password, int role, String image) {
            this.id = id;
            this.name = name;
            this.email = email;
            this.password = password;
            this.role = role;
            this.image = image;
        }

        public User(String name, String email, String password, int role, String image) {
            this.name = name;
            this.email = email;
            this.password = password;
            this.role = role;
            this.image = image;
        }

        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPassword() {
            return password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public int getRole() {
            return role;
        }

        public void setRole(int role) {
            this.role = role;
        }

        public String getImage() {
            return image;
        }

        public void setImage(String image) {
            this.image = image;
        }
    }
}
