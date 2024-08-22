package DAO;

import Model.JobUpdateModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class JobUpadateDB {

    public boolean updatejob(JobUpdateModel jobUpdateModel) {
        String updatequery = "UPDATE job_add SET Job_Title=?,EmploymentType=?,Minsalary=?,Maxsalary=?,JobDescripton=?,Qualification_and_Skill=?,Benefits=?,PosterImg=? WHERE j_id=?";

        try {
            Connection con = MyDatabase.getConnection();
            PreparedStatement ps = con.prepareStatement(updatequery);
            ps.setString(1, jobUpdateModel.getJobTitle());
            ps.setString(2, jobUpdateModel.getEmploymentType());
            ps.setString(3, jobUpdateModel.getMinSalary());
            ps.setString(4, jobUpdateModel.getMaxsalary());
            ps.setString(5, jobUpdateModel.getJobDescription());
            ps.setString(6, jobUpdateModel.getQualification_and_Skill());
            ps.setString(7, jobUpdateModel.getBenefits());
            ps.setBytes(8, jobUpdateModel.getPimg());
            ps.setString(9, jobUpdateModel.getJ_Id());


            int jobUpdate = ps.executeUpdate();
            return jobUpdate > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
