<%-- 
    Document   : student_view_exam
    Created on : 28 Aug, 2018, 3:59:42 PM
    Author     : Neetha
--%>

<%@page import="model.Exam_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Student_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="form1" method="post" action="">
  <table cellpadding="10" border="0" align="center">
    <tr>
      <th>Exam Name </th>
      <th>Message</th>
       <th></th>
    </tr>
           <%
   
   String login_id=session.getAttribute("lid").toString();
   Dbcon.Dboperations db=new Dboperations();
   String sem="";
   int course=0;
   String batch="";
   ArrayList<Student_model> si=new ArrayList<Student_model>();
   si=db.view_student_1(Integer.parseInt(login_id));
   if(si.size()>0)
      {
          
      for(Student_model cc:si)
      {
          sem=cc.getSem();
          course=cc.getCourse_id();
          batch=cc.getBatch();
          
      }
      }
   ArrayList<Exam_model> si1=new ArrayList<Exam_model>();
   si1=db.student_view_exam(course, Integer.parseInt(sem), batch);
   int i=1;
   
      if(si1.size()>0)
      {
      
      for(Exam_model cc1:si1)
      {
         
   %>
    <tr>
      <td><%=cc1.getExamname() %></td>
      <td><%=cc1.getMessage() %></td>
      <td><a href="student_view_timetable.jsp?eid=<%=cc1.getExam_id() %>">View Timetable</a></td>
    </tr>
    <%
      }}
    %>
  </table>
</form>

    </body>
</html>
