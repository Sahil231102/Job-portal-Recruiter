package DAO;

import Model.LoginModel;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDB {
    public boolean LoginDB(LoginModel LoginModel) {
        String sql = "select * from recuruiter where Email = ? and Password = ?";

        try
        {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, LoginModel.getVendor_email());
            ps.setString(2, LoginModel.getVendor_password());

            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

}
