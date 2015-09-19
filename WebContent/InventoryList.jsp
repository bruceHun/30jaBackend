<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
	<%
	if(session.getAttribute("LogOK")==null){
		response.sendRedirect("login.jsp");
	}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1,text/html; charset=UTF-8">
<title>商品列表</title>
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
					進出貨管理 <small>檢視庫存</small>
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

				final int PAGE_SIZE = 5;
				int start_loc = (pg - 1) * PAGE_SIZE + 1;
				InventoryDAO id = new InventoryDAOimpl();
				ProductDAO pd = new ProductDAOimpl();
				
				ArrayList<Inventory> list = id.getRange(start_loc, PAGE_SIZE);
				int TotalRows = id.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<p/>
				<div class="table-responsive col-sm-offset-2 col-sm-8">
					<table class="table table-bordered">
						<tr>
							<th width="75" class="text-info">庫存編號</th>
							<th width="75" class="text-info">產品編號</th>
							<th width="180" class="text-info">產品名稱及容量</th>
							<th width="75" class="text-info">成本</th>
							<th width="75" class="text-info">庫存量</th>
							<th width="75" class="text-info">待出貨</th>
							<th width="75" class="text-info">安全存量</th>
							
						</tr>
						<%
							for (Inventory i : list) {
						%>
						<tr>
							<td><%=i.getStockNumber()%></td>
							<td><%=i.getProductID()%></td>
							<td><%=pd.searchbyID(i.getProductID()).getProductName() %>--<%=pd.searchbyID(i.getProductID()).getCapacity() %></td>
							<td><%=i.getCost()%></td>
							<td><%=i.getUnitsInStock()%></td>
							<td><%=i.getUnitsOnOrder()%></td>
							<td><%=i.getSaftyStock()%></td>
							
						</tr>
						<%
							}
						%>
					</table>

				</div>



				<br />
				<div class="row col-sm-12">

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
									href="InventoryList.jsp?p=<%=(loc - 1) * PAGE_RANGE + 1%>" <%}%>
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
							<li><a href="InventoryList.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<li <%if (TotalPages <= end_num) {%> class="disabled" ><a href="#"<%}else{%>><a
								href="InventoryList.jsp?p=<%=i%>" <%} %>aria-label="next"><span
									aria-hidden="true">&raquo;</span> </a></li>


						</ul>
						</nav>
					</div>
				</div>
				
				<!-- --------------------------------------------------------------------------------- -->

			</div>


		</div>
		
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
		
	</div>
</body>
</html>