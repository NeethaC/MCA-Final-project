<%@page import="model.Subject_model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Dept_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Subjects</title>
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
                   // alert(xmlHttp.responseText);
                }
            } 
                    </script>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
<table  border="0" align="center" cellpadding="2" cellspacing="2">
	<tr>
            <td colspan="2" align="center"><h3><u>View Subjects</u></h3></td>
    <tr>
      <td width="400">Department</td>
      <td width="144"><label for="course"></label>
      <select name="dept" id="dept" onchange="shows(this.value)">
        <option value="">Select</option>
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
      </select></td>
    </tr>
    <tr>
      <td width="400">Course</td>
      <td width="144"><label for="deptname"></label>
     <select name="course" id="course">
        <option value="">Select</option>
        </select></td>
    </tr>
     <tr>
      <td colspan="2" align="center"><input type="submit" name="btnadd" id="btnadd" value="View" /></td>
    </tr>
    
    </table>
    <br />
    
    <table width="200" border="0" align="center" cellpadding="10" cellspacing="10">
      <%
    if(request.getParameter("btnadd")!=null){
        int id=Integer.parseInt(request.getParameter("course"));
        
        ArrayList<Subject_model> cmm=new ArrayList<Subject_model>();
        cmm=db.view_subject(id);
    
    
    %>
    <tr>
      <td>SL.no</td>
      <td>Subject Name</td>
      <td>Subject Code</td>
      <td>Semester</td>
      <td>Internal Mark</td>
      <td>External Mark</td>
  
    </tr>
      <%
      int j=1;
      if(cmm.size()>0)
      {
          
      for(Subject_model cc:cmm)
      {
          
      
      %>
    <tr>
      <td><%=j++%></td>
      <td><%=cc.getSubject()%></td>
      <td><%=cc.getCode()%></td>
      <td><%=cc.getSem()%></td>
      <td><%=cc.getInternal()%></td>
      <td><%=cc.getExternal()%></td>
   
    </tr>
     <%
      }}
     %>
  </table>
  <% } %>
</body>
</html>