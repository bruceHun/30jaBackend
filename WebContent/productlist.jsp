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
					商品管理 <small>商品資料維護</small>
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

				ProductCategoryDAO pcd = new ProductCategoryDAOimpl();

				final int PAGE_SIZE = 5; //設定列數
				int start_loc = (pg - 1) * PAGE_SIZE + 1; //設定每頁的起始值，上一頁的列數＋1
				ProductDAO pd = new ProductDAOimpl();
				ArrayList<Product> list = pd.getRange(start_loc, PAGE_SIZE); //用MySQL Limit 取得一頁的範圍資料
				int TotalRows = pd.getSize(); //取得資料總列數
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE); //總列數除以每頁列數=總頁數
			%>

			<div class="container">
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th width="75" class="text-info">產品編號</th>
							<th width="75" class="text-info">國碼</th>
							<th width="75" class="text-info">類別名稱</th>
							<th width="110" class="text-info">產品名稱</th>
							<th width="75" class="text-info">單位</th>
							<th width="75" class="text-info">容量</th>
							<th width="75" class="text-info">單價</th>
							<th width="75" class="text-info">產品狀態</th>
							<th class="col-sm-4 text-info">產品資訊</th>
							<th class="text-info">圖片</th>
							<th class="text-info">編輯</th>
							<th class="text-info">刪除</th>
						</tr>
						<%
							for (Product p : list) {
						%>
						<tr>
							<td><%=p.getProductID()%></td>
							<td><%=p.getBarcode()%></td>
							<td><%=pcd.searchbyID(p.getCategoryID()).getCategoryName()%></td>
							<td><%=p.getProductName()%></td>
							<td><%=p.getProductUnit()%></td>
							<td><%=p.getCapacity()%></td>
							<td><%=p.getUnitPrice()%></td>
							<td>
								<%
									if (p.getDiscontinued() == 1) {
											out.print("已下架");
										} else {
											out.print("銷售中");
										}
								%>
							</td>
							<td><%=p.getDescription()%></td>
							<td>
							<form action="PicUpload.jsp" method="post">
							<input type="hidden" name="id" value="s_<%=p.getProductID() %>">
							<button type="submit" class="btn btn-success btn-sm">上傳</button>
							</form>
									
							</td>
							<td><a href="ProductEdit.jsp?id=<%=p.getProductID()%>">
									<button type="button" class="btn btn-primary btn-sm">編輯</button>
							</a></td>
							<td><a href="ProductDelCode.jsp?id=<%=p.getProductID()%>"
								onclick="return confirm('確認刪除');">
									<button type="button" class="btn btn-danger btn-sm">刪除</button>
							</a></td>
						</tr>
						<%
							}
						%>
					</table>

				</div>



				<br />
				<div class="row">

					<div align="center">
						<nav>
						<ul class="pagination">
							<%
								final int PAGE_RANGE = 5; //設定pagination長度
								int loc = (pg - 1) / PAGE_RANGE; //int不會有小數
								int start_num = loc * PAGE_RANGE + 1; //計算pagination起始值
								int end_num = loc * PAGE_RANGE + PAGE_RANGE; //計算每頁末碼
								int uplimit = (TotalPages > end_num) ? end_num : TotalPages; //設定末碼上限
								int i;
								//for (i = start_num; i <= uplimit; i++) {
							%>

							<li <%if (loc == 0) {%> class="disabled"><a href="#"
								<%} else {%>><a
									href="productlist.jsp?p=<%=(loc - 1) * PAGE_RANGE + 1%>" <%}%>
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
							<li><a href="productlist.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<li <%if (TotalPages <= end_num) {%> class="disabled" ><a href="#"<%}else{%>><a
								href="productlist.jsp?p=<%=i%>" <%} %>aria-label="next"><span
									aria-hidden="true">&raquo;</span> </a></li>


						</ul>
						</nav>
					</div>
				</div>
				<!-- --------------------------------------------------------------------------------- -->


				<!-- --------------------------------------------------------------------------------- -->

			</div>


		</div>

		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>