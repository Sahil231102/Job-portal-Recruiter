package Model;

public class JobUpdateModel {
    private String j_Id;
    private String JobTitle;

  private String Maxsalary;
  private String MinSalary;
  private String EmploymentType;
    private String jobDescription;
    private String Benefits;
    private String Qualification_and_Skill;
    private byte[] pimg;

    public JobUpdateModel(String j_id,String JobTitle,String EmploymentType ,String MinSalary,String MaxSalary, String jobDescription,String Benefits,String Qualification_and_Skill,byte[] pimg) {

        this.j_Id = j_id;
        this.JobTitle = JobTitle;
        this.EmploymentType = EmploymentType;
        this.Maxsalary = MaxSalary;
        this.MinSalary = MinSalary;
        this.jobDescription = jobDescription;
        this.Qualification_and_Skill = Qualification_and_Skill;
        this.Benefits = Benefits;
        this.pimg = pimg;


    }

    public String getJ_Id() {
        return j_Id;
    }

    public void setJ_Id(String j_Id) {
        this.j_Id = j_Id;
    }

    public String getJobTitle() {
        return JobTitle;
    }

    public void setJobTitle(String jobTitle) {
        JobTitle = jobTitle;
    }

    public String getMaxsalary() {
        return Maxsalary;
    }

    public void setMaxsalary(String maxsalary) {
        Maxsalary = maxsalary;
    }

    public String getMinSalary() {
        return MinSalary;
    }

    public void setMinSalary(String minSalary) {
        MinSalary = minSalary;
    }

    public String getEmploymentType() {
        return EmploymentType;
    }

    public void setEmploymentType(String employmentType) {
        EmploymentType = employmentType;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getBenefits() {
        return Benefits;
    }

    public void setBenefits(String benefits) {
        Benefits = benefits;
    }

    public String getQualification_and_Skill() {
        return Qualification_and_Skill;
    }

    public void setQualification_and_Skill(String qualification_and_Skill) {
        Qualification_and_Skill = qualification_and_Skill;
    }

    public byte[] getPimg() {
        return pimg;
    }

    public void setPimg(byte[] pimg) {
        this.pimg = pimg;
    }
}
