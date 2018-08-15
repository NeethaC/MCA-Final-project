/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dbcon;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.College_model;
import model.Course_college_model;
import model.Course_model;
import model.Dept_model;
import model.Exam_model;
import model.Login_model;
import model.Student_model;
import model.Subject_model;
import model.Timetable_model;

/**
 *
 * @author Stephy Mariya Sunny
 */
public class Dboperations {
    Statement st,st1,st2,stt;
    ResultSet res,rs,rs1;
    public Dboperations() throws SQLException
    {
        try
        {
        Dbcon.Dcconn db=new Dbcon.Dcconn();
        Connection con=db.getc();
        st=con.createStatement();
        }
        catch(Exception e)
        {
            
        }
        
    }
    public String login(Login_model ln) throws SQLException
    {
        String lid="",type="",full="";
        try {
            res=st.executeQuery("SELECT * FROM `login_tbl` WHERE `username`='"+ln.getUsername()+"' AND `password`='"+ln.getPassword()+"'");
        if(res.next())
        {
            lid=res.getString(1);
            type=res.getString(4);
            full=lid+"#"+type;
        }
        } catch (Exception e) {
            return e.toString();
        }
        return full;
        
    }
    public int add_login(Login_model ln)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `login_tbl`(`username`,`password`,`type`)VALUES('"+ln.getUsername()+"','"+ln.getPassword()+"','"+ln.getType()+"')");
            res=st.executeQuery("SELECT MAX(`login_id`)FROM `login_tbl`");
            if(res.next())
            {
                flag=Integer.parseInt(res.getString(1));
            }
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
    public int add_college(College_model cg)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `college_tbl`(`login_id`,`collegename`,`place`,`pincode`,`email`,`phone`)VALUES('"+cg.getLogin_id()+"','"+cg.getCollegename()+"','"+cg.getPlace()+"','"+cg.getPincode()+"','"+cg.getEmail()+"','"+cg.getPhone()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
     public ArrayList<College_model> view_college() throws SQLException
    {
        ArrayList<College_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `college_tbl`");
        while(res.next())
        {
            College_model cc=new College_model();
            cc.setCollegename(res.getString(3));
            cc.setPlace(res.getString(4));
            cc.setEmail(res.getString(6));
            cc.setPincode(res.getString(5));
            cc.setPhone(res.getString(7));
            cc.setLogin_id(Integer.parseInt(res.getString(2)));
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
     
    public ArrayList<College_model> view_college_1(int id) throws SQLException
    {
        ArrayList<College_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `college_tbl` WHERE `login_id`='"+id+"'");
        while(res.next())
        {
            College_model cc=new College_model();
            cc.setCollegename(res.getString(3));
            cc.setPlace(res.getString(4));
            cc.setEmail(res.getString(6));
            cc.setPincode(res.getString(5));
            cc.setPhone(res.getString(7));
            cc.setLogin_id(Integer.parseInt(res.getString(2)));
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
     public int update_college(College_model cg)
    {
        int flag=0;
        try {
            st.executeUpdate("UPDATE `college_tbl` SET `collegename`='"+cg.getCollegename()+"',`place`='"+cg.getPlace()+"',`pincode`='"+cg.getPincode()+"',`email`='"+cg.getEmail()+"',`phone`='"+cg.getPhone()+"' WHERE `login_id`='"+cg.getLogin_id()+"'");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
    public int delete_college(int id)
    {
        int flag=0;
        try {
            st.executeUpdate("DELETE FROM `college_tbl` WHERE `login_id`='"+id+"'");
            st.executeUpdate("DELETE FROM `login_tbl` WHERE `login_id`='"+id+"'");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
   public int add_dept(Dept_model dept)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `department_tbl`(`deptname`)VALUES('"+dept.getDeptname()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
  public ArrayList<Dept_model> view_dept() throws SQLException
    {
        ArrayList<Dept_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `department_tbl`");
        while(res.next())
        {
            Dept_model cc=new Dept_model();
            cc.setDeptname(res.getString(2));
            cc.setDepartment_id(Integer.parseInt(res.getString(1)));
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
    

public int add_course(Course_model co)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `course_tbl`(`department_id`,`cname`,`total_sem`,`type`)VALUES('"+co.getDid()+"','"+co.getCname()+"','"+co.getSem()+"','"+co.getType()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
public ArrayList<Course_model> view_course(int id) throws SQLException
    {
        ArrayList<Course_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `course_tbl` WHERE `department_id`='"+id+"'");
        while(res.next())
        {
            Course_model cc=new Course_model();
            cc.setCname(res.getString(3));
            cc.setCourse_id(Integer.parseInt(res.getString(1)));
            cc.setSem(res.getString(4));
            cc.setType(res.getString(5));
            
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
   public int add_subject(Subject_model su)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `subject_tbl`(`course_id`,`subname`,`subcode`,`sem`,`internalmark`,`externalmark`)VALUES('"+su.getCourse_id()+"','"+su.getSubject()+"','"+su.getCode()+"','"+su.getSem()+"','"+su.getInternal()+"','"+su.getExternal()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    } 
public ArrayList<Subject_model> view_subject(int id) throws SQLException
    {
        ArrayList<Subject_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `subject_tbl` WHERE `course_id`='"+id+"'");
        while(res.next())
        {
            Subject_model cc=new Subject_model();
            cc.setSubject(res.getString(3));
            cc.setCode(res.getString(4));
            cc.setSem(res.getString(5));
            cc.setInternal(res.getString(6));
            cc.setExternal(res.getString(7));
            
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
public int college_choose_course(Course_college_model cc)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `course_college_tbl`(`course_id`,`college_id`)VALUES('"+cc.getCourse_id()+"','"+cc.getCollege_id()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }

public ArrayList<Course_model> view_course_college(int id) throws SQLException
    {
        ArrayList<Course_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT `course_tbl`.* FROM `course_tbl`,`course_college_tbl` WHERE `course_tbl`.`course_id`=`course_college_tbl`.`course_id` AND `course_college_tbl`.`college_id`='"+id+"'");
        while(res.next())
        {
            Course_model cc=new Course_model();
            cc.setCname(res.getString(3));
            cc.setCourse_id(Integer.parseInt(res.getString(1)));
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
public int add_student(Student_model co)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `student_tbl`(`login_id`,`course_id`,`fname`,`sname`,`gender`,`dob`,`place`,`pincode`,`email`,`mobile_no`,`reg_no`,`semester`,`batch`,`img`,`college_id`)VALUES('"+co.getLogin_id()+"','"+co.getCourse_id()+"','"+co.getFname()+"','"+co.getSname()+"','"+co.getGender()+"','"+co.getDob()+"','"+co.getPlace()+"','"+co.getPincode()+"','"+co.getEmail()+"','"+co.getMobile()+"','"+co.getReg_no()+"','"+co.getSem()+"','"+co.getBatch()+"','"+co.getImg()+"','"+co.getCollege_id()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }

public ArrayList<Student_model> view_student(int id) throws SQLException
    {
        ArrayList<Student_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `student_tbl` WHERE `course_id`='"+id+"'");
        while(res.next())
        {
            Student_model cc=new Student_model();
            cc.setFname(res.getString(4));
            cc.setSname(res.getString(5));
            cc.setEmail(res.getString(10));
            cc.setMobile(res.getString(11));
            cc.setReg_no(res.getString(12));
            cc.setSem(res.getString(13));
            cc.setBatch(res.getString(14));
            cc.setImg(res.getString(15));
            cc.setPincode(res.getString(9));
            cc.setPlace(res.getString(8));
            cc.setLogin_id(Integer.parseInt(res.getString(2)));
            
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }

 public ArrayList<Student_model> view_student_1(int id) throws SQLException
    {
        ArrayList<Student_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `student_tbl` WHERE `login_id`='"+id+"'");
        while(res.next())
        {
            Student_model cc=new Student_model();
            cc.setFname(res.getString(4));
            cc.setSname(res.getString(5));
            cc.setEmail(res.getString(10));
            cc.setMobile(res.getString(11));
            cc.setReg_no(res.getString(12));
            cc.setSem(res.getString(13));
            cc.setBatch(res.getString(14));
            cc.setImg(res.getString(15));
            cc.setPincode(res.getString(9));
            cc.setPlace(res.getString(8));
            cc.setLogin_id(Integer.parseInt(res.getString(2)));
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }

public int update_student(Student_model cg)
    {
        int flag=0;
        try {
            st.executeUpdate("UPDATE `student_tbl` SET `semester`='"+cg.getSem()+"' WHERE `login_id`='"+cg.getLogin_id()+"'");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
public int delete_student(int id)
    {
        int flag=0;
        try {
            st.executeUpdate("DELETE FROM `student_tbl` WHERE `login_id`='"+id+"'");
            st.executeUpdate("DELETE FROM `login_tbl` WHERE `login_id`='"+id+"'");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
public int add_exam(Exam_model cc)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `exam_tbl`(`examname`,`year`,`message`,`course_id`,`semester`)VALUES('"+cc.getExamname()+"','"+cc.getYear()+"','"+cc.getMessage()+"','"+cc.getCourse_id()+"','"+cc.getSemester()+"')");
            flag=1;
        } catch (Exception e) {
            
        }
        
        return flag;
        
    }
public ArrayList<Exam_model> view_exam(int id) throws SQLException
    {
        ArrayList<Exam_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `exam_tbl` WHERE `course_id`='"+id+"'");
        while(res.next())
        {
            Exam_model cc=new Exam_model();
            cc.setExamname(res.getString(2));
            cc.setYear(res.getString(3));
            cc.setMessage(res.getString(4));
            cc.setSemester(res.getString(6));
            cc.setExam_id(res.getInt(1));
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }

public ArrayList<Exam_model> view_exam1(int id) throws SQLException
    {
        ArrayList<Exam_model> details=new ArrayList<>();
        try {
            res=st.executeQuery("SELECT * FROM `exam_tbl` WHERE `exam_id`='"+id+"'");
        while(res.next())
        {
            Exam_model cc=new Exam_model();
            cc.setExamname(res.getString(2));
            cc.setYear(res.getString(3));
            cc.setMessage(res.getString(4));
            cc.setSemester(res.getString(6));
            
           
            details.add(cc);
        }
        } catch (Exception e) {
            
        }
        return details;
        
    }
public ArrayList<Subject_model> view_subject_timetable(int id) throws SQLException
    {
        ArrayList<Subject_model> details=new ArrayList<>();
        try {
            rs=st.executeQuery("SELECT `course_id` FROM `exam_tbl` WHERE `exam_id`='"+id+"'");
            rs.next();
            String cid=rs.getString(1);
            rs1=st.executeQuery("SELECT `semester` FROM `exam_tbl` WHERE `exam_id`='"+id+"'");
            rs1.next();
            String sem=rs1.getString(1);
            res=st.executeQuery("SELECT * FROM `subject_tbl` WHERE `course_id`='"+cid+"' AND `sem`='"+sem+"'");
        while(res.next())
        {
            Subject_model cc=new Subject_model();
            cc.setSubject(res.getString(3));
            cc.setCode(res.getString(4));
            cc.setSubject_id(Integer.parseInt(res.getString(1)));
      
            details.add(cc);
        }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return details;
        
    }
public int add_timetable(Timetable_model cc)
    {
        int flag=0;
        try {
            st.executeUpdate("INSERT INTO `timetable_tbl`(`subject_id`,`examid`,`date`,`time`)VALUES('"+cc.getSubject_id()+"','"+cc.getExam_id()+"','"+cc.getDate()+"','"+cc.getTime()+"')");
            flag=1;
        } catch (Exception e) {
            System.err.println(e.getMessage());
            
        }
        
        return flag;
        
    }




}