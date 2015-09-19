<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="shopping.DAO.*,shopping.Class.*, java.util.*"%>
<%
	if (session.getAttribute("LogOK") == null) {
		response.sendRedirect("login.jsp");

	}
	String id = request.getParameter("id");
	String s1 = request.getParameter("s1");
	String s2 = request.getParameter("s2");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Pics Upload</title>
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1,text/html; charset=UTF-8" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/mysite.css">
<script src="jquery/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="jquery/jquery.form.js"></script>
<script language="javascript">
	$(function() {
		$('#ipp').hide();
		$('#upload').ajaxForm({
			beforeSend : function() {
				$('.progress').show();
			},
			uploadProgress : function(event, position, total, percentComplete) {
				$('.progress-bar').width(percentComplete + '%');
				$('.sr-only').html(percentComplete + '%');
			},
			success : function() {
				//$(".msg").html("<h2>上傳中</h2>")
			},
			complete : function(response) {

				$('#ipp').show();
			}
		});
		$('.progress').hide();
	});

	/*$(function (){		
		$(".select").hide();
			$('#s1').change(function(){			
					$(".select").hide();
				if($("#s1").val()=="Bigpics"){
					$(".select").show();
				}
		       // $('.colors').hide();
		       // $('#' + $(this).val()).show();
		    });
	});*/

	function setValue() {
		s1 = document.getElementById("s1");
		filename = document.getElementById("filename");
		filename.value = s1.value;
	}
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
					商品管理 <small>商品圖片上傳</small>
				</h1>
			</div>
			<div class="container">
				<div class="col-sm-offset-4 col-sm-4 col-md-offset-5 col-md-2"
					align="center">
					<h4>選擇圖片類型：</h4>
					<form action="PicUpload.jsp" method="post" onsubmit="setValue()">
						<input type="hidden" name="id" value="<%=id%>"> <br /> <select
							class="form-control" id="s1" name="s1"
							onchange="this.form.submit()">
							<option value="-1">--請選擇--</option>
							<option value="B_smallpics" <%if ("B_smallpics".equals(s1)) {%>
								Selected <%}%>>B_smallpics--270*270 jpg</option>
							<option value="smallpics" <%if ("smallpics".equals(s1)) {%>
								Selected <%}%>>smallpics--100*100 jpg</option>
							<option value="Bigpics" <%if ("Bigpics".equals(s1)) {%> Selected
								<%}%>>Bigpics-- jpg</option>
						</select> <br />
						<%
							if ("Bigpics".equals(s1)) {
						%>
						<input type="hidden" name="id" value="<%=id%>">
						<div class="select">
							<select class="form-control" id="s2" name="s2"
								onchange="this.form.submit()">
								<option value="0">--請選擇--</option>
								<option value="1" <%if ("1".equals(s2)) {%> Selected <%}%>>1</option>
								<option value="2" <%if ("2".equals(s2)) {%> Selected <%}%>>2</option>
								<option value="3" <%if ("3".equals(s2)) {%> Selected <%}%>>3</option>
								<option value="4" <%if ("4".equals(s2)) {%> Selected <%}%>>4</option>
								<option value="5" <%if ("5".equals(s2)) {%> Selected <%}%>>5</option>
								<option value="6" <%if ("6".equals(s2)) {%> Selected <%}%>>6</option>

							</select>
						</div>
						<%
							}
							System.out.print(id + " " + s1 + " " + s2);
						%>

					</form>


					<form id="upload" name="upload" enctype="multipart/form-data"
						method="post" action="PicUploadCode.jsp">

						<input type="hidden" id="filename"
							name="<%if ("Bigpics".equals(s1)) {
				out.print("p" + id + s2);
			} else {
				out.print(id);
			}%>"
							value=<%=s1%>> <br />
						<h4>上傳圖片：</h4>
						<br />
						<p>
							<input type="file" name="userfile" size="40" maxlength="40" />
						</p>
						<br />
						<p>
							<input class="btn btn-primary" type="submit" value="上傳" /> <input
								class="btn btn-danger" type="reset" value="清除" />
						</p>
					</form>
				</div>
				<br /> <br />
				<div class="col-sm-12">
					<div class="progress">
						<div
							class="progress-bar progress-bar-warning progress-bar-striped active"
							role="progressbar" aria-valuenow="45" aria-valuemin="0"
							aria-valuemax="100">
							<span class="sr-only"></span>
						</div>
						"WebContent/loginChk.jsp"
					</div>
				</div>
				<div class="col-sm-12" id="ipp" align="center">
					<a
						href="<%if (id.contains("s_")) {
				out.print("productlist.jsp");
			}
			if (id.contains("g_")) {
				out.print("GiftSetList.jsp");
			}%>">
					<button type="button" class="btn btn-success btn-lg">返回檢視</button>
					</a>
				</div>

			</div>




		</div>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>

</body>
</html>