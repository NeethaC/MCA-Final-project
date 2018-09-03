<%@page import="java.lang.String"%>
<%@page import="model.Student_model"%>
<%@page import="model.Subject_internal_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View mark</title>
<script>
    function percentage()
    {
        var size=parseFloat(document.getElementById("size").value);
        for(i=0;i<size;i++){
            if(document.getElementById("external"+i).value!=""){
                var internal=parseFloat(document.getElementById("intmark"+i).value);
                var external=parseFloat(document.getElementById("external"+i).value);
               
                var percentage=internal+external;
             
                document.getElementById("total"+i).value=percentage;
            }
        }
    }
</script>
</head>

    <body onload="return percentage()">
<form id="form1" name="form1" method="post" action="" >

  <table width="679" border="1" align="center" cellpadding="4" cellspacing="7">
  <tr>
      <th width="93" id="sname">Sl.no</th>
	<th width="93" id="sname">Subject Code</th>
	<th width="188" id="scode">Subject Name</th>
	<th width="105" id="dat">Internal Mark</th>
     <th width="113" id="dat">External Mark</th>
    <th width="86" id="dat">Total Mark</th>
    
	</tr>
       <%
   
   String login_id=session.getAttribute("lid").toString();
   Dbcon.Dboperations db=new Dboperations();
   String sem="";
   int course=0;
   ArrayList<Student_model> si=new ArrayList<Student_model>();
   si=db.view_student_1(Integer.parseInt(login_id));
   if(si.size()>0)
      {
          
      for(Student_model cc:si)
      {
          sem=cc.getSem();
          course=cc.getCourse_id();
      }
      }
   ArrayList<Subject_internal_model> si1=new ArrayList<Subject_internal_model>();
   si1=db.view_student_internal(course, Integer.parseInt(sem), Integer.parseInt(login_id));
   int i=1;
   int p=0;
      if(si1.size()>0)
      {
      ArrayList<String> status1=new ArrayList<String>();
      for(Subject_internal_model cc1:si1)
      {
         status1.add(cc1.getStatus());
   %>
   <input type="hidden" name="size" id="size" value="<%=si1.size()%>"/>
   <tr>
   <td><%=i++%></td>
   <td><%=cc1.getSubjectcode() %></td>
   <td><%=cc1.getSubjectname() %></td>
   <td><input type="text" value="<%=cc1.getInternal() %>" id="intmark<%=p%>"/></td>
   <td><input type="text" value="<%=cc1.getExternal() %>" id="external<%=p%>"/></td>
   <td><input type="text" name="total" id="total<%=p%>"/></td>

   </tr>
   
   <%
   p++;
   
   }
      if(status1.contains("failed"))
      {
      %>
      <tr>
          <td colspan="6" align="center">Failed</td></tr>
      <%
      }
      else
      {
         %> 
         <tr>
          <td colspan="6" align="center">Passed</td></tr>
         <%
      }
      }
   
   %>
    </table>
  </form>
</body>

</html>