<%@page import="java.util.ArrayList"%>
<%@page import="model.Course_model"%>
<%@page import="Dbcon.Dboperations"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>view exam timetable</title>

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
                var url="ajax_view_timetable.jsp"
                url +="?s=" +mid2+"&c="+document.getElementById("course").value;
                xmlHttp.onreadystatechange = stateChange;
                xmlHttp.open("GET", url, true);
                xmlHttp.send(null);
            }
            
            function stateChange(){
                if(xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){
                    document.getElementById("time_table").innerHTML=xmlHttp.responseText 
                   //document.getElementById("course").value=xmlHttp.responseText
                 //alert(xmlHttp.responseText);
                }
            } 
                    </script>
</head>

<body>
<form id="form1" name="form1" method="post" action="">
<table width="530" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
    <tr>
      <td width="400">Course:</td>
      <td width="144"><label for="course"></label>
      <select name="course" id="course" >
        <option value="1">Select</option>
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
      </select></td>
    </tr>
   
    
    <tr>
      <td width="400">Semester:</td>
      <td width="144"><label for="examname"></label>
          <select name="sem" id="sem" onchange="shows(this.value)">
              <option value="Select">Select</option>
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
          </select>
          </td>
    </tr>
   
    </table>
    <br  />
    <table id="time_table" align="center" cellpadding="10" cellspacing="10">
    </table>
  <!--  <table width="630" border="1" align="center" id="timetable">
	
    </table>-->
   </form>
</body>
</html>