<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
	<% String s = (String)session.getAttribute("LogOK"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" http-equiv="Content-Type" content="width=device-width, initial-scale=1, maximum-scale=1, text/html; charset=UTF-8">
<title>管理系統首頁</title>
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

		<div id="header_menu">
			<jsp:include page="header.jsp" />
		</div>
		<div id="index">
			<div class="container">

				<div class="jumbotron">
					<h1>三十岬梅舖</h1>
					<p>後台管理系統。</p>
					<p>
					<% if(s == null){ %>				
						<a class="btn btn-success btn-lg" role="button" onclick="location.href = 'login.jsp'">登入</a>
						<% }if(s != null) { %>
						<a class="btn btn-danger btn-lg" role="button" onclick="location.href = 'logout.jsp'">登出</a>
						<% } %>
					</p>
				</div>
				<br />

				<div class="panel panel-primary">
					<div class="panel-heading">資訊看板</div>
					<div class="panel-body">

						<table class="table table-hover ">
							<tr>
								<th>日期</th>
								<th>發文者</th>
								<th>訊息</th>
								<th>檢視</th>
							</tr>
							<tr>
								<td>2015-08-26</td>
								<td>系統管理員</td>
								<td>系統建構中...</td>
								<td><a href="#" class="btn btn-xs btn-success">檢視</a></td>
							</tr>
						</table>

					</div>
				</div>


				<div class="alert alert-warning" role="success">
					<p>
						想了解如何使用管理系統，請閱讀 
						
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
				  教學
				</button>
				
				<!-- Modal -->
				<div id="index">
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h3 class="modal-title" id="myModalLabel" align="center">系統使用教學</h3>
				      </div>
				      <div class="modal-body">
				        飛曰：「吾莊後有一桃園，花開正盛；明日當於園中祭告天地，我三人結為兄弟，協力同心，然後可圖大事。」玄德、雲長、齊聲應曰：「如此甚好。」次日，於桃園中，備下烏牛白馬祭禮等項，三人焚香，再拜而說誓曰：「念劉備、關羽、張飛，雖然異姓，既結為兄弟，則同心協力，救困扶危；上報國家，下安黎庶；不求同年同月同日生，但願同年同月同日死。皇天后土，實鑒此心。背義忘恩，天人共戮。」誓畢，拜玄德為兄，關羽次之，張飛為弟。祭罷天地，復宰牛設酒，聚鄉中勇士，得三百餘人，就桃園中痛飲一醉。來日收拾軍器，但恨無馬匹可乘。
正思慮間，人報「有兩個客人，引一夥伴儅，趕一群馬，投莊上來。」玄德曰：「此天佑我也！」三人出莊迎接。原來二客乃中山大商：一名張世平，一名蘇雙，每年往北販馬，近因寇發而回。玄德請二人到莊，置酒管待，訴說欲討賊安民之意。二客大喜，願將良馬五十匹相送；又贈金銀五百兩，鑌鐵一千斤，以資器用。玄德謝別二客，便命良匠打造雙股劍。雲長造青龍偃月刀，又名冷豔鋸，重八十二斤。張飛造丈八點鋼矛。各置全身鎧甲。共聚鄉勇五百餘人，來見鄒靖。鄒靖引見太守劉焉。三人參見畢，各通姓名。玄德說起宗派，劉焉大喜，遂認玄德為姪。
不數日，人報黃巾賊將程遠志統兵五萬來犯涿郡。劉焉令鄒靖引玄德等三人，統兵五百，前去破敵。玄德等欣然領軍前進，直至大興山下，與賊相見。賊眾皆披髮，以黃巾抹額。當下兩軍相對，玄德出馬，─左有雲長，右有翼德─，揚鞭大罵：「反國逆賊，何不早降！」
程遠志大怒，遣副將鄧茂出戰。張飛挺丈八蛇矛直出，手起處，刺中鄧茂心窩，翻身落馬。程遠志見折了鄧茂，拍馬舞刀，直取張飛。雲長舞動大刀，縱馬飛迎。程遠志見了，早吃一驚；措手不及，被雲長刀起處，揮為兩段。後人有詩讚二人曰：
英雄發穎在今朝，一試矛兮一試刀。初出便將威力展，三分好把姓名標。
眾賊見程遠志被斬，皆倒戈而走。玄德揮軍追趕，投降者不計其數，大勝而回。劉焉親自迎接，賞勞軍士。次日，接得青州太守龔景牒文，言黃巾賊圍城將陷，乞賜救援。劉焉與玄德商議。玄德曰：「備願往救之。」劉焉令鄒靖將兵五千，同玄德，關，張，投青州來。賊眾見救軍至，分兵混戰。玄德兵寡不勝，退三十里下寨。玄德謂關、張曰、「賊眾我寡，必出奇兵，方可取勝。」乃分關公引一千軍伏山左，張飛引一千軍伏山右，鳴金為號，齊出接應。
次日，玄德與鄒靖，引軍鼓譟而進。賊眾迎戰，玄德引軍便退。賊眾乘勢追趕，方過山嶺，玄德軍中一齊鳴金，左右兩軍齊出，玄德麾軍回身復殺。三路夾攻，賊眾大潰。直趕至青州城下，太守龔景亦率民兵出城助戰。賊勢大敗，剿戮極多，遂解青州之圍。後人有詩讚玄德曰：
運籌決算有神功，二虎還須遜一龍。初出便能垂偉績，自應分鼎在孤窮。
龔景犒軍畢，鄒靖欲回。玄德曰：「近聞中郎將盧植與賊首張角戰於廣宗，備昔曾師事盧植，欲往助之。」於是鄒靖引軍自回，玄德與關、張引本部五百人投廣宗來。至盧植軍中，入帳施禮，具道來意。盧植大喜，留在帳前聽調。
時張角賊眾十五萬，植兵五萬，相拒於廣宗，未見勝負。植謂玄德曰：「我今圍賊在此，賊弟張梁，張寶在潁川，與皇甫嵩、朱雋對壘。汝可引本部人馬，我更助汝一千官軍，前去潁川打探消息，約期剿捕。」玄德領命，引軍星夜投潁川來。時皇甫嵩、朱雋領軍拒賊，賊戰不利，退入長社，依草結營。嵩與雋計曰：「賊依草結營，當用火攻之。」遂令軍士，每人束草一把，暗地埋伏。其夜大風忽起。二更以後，一齊縱火，嵩與雋各引兵攻擊賊寨，火燄張天，賊眾驚慌，馬不及鞍，人不及甲，四散奔走。殺到天明，張梁、張寶引敗殘軍士，奪路而走。
忽見一彪軍馬，盡打紅旗，當頭來到，截往去路。為首閃出一將，身長七尺，細眼長髯；官拜騎都尉；沛國譙郡人也：姓曹，名操，字孟德。操父曹嵩，本姓夏侯氏；因為中常侍曹騰之養子，故冒姓曹。曹嵩生操，小字阿瞞，一名吉利。操幼時，好游獵，喜歌舞；有權謀，多機變。操有叔父，見操游蕩無度，嘗怒之，言於曹嵩。嵩責操。操忽心生一計：見叔父來，詐倒於地，作中風之狀。叔父驚告嵩，嵩急視之，操故無恙。嵩曰：「叔言汝中風，今己愈乎？」操曰：「兒自來無此病；因失愛於叔父，故見罔耳。」嵩信其言。後叔父但言操過，嵩並不聽。因此，操得恣意放蕩。
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				</div>
				</p>		
					
				</div>


			</div>


			
		</div>

		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>

</body>
</html>