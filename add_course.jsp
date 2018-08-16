<%-- 
    Document   : add_course
    Created on : 10 Aug, 2018, 3:55:50 PM
    Author     : Neetha
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Dept_model"%>
<%@page import="Dbcon.Dboperations"%>

          <select name="select"  id="course" onchange="shows1(this.value)" >
              <option>Select</option>
              <%
              Dbcon.Dboperations db=new Dboperations();
              ArrayList<Dept_model> cm=new ArrayList<Dept_model>();
              cm=db.view_dept();
              if(cm.size()>0)
                 {
          
                      for(Dept_model cc:cm)
                           {
              
              %>
              
              <option value="<%=cc.getDepartment_id()%>"><%=cc.getDeptname()%></option>
              <%
                           }
                 }
              %>
          </select>