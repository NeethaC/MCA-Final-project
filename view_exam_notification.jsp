<%-- 
    Document   : view_exam_notification
    Created on : 12 Aug, 2018, 12:44:41 PM
    Author     : Neetha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Course_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 <script language="javascript" type="text/javascript">
            var xmlHttp;
            function shows(mid2){
                //alert(mid2);
                if (typeof XMLHttpRequest != "undefined"){
                xmlHttp= new XMLHttpRequest();
                }
                else if (window.ActiveXObject){
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }
                if (xmlHttp==null){
                    //alert("Browser does not support XMLHTTP Request")
                    return;
                }
                var url="ajax_view_exam.jsp"
                url +="?c=" +mid2
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("exam").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                   // alert(xmlHttp.responseText);
                }
            } 
                    </script>
    </head>
    <body>
        <table width="200" border="0"  align="center" >
  <tr>
    <td>Course Name </td>
    <td><label>
      <select name="select" onchange="shows(this.value)">
          <option>Select</option>
          <%
    
    String college=session.getAttribute("lid").toString();
    Dbcon.Dboperations db=new Dboperations();
    ArrayList<Course_model> cm=new ArrayList<Course_model>();
    cm=db.view_course_college(Integer.parseInt(college));
    
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
      </select>
    </label></td>
  </tr>
</table>
      <table width="200" border="0" align="center" id="exam" cellpadding="10" cellspacing="10">
  
</table>
    </body>
</html>
