<%@page import="java.util.ArrayList"%>
<%@page import="model.College_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>External Mark</title>
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
                var url="ajax_dept.jsp"
                url +="?c=" +mid2;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("deptname").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                   //alert(xmlHttp.responseText);
                }
            } 
            
          function shows1(mid2){
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
                var url="ajax_course_1.jsp"
                url +="?d=" +mid2+"&c="+document.getElementById("college").value;
                xmlHttp.onreadystatechange = stateChange1;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange1(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("course").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                  // alert(xmlHttp.responseText);
                }
            }
            
                function shows2(mid2){
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
                var url="ajax_student_1.jsp"
                url +="?sem=" +mid2+"&c="+document.getElementById("college").value+"&course="+document.getElementById("course").value;
                xmlHttp.onreadystatechange = stateChange2;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange2(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("stu").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                   //alert(xmlHttp.responseText);
                }
            }
                    </script>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
 <table width="373" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
    <tr>
    	<td width="400">College Name:</td>
        <td width="144"><label for="cname"></label>
            <select name="college" id="college" onchange="shows(this.value)">
        <option value="">Select</option>
        <%
    Dbcon.Dboperations db=new Dboperations();
    ArrayList<College_model> cm=new ArrayList<College_model>();
    cm=db.view_college();
    int i=1;
      if(cm.size()>0)
      {
          
      for(College_model cc:cm)
      {
    
    %>
    <option value="<%=cc.getLogin_id()%>"><%=cc.getCollegename()%></option>
    <%
      }}
    %>
        </select></td>
    </tr>
      <tr>
    	<td width="400">Department Name:</td>
        <td width="144"><label for="deptname"></label>
        <select name="deptname" id="deptname" onclick="shows1(this.value)">
        <option value="">Select</option>
        </select></td>
     </tr>
    <tr>
      <td width="400">Course:</td>
      <td width="144"><label for="course"></label>
      <label for="course"></label>
      <select name="course" id="course">
       <option value="">Select</option>
        
      </select></td>
    </tr>
    
     <tr>
    	<td width="400">Semester:</td>
        <td width="144"><label for="semester"></label>
            <input type="number" name="semester" min="1" onchange="shows2(this.value)"/>
       </td>
     </tr>
  </table>
        <table  id="stu" align="center">
    
     </table>
 
</form>
</body>
</html>