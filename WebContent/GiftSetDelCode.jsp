<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
    <%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
%>

<%
GiftSetDAO gd = new GiftSetDAOimpl();
GiftSet g = gd.searchbyID(Integer.valueOf(request.getParameter("id")));
gd.delete(g);
response.sendRedirect("GiftSetList.jsp");
%>

