<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
    <%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
%>

<%
int id = Integer.valueOf(request.getParameter("id"));

MembershipDAO md = new MembershipDAOimpl();
Membership m = md.searchbyID(id);
md.delete(m);

response.sendRedirect("MembershipList.jsp");
%>

