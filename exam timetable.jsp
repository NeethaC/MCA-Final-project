<%@page import="java.util.ArrayList"%>
<%@page import="model.Dept_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Exam timetable</title>
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
                var url="ajax_view_exam_1.jsp"
                url +="?c=" +mid2
                xmlHttp.onreadystatechange = stateChange1;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange1(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("exam").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                    //alert(xmlHttp.responseText);
                }
            }
            
      function shows2(mid2){
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
                var url="ajax_timetable_subject.jsp"
                url +="?c=" +mid2
                xmlHttp.onreadystatechange = stateChange2;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange2(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("sy").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                   // alert(xmlHttp.responseText);
                }
            }
            
       
                    </script>
</head>

<body>
<form id="form1" name="form1" method="post" action="add_timetable_servlet">
<table width="530" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
    <tr>
      <td width="400">Department:</td>
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
      <td width="400"> Course:</td>
      <td width="144"><label for="deptname"></label>
     <select name="course" id="course" onclick="shows1(this.value)">
        <option value="">Select</option>
        </select></td>
    </tr>
    <tr>
      <td>Exam:</td>
      <td><label for="semester"></label>
	 <select name="exam" id="exam" onclick="shows2(this.value)">
        <option value="">Select</option>
        </select></td>  
    </tr> 
</table>
       <div id="sy">
    
    </div>
</form>
</body>

</html>