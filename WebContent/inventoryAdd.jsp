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
<title>新增資料修改</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script language="javascript">
function setTable(){
cate = document.getElementById("capacity");
t1 = document.getElementById("t1");
t1.value = cate.value;

quan = document.getElementById("pcs");
t2 = document.getElementById("t2");
t2.value = quan.value;
}
</script>


</head>
<body>

	<%
		ProductCategoryDAO pcd = new ProductCategoryDAOimpl();
		ProductDAO pd = new ProductDAOimpl();
		ArrayList<ProductCategory> pclist = pcd.showAll();
		ArrayList<Product> plist = new ArrayList<Product>();
		Set<String> set = new TreeSet<String>();

		String cid = request.getParameter("categoryid");
		int index;		
		if (cid != "" & cid != null) {
			index = Integer.valueOf(cid);
			System.out.print(index);
		} else {
			index = 0;
		}
		
		String pn = request.getParameter("pname");
		if(pn!=""&&pn!=null){
			pn = new String(pn.getBytes("ISO-8859-1"),"utf-8");
		}
		System.out.print(pn);
	%>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">
			<div class="page-header">
				<h1 align="center">
					進出貨管理 <small>產品進貨</small>
				</h1>
			</div>

			<div class="container">
				<br /> <br /> <br />
				
				<form class="form-horizontal" name="product"
					action="inventoryAdd.jsp" method="post" onsubmit="setTable()">


					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-4 col-sm-4 col-md-offset-5 col-md-2">

						<div class="form-group">
							<label for="categoryid">產品類別：</label> <select
								class="form-control" id="categoryid" name="categoryid"
								onchange="this.form.submit()">
								<%
									for (ProductCategory pc : pclist) {
								%>
								<option value=<%=pc.getCategoryID()%>
									<%if (pc.getCategoryID() == index) {%> Selected <%}%>><%=pc.getCategoryID()%>.<%=pc.getCategoryName()%></option>
								<%
									plist = pd.findByCategoryID(index);
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="pname">產品名稱：</label> <select
								class="form-control" id="pname" name="pname"
								 onchange="this.form.submit()">
								<%
									if (index != 0 && plist != null) {
										for (Product p : plist) {
											set.add(p.getProductName());
										}
									}

									for (String pname : set) {
								%>
								<option value=<%=pname%>
									<%if(pname.equals(pn)){ %> Selected <% } %>><%=pname%></option>
								<%
									}
								%>
							</select>
						</div>


						<div class="form-group">
							<label for="capacity">產品容量：</label> <select
								class="form-control" id="capacity" name="capacity">
								<%
									if (index!=0 && pn!=null && pn!="") {
										ArrayList<Product> clist = pd.findByName(pn);
										for (Product p : clist) {
								%>
								<option value=<%=p.getProductID() %>><%=p.getCapacity()%></option>
								<%
									}
									}
								%>
							</select>
						</div>

						<div class="form-group ">
							<label for="pcs">進貨數量：</label> <input type="number" min="1"
								class="form-control" id="pcs" name="pcs"
								placeholder="請輸入數量">
						</div>

					</div>
					<!-- -------------------------------------------------------------------------------------- -->

					

				</form>
				
				<form action="inventoryAddCode.jsp" method="post" onsubmit="return setTable()">
				<input type="hidden" id="t1" name="t1">
				<input type="hidden" id="t2" name="t2">
				<div class="form-group">
						<div class="col-sm-12" align="center">
							<button type="submit" class="btn btn-default">確認</button>
						</div>
					</div>
				</form>
				
				<br /> <br />
			</div>

		</div>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>