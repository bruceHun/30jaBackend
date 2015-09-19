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

String pname = (String)request.getParameter("pname");
String unit = (String)request.getParameter("unit");
String capacity = (String)request.getParameter("capacity");
String descri = (String)request.getParameter("descri");
//中文欄位轉碼
//String pname = new String(request.getParameter("pname").getBytes("ISO-8859-1"),"utf-8");
//String unit = new String(request.getParameter("unit").getBytes("ISO-8859-1"),"utf-8");
//String capacity = new String(request.getParameter("capacity").getBytes("ISO-8859-1"),"utf-8");
//String descri = new String(request.getParameter("descri").getBytes("ISO-8859-1"),"utf-8");

//可留空欄位設定預設值為 0
String cost = request.getParameter("cost");
float co = 0;
String stock = request.getParameter("stock");
int st = 0;
String safety = request.getParameter("safety");
int sa = 0;

//有輸入值就取其值
if(cost!=""){co=Float.valueOf(cost);};
if(stock!=""){st=Integer.valueOf(stock);};
if(safety!=""){sa=Integer.valueOf(safety);};

Product p = new Product(null,								//建立產品資料
		request.getParameter("barcode"),
		Integer.valueOf(request.getParameter("categoryid")),
		pname,
		unit,
		capacity,
		Float.valueOf(request.getParameter("price")),
		Byte.valueOf(request.getParameter("discon")),
		descri);

//設定庫存資料
p.getStock().setCost(co);
p.getStock().setUnitsInStock(st);
p.getStock().setUnitsOnOrder(0);
p.getStock().setSaftyStock(sa);
		
ProductDAO dao = new ProductDAOimpl();		
int id = dao.add(p);													//新增至資料庫


response.sendRedirect("PicUpload.jsp?id=s_"+ id);
%> 