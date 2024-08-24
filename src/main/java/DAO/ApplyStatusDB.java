package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ApplyStatusDB {
    public boolean ApplyStatusDB(String id,String status) throws SQLException, ClassNotFoundException {
        String sql = "update job_apply set JobStatus= ? where a_id= ?  ";

        Connection con = MyDatabase.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, status);
        ps.setString(2, id);

        int updateStatus = ps.executeUpdate();
        return  updateStatus>0;
    }
}
