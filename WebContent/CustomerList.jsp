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
<title>顧客列表</title>
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
					會員管理 <small>顧客資訊</small>
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
				CustomerDAO cd = new CustomerDAOimpl();
				
				ArrayList<Customer> list = cd.getRange(start_loc, PAGE_SIZE);
				int TotalRows = cd.getSize();
				int TotalPages = (int) Math.ceil((double) TotalRows / (double) PAGE_SIZE);
			%>

			<div class="container">
				<p/>
				<div class="table-responsive">
					<table class="table table-bordered">
						<tr>
							<th width="50" class="text-info">客戶編號</th>
							<th width="75" class="text-info">客戶姓名</th>
							<th width="90" class="text-info">身分證字號</th>
							<th width="50" class="text-info">性別</th>
							<th width="100" class="text-info">生日</th>
							<th width="90" class="text-info">室內電話</th>
							<th width="90" class="text-info">行動電話</th>
							<th width="200" class="text-info">地址</th>
							<th width="150" class="text-info">E-mail</th>
							<th width="50" class="text-info">會員等級</th>
							<th width="50" class="text-info">折扣編號</th>
							<th class="text-info">等級調整</th>
							<th class="text-info">註銷</th>
						</tr>
						<%
							for (Customer c : list) {
						%>
						<tr>
							<td><%=c.getCustomerID()%></td>
							<td><%=c.getCustomerName()%></td>
							<td><%=c.getPersonalID()%></td>
							<td><% if(c.getGender()==1){out.print("男");}else{out.print("女");} %></td>
							<td><%=c.getBirthDate() %></td>
							<td><%=c.getPhone() %></td>
							<td><%=c.getCelPhone() %></td>
							<td><%=c.getAddress() %></td>
							<td><%=c.getEmail() %></td>
							<td><%=c.getCustomerType() %></td>
							<td><%=c.getDiscountID() %></td>
							
							<td><a href="CustomerList.jsp?id=<%=c.getCustomerID()%>">
									<button type="button" class="btn btn-success btn-sm">等級調整</button>
							</a></td>
							<td><a href="CustomerDelCode.jsp?id=<%=c.getCustomerID()%>"
								onclick="return confirm('註銷客戶會同時移除會員資料\n確認註銷?');">
									<button type="button" class="btn btn-danger btn-sm">註銷</button>
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
									href="CustomerList.jsp?p=<%=(loc - 1) * PAGE_RANGE + 1%>" <%}%>
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
							<li><a href="CustomerList.jsp?p=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<li <%if (TotalPages <= end_num) {%> class="disabled" ><a href="#"<%}else{%>><a
								href="CustomerList.jsp?p=<%=i%>" <%} %>aria-label="next"><span
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