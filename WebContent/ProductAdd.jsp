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


function trimSpaces(){
	s = document.getElementById("descri").value;
	s = s.replace(/(^\s*)|(\s*$)/gi,"");
	s = s.replace(/[ ]{2,}/gi," ");
	s = s.replace(/\n /,"\n");
	document.getElementById("descri").value = s;
}


	function getData() {
		var pname = document.getElementById("pname").toString;
		request = new XMLHttpRequest();
		request.open("GET", "ProDupChk.jsp?pname="+pname, true);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		//var img1 = document.getElementById("img1");
		//img1.src = "images/loading.gif";

		request.onreadystatechange = updateData;
		// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
		request.send(null); // 發動 request 去取資料
	}

	function updateData() {
		if (request.readyState == 4) {
			alert(request.responseText);
			var dup = document.getElementById("dup");
			dup.value = request.responseText.trim();
			alert(dup.value);
			if (dup.value == "1") {
				alert("產品名稱已存在");
				//var img1 = document.getElementById("img1");
				//img1.src = "images/wrong.gif";
			//} else {
				//var img1 = document.getElementById("img1");
				//img1.src = "images/check.gif";
			//}

		}
	}
	
	/*function check_pwd() {
		var t2 = document.getElementById("t2");	
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/;
		var ret = pattern.test(t2.value);
		if(ret){
			img2.src = "images/check.gif";
		}else{
			img2.src = "images/wrong.gif"
		}

	}
	
	function check_pwd2() {
		var t2 = document.getElementById("t2");
		var t3 = document.getElementById("t3");
		var img2 = document.getElementById("img2");
		var img3 = document.getElementById("img3");
		if(t2.value == t3.value){
			img3.src = "images/check.gif";
		}else{
			img3.src = "images/wrong.gif";
		}
	}*/

	function check_data() {
		var flag = false;
		var message = '';

		// ---------- Check ----------
		var t1 = document.getElementById('barcode');
		if (t1.value == '') {
			message = message + '未輸入國碼\n';
			flag = false;
		}
		// ---------- Check ----------
		var t2 = document.getElementById('Catagoryid');
		if (t2.value == '') {
			message = message + '未輸入類別編號\n';
			flag = false;
		}
		
		var t3 = document.getElementById('pname');
		if (t3.value == '') {
			message = message + '未輸入產品名稱\n';
			flag = false;
		}		
		// ---------- Check ----------
		var t4 = document.getElementById('unit');
		if (t4.value == '') {
			message = message + '未輸入產品單位\n';
			flag = false;
		}

		// ---------- Check ----------
		var t4 = document.getElementById('unit');
		if (t4.value == '') {
			message = message + '未輸入產品單位\n';
			flag = false;
		}
		
		// ---------- Check ----------
		var t4 = document.getElementById('unit');
		if (t4.value == '') {
			message = message + '未輸入產品單位\n';
			flag = false;
		}
		
		

		if (!flag) {
			alert(message);
		}
		return flag;
	}
	

</script>

</head>
<body onload="trimSpaces()">

	<%
		ProductCategoryDAO pcd = new ProductCategoryDAOimpl();
		ArrayList<ProductCategory> list = pcd.showAll();
	%>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">
			<div class="page-header">
				<h1 align="center">
					商品管理 <small>新增商品</small>
				</h1>
			</div>

			<div class="container">
				<br />
				<form class="form-horizontal" name="product"
					action="ProductAddCode.jsp" method="post"
					onSubmit="return check_data()">
					


					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-2 col-sm-3">
						<div class="form-group ">
							<label for="barcode">國　　碼：</label> <input type="text"
								class="form-control" id="barcode" name="barcode"
								placeholder="國碼">
						</div>

						<div class="form-group">
							<label for="categoryid">類別編號：</label> <select
								class="form-control" id="categoryid" name="categoryid">
								<%
									for (ProductCategory pc : list) {
								%>
								<option value=<%=pc.getCategoryID()%>><%=pc.getCategoryID()%>.<%=pc.getCategoryName()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<label for="pname">商品名稱：</label> <input type="text"
								class="form-control" id="pname" name="pname" placeholder="商品名稱"
								onblur="getData()"> <input type="hidden" id="dup"
								value="1" />
						</div>

						<div class="form-group">
							<label for="unit">商品單位：</label> <input type="text"
								class="form-control" id="unit" name="unit" placeholder="商品單位">
						</div>

						<div class="form-group">
							<label for="capacity">商品容量：</label> <input type="text"
								class="form-control" id="capacity" name="capacity"
								placeholder="商品容量">
						</div>

						<div class="form-group">
							<label for="price">商品單價：</label> <input type="text"
								class="form-control" id="price" name="price" placeholder="商品單價">
						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->
					<div class="col-sm-offset-2 col-sm-3">
						<div class="form-group">
							<label for="cost">成　　本：</label> <input type="text"
								class="form-control" id="cost" name="cost"
								placeholder="成本">
						</div>
						
						<div class="form-group">
							<label for="stock">庫　　存：</label> <input type="text"
								class="form-control" id="stock" name="stock"
								placeholder="庫存">
						</div>
						
						<div class="form-group">
							<label for="safety">安全存量：</label> <input type="text"
								class="form-control" id="safety" name="safety"
								placeholder="安全存量">
						</div>

						<div class="form-group">
							<label for="discon">商品下架：</label> <select class="form-control"
								id="discon" name="discon">
								<option value="0">銷售中</option>
								<option value="1">已下架</option>
							</select>
						</div>

						<div class="form-group">
							<label for="descri">商品資訊：</label>
							<textarea class="form-control" rows="5" id="descri" name="descri"
								placeholder="商品資訊">
								</textarea>

						</div>
					</div>
					<!-- -------------------------------------------------------------------------------------- -->

					<div class="form-group">
						<div class="col-sm-12" align="center">
							<button type="submit" class="btn btn-default">確認新增</button>
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