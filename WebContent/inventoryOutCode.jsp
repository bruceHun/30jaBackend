<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="shopping.DAO.*,shopping.Class.*, java.util.*,java.text.DateFormat,java.text.SimpleDateFormat"%>

<%

//retrieve your list from the request, with casting 
ArrayList<String[]> list = new ArrayList<String[]>();
list = (ArrayList<String[]>) session.getAttribute("addlist");
InventoryDAO id = new InventoryDAOimpl();
ProductDAO pd = new ProductDAOimpl();

	//庫存異動
for(String[] s : list) {
	Inventory i = id.searchbyProductID(Integer.valueOf(s[0]));
	i.setUnitsInStock((i.getUnitsInStock())-(Integer.valueOf(s[3])));
	out.print(i);
	id.update(i);
 out.println(s[0]+". "+s[1]+"--"+s[2]+" * "+s[3]+"<p/>");
 
 	//記錄出貨日期
 OrderDAO od = new OrderDAOimpl();
 Order o = od.searchbyID((int)session.getAttribute("index"));
 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");	//設定日期格式
 Date date = new Date();										//建立日期物件
 String d = dateFormat.format(date); 							
 System.out.print(d);
 o.setShipDate(d);												//加入出貨日期
 od.update(o);													//更新訂單
}
session.setAttribute("addlist", null);
session.setAttribute("index", null);
response.sendRedirect("inventoryOut.jsp");

%>