package DAO;

import Model.SignUpModel;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class SignUpDB {

    public boolean SignUpDB(SignUpModel SignupModel) throws SQLException, ClassNotFoundException {
        String sql ="INSERT INTO recuruiter (Company_Name, Email, Phone_Number, state, City, Country, Password, CImg, Address) VALUES (?,?,?,?,?,?,?,?,?)";
        try
        {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, SignupModel.getCompany_Name());
            ps.setString(2, SignupModel.getEmail());
            ps.setString(3, SignupModel.getPhone());
            ps.setString(4, SignupModel.getState());
            ps.setString(5, SignupModel.getCity());
            ps.setString(6, SignupModel.getCountry());
            ps.setString(7, SignupModel.getPassword());
            ps.setBytes(8, SignupModel.getCompanyimg());
            ps.setString(9,SignupModel.getCompany_Address());

            int VendorSignUpData = ps.executeUpdate();
            return VendorSignUpData > 0;
        }
        catch (Exception e)
        {
            System.out.println(e);
        }

        return false;
    }

}
