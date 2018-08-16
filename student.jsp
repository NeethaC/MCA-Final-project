<%@page import="java.util.ArrayList"%>
<%@page import="model.Course_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>student</title>

</head>

<body>
    <form action="add_student_servlet" method="post" enctype="multipart/form-data" name="form1" id="form1">
<table  border="0" align="center" cellpadding="10" cellspacing="10">
  
    <tr>
      <td colspan="2" align="center"> <h2><u>Add Student</u></h2></td>
    </tr>
    <tr>
      <td width="111">Course:</td>
      <td><label for="course"></label>
      <select name="course" id="course">
        <option value="">Select</option>
        
         <%
    
    String lid=session.getAttribute("lid").toString();
    Dbcon.Dboperations db=new Dboperations();
    ArrayList<Course_model> cm=new ArrayList<Course_model>();
    cm=db.view_course_college(Integer.parseInt(lid));
    
      int i=1;
      if(cm.size()>0)
      {
          
      for(Course_model cc:cm)
      {
          
      
      %>
      <option value="<%=cc.getCourse_id() %>"><%=cc.getCname() %></option>
      <%
      }}
      %>
      </select></td>
    </tr>
    
    <tr>
      <td>Semester:</td>
       <td><label for="sname"></label>
           <input type="number" name="sem" id="sem" min="1"/></td>
    </tr>
    <tr>
      <td width="111">First Name:</td>
      <td><label for="fname"></label>
      <input type="text" name="fname" id="fname" /></td>
    </tr>
    <tr>
      <td width="111">Second Name:</td>
      <td><label for="sname"></label>
      <input type="text" name="sname" id="sname" /></td>
    </tr>
    <tr>
      <td>Gender</td>
      <td><p>
        <label>
          <input name="RadioGroup1" type="radio" id="RadioGroup1_0" value="male" checked="checked" />
          Male</label>
        <br />
        <label>
          <input type="radio" name="RadioGroup1" value="female" id="RadioGroup1_1" />
          Female</label>
        <br />
      </p></td>
    </tr>
    <tr>
      <td width="111">Date Of Birth:</td>
      <td><label for="dob"></label>
      <input type="date" name="dob" id="dob" /></td>
    </tr>
    <tr>
      <td width="111">Place:</td>
      <td><label for="place"></label>
      <input type="text" name="place" id="place" /></td>
    </tr>
    <tr>
      <td width="111">Pincode:</td>
      <td><label for="pin"></label>
      <input type="text" name="pin" id="pin" /></td>
    </tr>
    <tr>
      <td width="111">Email Id:</td>
      <td><label for="email"></label>
      <input type="text" name="email" id="email" /></td>
    </tr>
    <tr>
      <td width="111">Mobile No:</td>
      <td><label for="mobile"></label>
      <input type="text" name="mobile" id="mobile" /></td>
    </tr>
     <tr>
      <td width="111">Register No:</td>
      <td><label for="reg"></label>
      <input type="text" name="reg" id="reg" /></td>
    </tr>
     <tr>
       <td>Image:</td>
       <td><input type="file" name="img" id="img" /></td>
     </tr>
     <tr>
      <td width="111">Batch:</td>
      <td><label for="batch"></label>
      <input type="text" name="batch" id="batch" /></td>
    </tr>
    <tr>
      <td width="111">Password:</td>
      <td><label for="passwrd"></label>
      <input type="text" name="pass" id="pass" /></td>
    </tr>
    <tr>
        <td  align="center" colspan="2"><input type="submit" name="btnsubmit" id="btnsubmit" value="Add" /></td>
      
    </tr>
    
  </table>
</form>
</body>
</html>