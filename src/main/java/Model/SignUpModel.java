package Model;

public class SignUpModel {

    private String Company_Name;
    private String Email;
    private String phone;
    private String Password;
    private String Company_Address;
    private String state;
    private String Country;
    private String city;
    private byte[] Companyimg;



    public SignUpModel(String companyname, String email, String phone, String password, String companyAddress, String state, String country, String city, byte[] comimg) {

        this.Company_Name = companyname;
        this.Email = email;
        this.phone = phone;
        this.Password =password;
        this.Company_Address = companyAddress;
        this.state = state;
        this.Country = country;
        this.city = city;

        this.Companyimg = comimg;
    }


    public String getCompany_Name() {
        return Company_Name;
    }

    public void setCompany_Name(String company_Name) {
        Company_Name = company_Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getCompany_Address() {
        return Company_Address;
    }

    public void setCompany_Address(String company_Address) {
        Company_Address = company_Address;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String country) {
        Country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }



    public byte[] getCompanyimg() {
        return Companyimg;
    }

    public void setCompanyimg(byte[] companyimg) {
        Companyimg = companyimg;
    }
}
