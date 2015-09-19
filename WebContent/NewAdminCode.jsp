<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.Business.*,shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
String s = (String)request.getParameter("account");
//String s = new String(request.getParameter("account").getBytes("ISO-8859-1"),"utf-8");
Administrator ad = new Administrator(s, SavePWD.encode(request.getParameter("password")),"pending");
AdministratorDAO dao = new AdministratorDAOimpl();
dao.add(ad);
//session.setAttribute("LogOK", "yes"); 	//設定一般權限登入屬性
//session.setAttribute("acc", s);			//設定紀錄登入帳號屬性
session.invalidate();
response.sendRedirect("NewAdminMSG.jsp");		
%>    


