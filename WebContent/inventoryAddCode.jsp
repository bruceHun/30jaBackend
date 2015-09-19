<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
	if (session.getAttribute("LogOK") == null) {
		response.sendRedirect("login.jsp");
	}


int cid = Integer.valueOf(request.getParameter("t1"));
int quan = Integer.valueOf(request.getParameter("t2"));


InventoryDAO id = new InventoryDAOimpl();
Inventory i = id.searchbyProductID(cid);	//利用產品編號找到庫存資料	

int num = quan + i.getUnitsInStock();     	//進貨量+庫存量
out.println(num);
i.setUnitsInStock(num);						//取代原庫存量

id.update(i);								//將結果新增至資料庫

response.sendRedirect("InventoryList.jsp");
%>