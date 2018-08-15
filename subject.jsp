<%@page import="java.util.ArrayList"%>
<%@page import="model.Dept_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Subject</title>
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
<form id="form1" name="form1" method="post" action="add_subject_servlet">
 <table width="273" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
  
    <tr>
      <td colspan="2" align="center"> <h2><u>Add Subject</u></h2></td>
    </tr>
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
    <td>Subject Name</td>
    <td><label>
      <input type="text" name="subject">
    </label></td>
  </tr>
  <tr>
    <td>Subject Code</td>
    <td><label>
      <input type="text" name="code">
    </label></td>
  </tr>
    <tr>
    <td>Semester</td>
    <td><label>
      <input type="text" name="sem">
    </label></td>
  </tr>
       <tr>
    <td>Internal Mark</td>
    <td><label>
      <input type="text" name="im">
    </label></td>
  </tr>
       <tr>
    <td>External Mark</td>
    <td><label>
      <input type="text" name="em">
    </label></td>
  </tr>
  <tr>
    <td colspan="2"><label>
      <div align="center">
        <input type="submit" name="Submit" value="Add">
        </div>
    </label></td>
  </tr>
</table>
</form>
</body>
</html>