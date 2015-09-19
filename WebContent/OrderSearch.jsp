<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
	if (session.getAttribute("LogOK") == null) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1,text/html; charset=UTF-8">
<title>訂單管理</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">
			<div class="page-header">
				<h1 align="center">
					訂單管理 
				</h1>
			</div>


			<%
				String Page = request.getParameter("p");
				int pg;
				if (Page == null) {
					pg = 1;
				} else {
					try {
						pg = Integer.valueOf(Page);
					} catch (Exception e) {
						pg = 1;
					}

				}

				OrderDAO od = new OrderDAOimpl();
				Order o = new Order();
				CustomerDAO cd = new CustomerDAOimpl();
				ProductDAO pd = new ProductDAOimpl();
				GiftSetDAO gd = new GiftSetDAOimpl();

				final int PAGE_SIZE = 5;
				int start_loc = (pg - 1) * PAGE_SIZE + 1;
				int TotalRows = 0;
				int TotalPages = 0;
				OrderDetailDAO oddd = new OrderDetailDAOimpl();
				String s = request.getParameter("search");
				//System.out.print(request.getParameter("searchby"));
				String sb = request.getParameter("searchby");

				ArrayList<OrderDetail> list = new ArrayList<OrderDetail>();
				try {
					if (s != "" && s != null) {
						//System.out.print(s);
						if (sb != null && sb.equals("1")) {
							//System.out.print("condition sustained!");
							list = oddd.findByOrderID(Integer.valueOf(s));	//依訂單編號搜尋
							//System.out.print(list);
						} else if (sb != null && sb.equals("2")) {			//依客戶名稱搜尋
							ArrayList<Customer> clist = cd.findByName(s);
							//System.out.print(clist);
							for(Customer c : clist){				//取得所有名稱符合的客戶
								int cid = c.getCustomerID();		
								ArrayList<Order> olist = od.findByCustomerID(cid);
								//System.out.print(olist);
								for(Order order : olist){			//取得各個客戶的訂單資料
									int oid = order.getOrderID();
									list.addAll(oddd.findByOrderID(oid));
								}
							}

						}
					} else {
						list = oddd.getRange(start_loc, PAGE_SIZE);
						TotalRows = oddd.getSize();
						TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
					}
				} catch (Exception e) {
					list = null;
				}

				
			%>

			<div class="container">

				<div>
					<form class="form-inline" id="searchbyid" action="OrderSearch.jsp" method="get">
						<div class="form-group">
							<div class="form-group">
								<input type="radio" name="searchby" id="searchbyid" value="1"
									checked> 　訂單編號　 <input type="radio" name="searchby"
									id="searchbyid" value="2"> 　依客戶姓名　
							</div>
							<div class="form-group">
								<label class="sr-only"></label>
								<input type="text" class="form-control" placeholder="請在此輸入"
									id="search" name="search">
							</div>
							
						</div>
					<button type="submit" class="btn btn-default">查詢</button>
					</form>
				</div>

				<br />
				<div class="table-responsive col-sm-12">
					<table class="table table-bordered">
						<tr>
							<th width="50" class="text-info">訂單編號</th>
							<th width="50" class="text-info">客戶編號</th>
							<th width="75" class="text-info">客戶姓名</th>
							<th width="100" class="text-info">訂購日期</th>
							<th width="100" class="text-info">出貨日期</th>
							<th width="75" class="text-info">折扣編號</th>
							<th width="75" class="text-info">取消訂貨</th>
							<th width="120" class="text-info">產品名稱及容量</th>
							<th width="75" class="text-info">禮盒名稱</th>
							<th width="75" class="text-info">成交金額</th>
							<th width="50" class="text-info">數量</th>
							<th width="50" class="text-info">取消訂單</th>

						</tr>
						<%
							if (list != null) {
								for (OrderDetail odd : list) {
									int index = odd.getOrderID();
									o = od.searchbyID(index);
									Product p = pd.searchbyID(odd.getProductID());
									GiftSet g = gd.searchbyID(odd.getGiftSetID());
									String shipdate = o.getShipDate();
									if(shipdate==null){
										shipdate = "尚未出貨";
									}
						%>
						<tr>
							<td><%=index%></td>
							<td><%=o.getCustomerID()%></td>
							<td><%=cd.searchbyID(o.getCustomerID()).getCustomerName() %></td>
							<td><%=o.getOrderDate()%></td>
							<td><%=shipdate%></td>
							<td><%=o.getDiscountID()%></td>
							<td><% if(o.getCanceled()==0){out.print("未取消");}else{out.print("取消");}%></td>
							<td><%if(p!=null){%><%=p.getProductName() %>--<%=p.getCapacity() %><%}else{out.print("");} %></td>
							<td><%if(g!=null){out.print(g.getGiftSetName());}if(g==null){out.print("");} %></td>
							<td><%=odd.getSalesPrice()%></td>
							<td><%=odd.getQuantity()%></td>

							<td>
							<%if(o.getCanceled()==0){ %>
							<a href="ProductDelCode.jsp?id=<%=index%>"
								onclick="return confirm('確認取消');">
									<button type="button" class="btn btn-danger btn-sm">取消訂單</button>
							</a>
							<%} %>
							</td>

						</tr>
						<%
							}
							} else {
						%>
						<tr>
							<td colspan='13' align="center">查無資料</td>
						</tr>
						<%
							}
						%>

					</table>



				</div>
				
				<div class="row">

					<div align="center">
						<nav>
						<ul class="pagination">
							<%
								final int PAGE_RANGE = 3; //設定pagination長度
								int loc = (pg - 1) / PAGE_RANGE; //int不會有小數
								int start_num = loc * PAGE_RANGE + 1; //計算pagination起始值
								int end_num = loc * PAGE_RANGE + PAGE_RANGE; //計算每頁末碼
								int uplimit = (TotalPages > end_num) ? end_num : TotalPages; //設定末碼上限
								int i;
								//for (i = start_num; i <= uplimit; i++) {
							%>

							<li <%if (loc == 0) {%> class="disabled"><a href="#"
								<%} else {%>><a
									href="OrderSearch.jsp?p=<%=(loc - 1) * PAGE_RANGE + 1%>" <%}%>
									aria-label="previou"><span aria-hidden="true">&laquo;</span>
								</a></li>

							<%
								//}
								for (i = start_num; i <= uplimit; i++) {
									if (pg == i) {
							%>
							<li class="active"><a href="#"><%=i%><span
									class="sr-only"></span></a></li>
							<%
								} else {
							%>
							<li><a href="OrderSearch.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<li <%if (TotalPages <= end_num) {%> class="disabled" ><a href="#"<%}else{%>><a
								href="OrderSearch.jsp?p=<%=i%>" <%} %>aria-label="next"><span
									aria-hidden="true">&raquo;</span> </a></li>


						</ul>
						</nav>
					</div>
				</div>



				<br />


				<!-- --------------------------------------------------------------------------------- -->

			</div>


		</div>

		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>