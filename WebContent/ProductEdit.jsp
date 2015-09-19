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
<title>產品資料修改</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script language="javascript">

function trimSpaces(){
	s = document.getElementById("descri").value;
	s = s.replace(/(^\s*)|(\s*$)/gi,"");
	s = s.replace(/[ ]{2,}/gi," ");
	s = s.replace(/\n /,"\n");
	document.getElementById("descri").value = s;
}
	
</script>
</head>
<body>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">

			<%
				ProductCategoryDAO pcd = new ProductCategoryDAOimpl();
				ArrayList<ProductCategory> list = pcd.showAll();

				String s = request.getParameter("id");
				Product p = null;
				if (s != null) {
					try {
						int product_id = Integer.valueOf(s);
						ProductDAO dao = new ProductDAOimpl();
						p = dao.searchbyID(product_id);
					} catch (Exception e) {
						out.println("No Data!");
					}

				} else {
					out.println("No Data!");
				}
			%>

			<div class="page-header">
				<h1 align="center">
					商品管理 <small>產品資料修改</small>
				</h1>
			</div>

			<div class="container">
				<br />
				<br />
				<br />
				<form class="form-horizontal" name="product"
					action="ProductEditCode.jsp" method="post" onSubmit="trimSpaces()">
					<input type="hidden" name=productid
						value="<%out.print(p.getProductID());%>" />

					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-2 col-sm-3">
						<div class="form-group ">
							<input type="hidden" id="pid" name="pid" value="<%=p.getProductID() %>">
							<label for="barcode">國碼：</label> <input type="text"
								class="form-control" id="barcode" name="barcode"
								placeholder="國碼" value="<%out.print(p.getBarcode());%>">
						</div>

						<div class="form-group">
							<label for="categoryid">產品類別：</label> <select
								class="form-control" id="categoryid" name="categoryid">
								
								<%
									for (ProductCategory pc : list) {
								%>
								<option value=<%=pc.getCategoryID()%> <%if(p.getCategoryID() == pc.getCategoryID()) {%> Selected <% } %>><%=pc.getCategoryID()%>.<%=pc.getCategoryName()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="pname">商品名稱：</label> <input type="text"
								class="form-control" id="pname" name="pname" placeholder="商品名稱"
								value="<%out.print(p.getProductName());%>">
						</div>

						<div class="form-group">
							<label for="unit">商品單位：</label> <input type="text"
								class="form-control" id="unit" name="unit" placeholder="商品單位"
								value="<%out.print(p.getProductUnit());%>">
						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-2 col-sm-3">
						<div class="form-group">
							<label for="capacity">商品容量：</label> <input type="text"
								class="form-control" id="capacity" name="capacity"
								placeholder="商品容量" value="<%out.print(p.getCapacity());%>">
						</div>
						<p />
						<div class="form-group">
							<label for="price">商品單價：</label> <input type="text"
								class="form-control" id="price" name="price" placeholder="商品單價"
								value="<%out.print(p.getUnitPrice());%>">
						</div>

						<div class="form-group">
							<label for="discon">商品狀態：</label> <select class="form-control"
								id="discon" name="discon">
								<% int state = p.getDiscontinued();%>
								<option value="0" <%if (state==0){ %> Selected <% } %>>銷售中</option>
								<option value="1" <%if (state==1){ %> Selected <% } %>>已下架</option>
							</select>
						</div>

						<div class="form-group">
							<label for="descri">商品資訊：</label>
							<textarea class="form-control" rows="5" id="descri" name="descri"
								placeholder="商品資訊">
								<%
									out.print(p.getDescription());
								%>
								</textarea>
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

			<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

		</div>

	</div>
</body>
</html>