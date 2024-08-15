package DAO;


import Model.ProfileUpdateModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProfileUpdateDB {

    String sql = "UPDATE recuruiter SET Company_Name=?,Phone_Number=?,Address=?,City=?,State=?,Country=?,Cimg=? WHERE r_id=?";

    public boolean ProfileUpdateDB( ProfileUpdateModel ProfileUpdateModel) throws SQLException, ClassNotFoundException {
        Connection con = MyDatabase.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, ProfileUpdateModel.getCname());
        ps.setString(2,ProfileUpdateModel.getPhone());
        ps.setString(3, ProfileUpdateModel.getAddress());
        ps.setString(4,ProfileUpdateModel.getCity());
        ps.setString(5,ProfileUpdateModel.getState());
        ps.setString(6,ProfileUpdateModel.getCountry());
        ps.setBytes(7,ProfileUpdateModel.getNewimg());
        ps.setString(8,ProfileUpdateModel.getId());

        int updatestatus = ps.executeUpdate();

        return  updatestatus>0;
    }




}
