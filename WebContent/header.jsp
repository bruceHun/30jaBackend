<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String s = (String) session.getAttribute("LogOK");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>This is header</title>
<link rel="stylesheet" href="css/mysite.css">
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp"><span
				class="glyphicon glyphicon-briefcase"><img atl="Brand" src=""></span>
				三十岬梅舖</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> <%
 	if (s == null) {
 %> 登入系統 <%
 	}
 	if (s != null) {
 %> 登出系統 <%
 	}
 %> <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="login.jsp"> <%
 	if (s == null) {
 %> 登入系統 <%
 	}
 	if (s != null) {
 %> 登出系統 <%
 	}
 %>
						</a></li>
						<li><a href="NewAdmin.jsp">註冊帳號</a></li>
						<li><a href="NewAdmin.jsp">帳號管理</a></li>
						<% if("admin".equals(s)) {%>
						<li class="divider"></li>
						<li><a href="AdminEdit.jsp">系統管理</a></li>
						<% } %>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">會員管理<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="MembershipList.jsp">會員資訊</a></li>
						<li><a href="CustomerList.jsp">客戶資訊</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">商品管理<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="ProductAdd.jsp">新增商品</a></li>
						<li><a href="GiftSetAdd.jsp">新增商品組合</a></li>
						<li class="divider"></li>
						<li><a href="productlist.jsp">商品資料維護</a></li>
						<li><a href="GiftSetList.jsp">組合資料維護</a></li>
					</ul></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">進出貨管理<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="inventoryAdd.jsp">進貨</a></li>
						<li><a href="inventoryOut.jsp">出貨</a></li>
						<li class="divider"></li>
						<li><a href="InventoryList.jsp">檢視庫存</a></li>
					</ul></li>
					
				<li><a href="OrderSearch.jsp">訂單管理</a>
					</li>

			</ul>
			<form class="navbar-form navbar-right">
			<% if(s==null) { %>
			<a href="login.jsp" class="btn btn-default">登入</a>
			<% } %>
			<% if(s!=null) { %>
			<span class="text-warning">目前使用者： <% out.print((String)session.getAttribute("acc")); %>　</span>
			
			<a href="logout.jsp" class="btn btn-default">登出</a>
			<% } %>
			</form>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>
	<!-- /.container-fluid -->
</body>
</html>