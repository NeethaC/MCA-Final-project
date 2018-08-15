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
      <td colspan="2" align="center"> <h2><u>View Department</u></h2></td>
    </tr>
      <%
    Dbcon.Dboperations db=new Dboperations();
    ArrayList<Dept_model> cm=new ArrayList<Dept_model>();
    cm=db.view_dept();
    
    %>
    <tr>
      <td>SL.no</td>
      <td>Name</td>
     
    </tr>
      <%
      int i=1;
      if(cm.size()>0)
      {
          
      for(Dept_model cc:cm)
      {
          
      
      %>
    <tr>
      <td><%=i++%></td>
      <td><%=cc.getDeptname()%></td>
      
      
    </tr>
      <%
      
      }}%>
  </table>
</form>
</body>
</html>
