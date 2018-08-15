<%@page import="model.Course_model"%>
<%@page import="model.Dept_model"%>
<%@page import="model.College_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
</head>

<body>
    
<form id="form1" name="form1" method="post" action="">
     <table width="273" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
  
    <tr>
      <td colspan="2" align="center"> <h2><u>View Course</u></h2></td>
    </tr>
  <tr>
    <td>Department</td>
    <td><label>
      <select name="select">
          <option>Select</option>
           <%
    Dbcon.Dboperations db=new Dboperations();
    ArrayList<Dept_model> cm=new ArrayList<Dept_model>();
    cm=db.view_dept();
    
      int i=1;
      if(cm.size()>0)
      {
          
      for(Dept_model cc:cm)
      {
          
      
      %>
   
    <option value="<%=cc.getDepartment_id() %>"><%=cc.getDeptname() %></option>
    <%
      }}
    %>
      </select>
    </label></td>
  </tr>
  <tr>
    <td colspan="2"><label>
      <div align="center">
        <input type="submit" name="Submit" value="View" />
        </div>
    </label></td>
  </tr>
</table>
      <table width="200" border="0" align="center" cellpadding="10" cellspacing="10">
      <%
    if(request.getParameter("Submit")!=null){
        int id=Integer.parseInt(request.getParameter("select"));
    ArrayList<Course_model> cmm=new ArrayList<Course_model>();
    cmm=db.view_course(id);
    
    %>
    <tr>
      <td>SL.no</td>
      <td>Name</td>
      <td>No.of Semester</td>
  
    </tr>
      <%
      int j=1;
      if(cmm.size()>0)
      {
          
      for(Course_model cc:cmm)
      {
          
      
      %>
    <tr>
      <td><%=j++%></td>
      <td><%=cc.getCname()%></td>
      <td><%=cc.getSem()%></td>
   
    </tr>
      <%
      }
      }}%>
  </table>
</form>
</body>
</html>
