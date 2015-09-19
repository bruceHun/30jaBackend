<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String s = (String) session.getAttribute("LogOK");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1,text/html; charset=UTF-8">
<title>新增管理帳號</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<script language="javascript">
	/*function check_data() {
		var t1 = document.getElementById("t1");
		var t2 = document.getElementById("t2");
		request = new XMLHttpRequest();
		request.open("GET", "loginChk.jsp?account=" + t1.value + "password=" + t2.value, true);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request

		//request.onreadystatechange = updateData;
		// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
		request.send(null); // 發動 request 去取資料
		if (request.readyState == 4) {
			alert(request.responseText);
			//var dup = document.getElementById("dup");
			//dup.value = request.responseText.trim();
			//alert(dup.value);
			

		}
		
	}

	function chech_Data() {
		
	}*/
</script>

</head>
<body>

	<div id="wrqpper">

		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="content">
			<div class="page-header">
				<h1 align="center">
					<%
						if (s == null) {
					%>登入系統<%
						} else {
					%>登出系統<%
						}
					%>
				</h1>
			</div>

			<div class="container">

				<%
					if (s == null) {
				%>
				<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
					<p />

					<form class="form-horizontal" name="admin" action="loginChk.jsp"
						method="post" onSubmit="return check_data()">
						<div class="form-group">
							<div class="col-sm-3">
								<label for="t1">帳號</label>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="t1" name="account"
									placeholder="請輸入帳號">
							</div>

						</div>

						<div class="form-group">
							<div class="col-sm-3">
								<label for="t2">密碼</label>
							</div>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="t2"
									name="password" placeholder="請輸入密碼">
							</div>

						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">

								<button type="submit" class="btn btn-default">登入</button>
							</div>
						</div>
					</form>


					<div class="col-xs-12">
						<br /> <br /> <br />
					</div>
				</div>
				<%
					}
					if (s != null) {
				%>
				<div id="content">
					<br/><br/><br/>
					<div class="col-sm-12" align="center">
						<button type="button" class="btn btn-default"
							onclick="location.href='logout.jsp'">登出</button>
					</div>
				</div>
				<%
					}
				%>
			</div>


		</div>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>
</body>
</html>