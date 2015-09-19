<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
String acc = (String)request.getParameter("acc");
//String acc = new String(request.getParameter("acc").getBytes("ISO-8859-1"),"utf-8");
String s = request.getParameter("select");
AdministratorDAO ad = new AdministratorDAOimpl();
Administrator a = ad.searchbyAccount(acc);
a.setLevel(s);
ad.update(a);

response.sendRedirect("AdminEdit.jsp");
%>