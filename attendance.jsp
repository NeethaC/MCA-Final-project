<%@page import="model.Attendence_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Student_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Attendance</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="">

    <table  border="0" align="center" cellpadding="10" cellspacing="10">
	<tr>
    
	<th  id="totdays">Total days</th>
    <th  id="pdays">Present Days</th>
	<th  id="percent">Percentage</th>
	
	</tr>
 <%
   
   String login_id=session.getAttribute("lid").toString();
   Dbcon.Dboperations db=new Dboperations();
   String sem="";
   
   ArrayList<Student_model> si=new ArrayList<Student_model>();
   si=db.view_student_1(Integer.parseInt(login_id));
   if(si.size()>0)
      {
          
      for(Student_model cc:si)
      {
          sem=cc.getSem();
          
      }
      }
   ArrayList<Attendence_model> si1=new ArrayList<Attendence_model>();
   si1=db.view_attendence(Integer.parseInt(login_id), Integer.parseInt(sem));
   int i=1;
   int p=0;
      if(si1.size()>0)
      {
      ArrayList<String> status1=new ArrayList<String>();
      for(Attendence_model cc1:si1)
      {
          
    %>
          <tr>
              <td><%=cc1.getTotal() %></td>
              <td><%=cc1.getPresent() %></td>
              <td><%=cc1.getPercentage()+"%" %></td>
          </tr>
          <%
          }}
          %>
      
    </table>
    <table width="600" border="0" align="center">
	
</table>
</form>
</body>
</html>