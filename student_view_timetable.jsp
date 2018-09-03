<%-- 
    Document   : student_view_timetable
    Created on : 28 Aug, 2018, 5:14:56 PM
    Author     : Neetha

<%@page import="java.util.ArrayList"%>
<%@page import="model.View_timetable_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table width="200" border="0" align="center" cellpadding="10">
  <tr>
    <th>Sl.no</th>
    <th>Subject Name </th>
    <th>Subject Code </th>
    <th>Date</th>
    <th>Time</th>
  </tr>
  <%
  String exam_id=request.getParameter("eid");
  Dboperations db=new Dboperations();
  ArrayList<View_timetable_model> si=new ArrayList<View_timetable_model>();
  si=db.student_view_timetable(Integer.parseInt(exam_id));
  int i=1;
   if(si.size()>0)
      {
          
      for(View_timetable_model cc:si)
      {
  %>
  <tr>
    <td><%=i++%></td>
    <td><%=cc.getSubject() %></td>
    <td><%=cc.getCode() %></td>
    <td><%=cc.getDate() %></td>
    <td><%=cc.getTime() %></td>
  </tr>
  <%
      }}
  %>
</table>

    </body>
</html>
