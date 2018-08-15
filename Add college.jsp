<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Add college</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="add_college_servlet">
  <table width="273" height="138" border="0" align="center" cellpadding="4" cellspacing="7">
  
    <tr>
      <td colspan="2" align="center"> <h2><u>Add College</u></h2></td>
    </tr>
    <tr>
      <td width="400">College Name:</td>
      <td width="144"><label for="cname"></label>
      <input type="text" name="cname" id="cname" /></td>
    </tr>
    <tr>
      <td width="400">Place:</td>
      <td width="144"><label for="place"></label>
      <input type="text" name="place" id="place" /></td>
    </tr>
    <tr>
      <td width="400">Email:</td>
      <td width="144"><label for="email"></label>
      <input type="text" name="email" id="email" /></td>
    </tr>
    <tr>
      <td width="400">Pin-code:</td>
      <td width="144"><label for="pincode"></label>
      <input type="text" name="pincode" id="pincode" /></td>
    </tr>
       <tr>
      <td width="400">Phone:</td>
      <td width="144"><label for="pincode"></label>
      <input type="text" name="phone" id="pincode" /></td>
    </tr>
    <tr>
      <td>Password:</td>
      <td><label for="password"></label>
      <input type="password" name="password" id="password" /></td>
    </tr>
    <tr>
      <td>Confirm Password:</td>
      <td><label for="cpassword"></label>
      <input type="password" name="cpassword" id="cpassword" /></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="btnadd" id="btnadd" value="Add" /></td>
    </tr>
    
  </table>
</form>

</body>
</html>