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
<title>產品組合修改</title>

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
					商品管理 <small>組合資料修改</small>
				</h1>
			</div>

			<%
				ProductDAO pd = new ProductDAOimpl();
				ArrayList<Product> list = pd.showAll();

				String s = request.getParameter("id");
				GiftSet g = null;
				if (s != null) {
					try {
						int giftset_id = Integer.valueOf(s);
						GiftSetDAO dao = new GiftSetDAOimpl();
						g = dao.searchbyID(giftset_id);
					} catch (Exception e) {
						out.println("No Data!");
					}

				} else {
					out.println("No Data!");
				}
			%>

			<div class="container">
				<br />
				<br />
				<br />
				<form class="form-horizontal" name="product"
					action="GiftSetEditCode.jsp" method="post">
					<input type="hidden" name=giftsetid
						value="<%=g.getGiftSetID()%>" />

					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-2 col-sm-3">
						<div class="form-group ">
							<label for="gsname">禮盒名稱：</label> <input type="text"
								class="form-control" id="gsname" name="gsname"
								placeholder="禮盒名稱" value=<%=g.getGiftSetName() %>>
						</div>

						<div class="form-group">
							<label for="product1">商品ㄧ：</label> <select class="form-control"
								id="product1" name="product1">
								<option value=-1>--請選擇--</option>
								<%
									for (Product p : list) {
								%>
								<option value=<%=p.getProductID()%>
									<%if (g.getID1() == p.getProductID()) {%> selected="selected"
									<%}%>><%=p.getProductID()%>.<%=p.getProductName()%>--<%=p.getCapacity()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="product2">商品二：</label> <select class="form-control"
								id="product2" name="product2">
								<option value=-1>--請選擇--</option>
								<%
									for (Product p : list) {
								%>
								<option value=<%=p.getProductID()%>
									<%if (g.getID2() == p.getProductID()) {%> selected="selected"
									<%}%>><%=p.getProductID()%>.<%=p.getProductName()%>--<%=p.getCapacity()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="uproduct3">商品三：</label> <select class="form-control"
								id="product3" name="product3">
								<option value=-1>--請選擇--</option>
								<%
									for (Product p : list) {
								%>
								<option value=<%=p.getProductID()%>
									<%if (g.getID3() == p.getProductID()) {%> selected="selected"
									<%}%>><%=p.getProductID()%>.<%=p.getProductName()%>--<%=p.getCapacity()%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-2 col-sm-3">
						<div class="form-group">
							<label for="product4">商品四：</label> <select class="form-control"
								id="product4" name="product4">
								<option value=-1>--請選擇--</option>
								<%
									for (Product p : list) {
								%>
								<option value=<%=p.getProductID()%>
									<%if (g.getID4() == p.getProductID()) {%> selected="selected"
									<%}%>><%=p.getProductID()%>.<%=p.getProductName()%>--<%=p.getCapacity()%></option>
								<%
									}
								%>
							</select>
						</div>
						<p />
						<div class="form-group">
							<label for="product5">商品五：</label> <select class="form-control"
								id="product5" name="product5">
								<option value=-1>--請選擇--</option>
								<%
									for (Product p : list) {
								%>
								<option value=<%=p.getProductID()%>
									<%if (g.getID5() == p.getProductID()) {%> selected="selected"
									<%}%>><%=p.getProductID()%>.<%=p.getProductName()%>--<%=p.getCapacity()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="price">單價：</label> <input type="text"
								class="form-control" id="price" name="price" placeholder="單價" value=<%=g.getUnitPrice() %>>
						</div>

						<div class="form-group">
							<label for="discon">商品狀態：</label> <select class="form-control"
								id="discon" name="discon" <% int state = g.getDiscontinued(); %>>
								<option value="0" <%if (state==0){ %> Selected <% } %>>銷售中</option>
								<option value="1" <%if (state==1){ %> Selected <% } %>>已下架</option>
							</select>
						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->

					<div class="form-group">
						<div class="col-sm-12" align="center">
							<button type="submit" class="btn btn-default">確認修改</button>
						</div>
					</div>

				</form>
				<br />
				<br />
			</div>

		</div>
		<div>
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>