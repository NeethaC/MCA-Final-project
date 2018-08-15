<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add department</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="add_dept_servlet">
  <table width="273" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
  
    <tr>
      <td colspan="2" align="center"> <h2><u>Add Department</u></h2></td>
    </tr>
   
    <tr>
      <td width="400">DepartmentName:</td>
      <td width="144"><label for="deptname"></label>
      <input type="text" name="deptname" id="deptname"/></td>
    </tr>
    
  
    <tr>
      <td colspan="2" align="center"><input type="submit" name="btnsubmit" id="btnsubmit" value="Submit" /></td>
    </tr>
    
  </table>
</form>

</body>
</html>