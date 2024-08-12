package Model;

public class LoginModel {
    private String email;
    private String password;
    public LoginModel(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getVendor_email() {
        return email;
    }

    public void setVendor_email(String email) {
        this.email = email;
    }

    public String getVendor_password() {
        return password;
    }

    public void setVendor_password(String password) {
        this.password = password;
    }
}
