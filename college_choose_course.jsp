<%@page import="model.Dept_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Course_model"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Choose department</title>
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
                var url="ajax_course_college.jsp"
                url +="?c=" +mid2
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("course").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                   // alert(xmlHttp.responseText);
                }
            } 
                    </script>
</head>

<body>
<form id="form1" name="form1" method="post" action="college_choose_course_servlet">
   <table width="273" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
  
    <tr>
      <td colspan="2" align="center"> <h2><u>View Course</u></h2></td>
    </tr>
  <tr>
    <td>Department</td>
    <td><label>
            <select name="select" onchange="shows(this.value)">
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
 
</table>
      <table width="200" border="0" align="center" cellpadding="15" cellspacing="15" id="course">
 
  </table>
  </form>
</body>
</html>