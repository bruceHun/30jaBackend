<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
	if (!"admin".equals(session.getAttribute("LogOK"))) {
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1, text/html; charset=UTF-8">
<title>帳號管理</title>
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
					系統管理 <small>帳號管理</small>
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
				
				final int PAGE_SIZE = 5;
				int start_loc = (pg - 1) * PAGE_SIZE + 1;
				AdministratorDAO ad = new AdministratorDAOimpl();
				ArrayList<Administrator> list = ad.getRange(start_loc, PAGE_SIZE);
				int TotalRows = ad.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<div class="table-responsive col-sm-offset-3 col-sm-6">
					<table class="table table-bordered">
						<tr>
							<th width="100" class="text-info">帳號</th>
							<th width="100" class="text-info">權限</th>
							<th width="70"class="text-info">權限變更</th>
							<th width="50" class="text-info">刪除</th>
						</tr>
						<%
							for (Administrator a : list) {
								String acc = a.getAccount();
								String lv = a.getLevel();
						%>
						<tr>
							<td><%=acc %></td>
							<td><%=lv %></td>
							<td>
									<button type="button" class="btn btn-primary btn-sm"
										data-toggle="modal" data-target="#<%=acc%>">權限變更</button>
											
								<div class="modal fade" id="<%=acc%>">
								  <div class="modal-dialog modal-sm" id="index">
								    <div class="modal-content">
								    <form action="AdminEditCode.jsp" method="post">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title">請選擇使用權限</h4>
								      </div>
								      
								      <input type="hidden" name="acc" value="<%=a.getAccount() %>">
								      <div class="modal-body">
								    	<p>pending：　　尚未授權</p>
								    	<p>user：　　　　一般使用者</p>
								    	<p>admin：　　　系統管理員</p>
								        <p>
								        <select class="form-control" name="select">
										  <option value="pending"<%if(lv.equals("pending")) {%> Selected <%} %>>pending</option>
										  <option value="user"<%if(lv.equals("user")) {%> Selected <%} %>>user</option>
										  <option value="admin"<%if(lv.equals("admin")) {%> Selected <%} %>>admin</option>
										</select>
								        </p>		       
								      </div>
								      
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								        <button type="submit" class="btn btn-primary">確認變更</button>
								      </div>
								      </form>
								    </div><!-- /.modal-content -->
								  </div><!-- /.modal-dialog -->
								</div><!-- /.modal -->
								
								
								
								</td>
							<td><a href="AdminDelCode.jsp?id=<%=a.getAccount() %>"
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
									href="ＡdminEdit.jsp?p=<%=(loc - 1) * PAGE_RANGE + 1%>" <%}%>
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
							<li><a href="AdminEdit.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<li <%if (TotalPages <= end_num) {%> class="disabled" ><a href="#"<%}else{%>><a
								href="AdminEdit.jsp?p=<%=i%>" <%} %>aria-label="next"><span
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