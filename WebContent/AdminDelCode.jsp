<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
    <%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
%>

<%
AdministratorDAO ad = new AdministratorDAOimpl();
Administrator a = ad.searchbyAccount((String)request.getParameter("id"));
ad.delete(a);
response.sendRedirect("AdminEdit.jsp");
%>

