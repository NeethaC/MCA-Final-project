<%@page import="Dbcon.Dboperations"%>

<%
String lid=request.getParameter("id");
Dboperations db=new Dboperations();
int i=db.delete_college(Integer.parseInt(lid));
if(i>0)
{
    response.sendRedirect("view_college.jsp");
}

%>