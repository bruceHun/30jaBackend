<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
    <%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
int p1 = Integer.valueOf(request.getParameter("product1"));
int p2 = Integer.valueOf(request.getParameter("product2"));
int p3 = Integer.valueOf(request.getParameter("product3"));
int p4 = Integer.valueOf(request.getParameter("product4"));
int p5 = Integer.valueOf(request.getParameter("product5"));
	
String gsname = (String)request.getParameter("gsname");
//String gsname = new String(request.getParameter("gsname").getBytes("ISO-8859-1"),"utf-8");
GiftSet gs = new GiftSet(Integer.valueOf(request.getParameter("giftsetid")),gsname,
		p1,
		p2,
		p3,
		p4,
		p5,
		Float.valueOf(request.getParameter("price")),
		Byte.valueOf(request.getParameter("discon")));
GiftSetDAO dao = new GiftSetDAOimpl();
System.out.print(gs);
dao.update(gs);
response.sendRedirect("GiftSetList.jsp");
%> 