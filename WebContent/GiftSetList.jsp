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
<title>產品組合列表</title>
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
					商品管理 <small>組合資料維護</small>
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

				ProductDAO pd = new ProductDAOimpl();

				final int PAGE_SIZE = 5;
				int start_loc = (pg - 1) * PAGE_SIZE + 1;
				GiftSetDAO gd = new GiftSetDAOimpl();

				ArrayList<GiftSet> list = gd.getRange(start_loc, PAGE_SIZE);
				int TotalRows = gd.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<p />
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th width="50" class="text-info">編號</th>
							<th width="130" class="text-info">禮盒名稱</th>
							<th width="150" class="text-info">產品ㄧ</th>
							<th width="150" class="text-info">產品二</th>
							<th width="150" class="text-info">產品三</th>
							<th width="150" class="text-info">產品四</th>
							<th width="150" class="text-info">產品五</th>
							<th width="60" class="text-info">單價</th>
							<th width="60" class="text-info">狀態</th>
							<th width="50" class="text-info">圖片</th>
							<th width="50" class="text-info">編輯</th>
							<th width="50" class="text-info">刪除</th>
						</tr>
						<%
							for (GiftSet g : list) {
								String id1 = null;
								String id2 = null;
								String id3 = null;
								String id4 = null;
								String id5 = null;
								if (g.getID1() != 0) {
									id1 = pd.searchbyID(g.getID1()).getProductName()+"--"+pd.searchbyID(g.getID1()).getCapacity();
								}
								if (g.getID2() != 0) {
									id2 = pd.searchbyID(g.getID2()).getProductName()+"--"+pd.searchbyID(g.getID2()).getCapacity();;
								}
								if (g.getID3() != 0) {
									id3 = pd.searchbyID(g.getID3()).getProductName()+"--"+pd.searchbyID(g.getID3()).getCapacity();;
								}
								if (g.getID4() != 0) {
									id4 = pd.searchbyID(g.getID4()).getProductName()+"--"+pd.searchbyID(g.getID4()).getCapacity();;
								}
								if (g.getID5() != 0) {
									id5 = pd.searchbyID(g.getID5()).getProductName()+"--"+pd.searchbyID(g.getID5()).getCapacity();;
								}
						%>
						<tr>
							<td><%=g.getGiftSetID()%></td>
							<td><%=g.getGiftSetName()%></td>
							<td><%=id1%></td>
							<td><%=id2%></td>
							<td><%=id3%></td>
							<td><%=id4%></td>
							<td><%=id5%></td>
							<td><%=g.getUnitPrice()%></td>
							<td>
								<%
									if (g.getDiscontinued() == 1) {
											out.print("已下架");
										} else {
											out.print("銷售中");
										}
								%>
							</td>
							
							<td><form action="PicUpload.jsp" method="post">
							<input type="hidden" name="id" value="g_<%=g.getGiftSetID() %>">
							<button type="submit" class="btn btn-success btn-sm">上傳</button>
							</form></td>

							<td><a href="GiftSetEdit.jsp?id=<%=g.getGiftSetID()%>">
									<button type="button" class="btn btn-primary btn-sm">編輯</button>
							</a></td>
							<td><a href="GiftSetDelCode.jsp?id=<%=g.getGiftSetID()%>"
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
									href="GiftSetList.jsp?p=<%=(loc - 1) * PAGE_RANGE + 1%>" <%}%>
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
							<li><a href="GiftSetList.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<li <%if (TotalPages <= end_num) {%> class="disabled" ><a href="#"<%}else{%>><a
								href="GiftSetList.jsp?p=<%=i%>" <%} %>aria-label="next"><span
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