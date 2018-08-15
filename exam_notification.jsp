<%-- 
    Document   : exam_notification
    Created on : 12 Aug, 2018, 12:18:01 PM
    Author     : Stephy Mariya Sunny
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Dept_model"%>
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
               // alert(mid2);
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
                var url="ajax_course.jsp"
                url +="?c=" +mid2
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("course").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                    //alert(xmlHttp.responseText);
                }
            } 
                    </script>
    </head>
    <body>
       <form id="form1" name="form1" method="post" action="add_exam_servlet">
  <table width="200" border="0" align="center" cellpadding="4" cellspacing="7">
    <tr>
      <td>Department</td>
      <td><label>
        <select name="select" onchange="shows(this.value)">
            <option value="select">Select</option>
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
    <td>Course</td>
    <td><label>
            <select name="course" id="course">
                <option value="select">Select</option>
      </select>
    </label></td>
  </tr>
    <tr>
      <td>Exam Name </td>
      <td><label>
        <input type="text" name="textfield" />
      </label></td>
    </tr>
    <tr>
      <td>Year</td>
      <td><label>
        <input type="text" name="textfield2" />
      </label></td>
    </tr>
     <tr>
      <td>Semester</td>
      <td><label>
        <input type="number" name="textfield4" min="1"/>
      </label></td>
    </tr>
    <tr>
      <td>Message</td>
      <td><label>
        <input type="text" name="textfield3" />
      </label></td>
    </tr>
    <tr>
      <td colspan="2"><label>
        <div align="center">
          <input type="submit" name="Submit" value="Add" />
          </div>
      </label></td>
    </tr>
  </table>
</form>
    </body>
</html>
