package Model;

public class ProfileUpdateModel {

    private String id;
    private String Cname;
    private String phone;
    private String Address;
    private String city;
    private String state;
    private String Country;
    private byte[] newimg;

    public ProfileUpdateModel(String id, String cname, String phone,String address,String city,String state,String country , byte[] newimg) {

        this.id = id;
        this.Cname = cname;
        this.phone = phone;
        this.Address = address;
        this.city = city;
        this.state = state;
        this.Country = country;
        this.newimg = newimg;

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCname() {
        return Cname;
    }

    public void setCname(String cname) {
        Cname = cname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
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

    public byte[] getNewimg() {
        return newimg;
    }

    public void setNewimg(byte[] newimg) {
        this.newimg = newimg;
    }
}

