<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	$(function pwdreq() {
		$('#t2').tooltip()
	})

	function getData() {
		var t1 = document.getElementById("t1");
		request = new XMLHttpRequest();
		request.open("GET", "AdDupChk.jsp?account=" + t1.value, true);
		// 這行是設定 request 要去哪取資料，尚未開始取
		// 第三個參數打 true 可以想成，利用另外一個執行緒處理 Request
		// 第三個參數打 false 可以想成，利用這一個執行緒處理 Request
		var img1 = document.getElementById("img1");
		img1.src = "images/loading.gif";

		request.onreadystatechange = updateData;
		// 當記憶體中的瀏覽器狀態改變時，呼叫 updateData 這個 function
		request.send(null); // 發動 request 去取資料
	}

	function updateData() {
		if (request.readyState == 4) {
			//alert(request.responseText);
			var dup = document.getElementById("dup");
			dup.value = request.responseText.trim();
			//alert(dup.value);
			if (dup.value == "1" || t1.value =="") {
				var img1 = document.getElementById("img1");
				img1.src = "images/wrong.gif";
			} else {
				var img1 = document.getElementById("img1");
				img1.src = "images/check.gif";
			}

		}
	}

	function check_pwd() {
		var t2 = document.getElementById("t2");
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/;
		var ret = pattern.test(t2.value);
		if (ret) {
			img2.src = "images/check.gif";
		} else {
			img2.src = "images/wrong.gif"
		}

	}

	function check_pwd2() {
		var t2 = document.getElementById("t2");
		var t3 = document.getElementById("t3");
		var img2 = document.getElementById("img2");
		var img3 = document.getElementById("img3");
		if (t2.value == t3.value && t3.value!="") {
			img3.src = "images/check.gif";
		} else {
			img3.src = "images/wrong.gif";
		}
	}

	function check_data() {
		var flag = true;
		var message = '';

		// ---------- Check ----------
		var t1 = document.getElementById('t1');
		if (t1.value == '') {
			message = message + '帳號不能為空白\n';
			flag = false;
		}
		// ---------- Check ----------
		var t2 = document.getElementById('t2');
		if (t2.value == '') {
			message = message + '密碼不能為空白\n';
			flag = false;
		}

		var t2 = document.getElementById('t2');
		var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,8}$/;
		var ret = pattern.test(t2.value);
		if (!ret) {
			message = message + '密碼格式不符\n';
			flag = false;
		}

		// ---------- Check ----------
		var t3 = document.getElementById('t3');
		if (t3.value == '') {
			message = message + '密碼確認不能為空白\n';
			flag = false;
		}

		var dup = document.getElementById('dup');
		if (dup.value == '1') {
			message = message + '帳號不得重複\n';
			flag = false;
		}

		if (!document.getElementById('read').checked) {
			message = message + '須先閱讀使用條款';
			flag = false;
		}

		if (!flag) {
			alert(message);
		}
		return flag;
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
					登入系統 <small>新增管理帳號</small>
				</h1>
			</div>

			<div class="container">


				<div class="col-sm-offset-3 col-sm-6 col-md-offset-4 col-md-4">
					<br /> <br /> <br />

					<form class="form-horizontal" name="admin"
						action="NewAdminCode.jsp" method="post"
						onSubmit="return check_data()">
						<div class="form-group">
							<div class="col-sm-3">
								<label for="t1">帳號</label>
							</div>
							<div class="col-sm-7">
								<input type="text" class="form-control" id="t1" name="account"
									placeholder="請輸入帳號" onchange="getData()">
							</div>
							<div class="col-sm-2">
								<img src="images/trans.gif" id="img1" width="30px" height="30px" />
								<input type="hidden" id="dup" value="1"/>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-3">
								<label for="t2">密碼</label>
							</div>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="t2"
									name="password" placeholder="請輸入密碼" onchange="check_pwd()"
									data-toggle="tooltip" data-placement="bottom"
									title="密碼需包含一個以上的英文大寫及小寫字母以及數字，長度介於6到12個字元之間">
								
							</div>
							<div class="col-sm-2">
								<img src="images/trans.gif" id="img2" width="30px" height="30px" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3">
								<label for="t3">密碼確認</label>
							</div>
							<div class="col-sm-7">
								<input type="password" class="form-control" id="t3" name="pwd2"
									placeholder="請輸入密碼" onchange="check_pwd2()">
							</div>
							<div class="col-sm-2">
								<img src="images/trans.gif" id="img3" width="30px" height="30px" />
							</div>
						</div>



						<!-- Button trigger modal -->
						<div class="col-sm-offset-3">
						<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
						  閱讀使用條款
						</button>
						</div>
						<!-- Modal -->
						<div id="index">
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						  <div class="modal-dialog modal-lg" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h3 class="modal-title" id="myModalLabel" align="center">使用條款</h3>
						      </div>
						      <div class="modal-body">
						        滾滾長江東逝水,浪花淘盡英雄。是非成敗轉頭空：青山依舊在,幾度夕陽紅。白髮漁樵江渚上,慣看秋月春風。一壺濁酒喜相逢：古今多少事,都付笑談中。
話說天下大勢．分久必合，合久必分：周末七國分爭，并入於秦。及秦滅之後，楚、漢分爭，又并入於漢。漢朝自高祖斬白蛇而起義，一統天下。後來光武中興，傳至獻帝，遂分為三國。推其致亂之由，殆始於桓、靈二帝。桓帝禁錮善類，崇信宦官。及桓帝崩，靈帝即位，大將軍竇武、太傅陳蕃，共相輔佐。時有宦官曹節等弄權，竇武、陳蕃謀誅之，作事不密，反為所害。中涓自此愈橫。
建寧二年四月望日，帝御溫德殿。方陞座，殿角狂風驟起，只見一條大青蛇，從梁上飛將下來，蟠於椅上。帝驚倒，左右急救入宮，百官俱奔避。須臾，蛇不見了。忽然大雷大雨，加以冰雹，落到半夜方止，壞卻房屋無數。建寧四年二月，洛陽地震；又海水泛溢，沿海居民，盡被大浪捲入海中。光和元年，雌雞化雄。六月朔，黑氣十餘丈，飛入溫德殿中。秋七月，有虹見於玉堂；五原山岸，盡皆崩裂。種種不祥，非止一端。
帝下詔問群臣以災異之由，議郎蔡邕上疏，以為蜺墮雞化，乃婦寺干政之所致，言頗切直。帝覽奏歎息，因起更衣。曹節在後竊視，悉宣告左右‧遂以他事陷邕於罪，放歸田里。後張讓，趙忠，封諝，段珪，曹節，候覽，蹇碩，程曠，夏惲，郭勝十人朋比為奸，號為「十常侍」。帝尊信張讓，呼為「阿父」，朝政日非，以致天下人心思亂，盜賊蜂起。
時鉅鹿郡有兄弟三人：一名張角，一名張寶，一名張梁。那張角本是個不第秀才。因入山採藥，遇一老人，碧眼童顏，手執藜杖，喚角至一洞中，以天書三卷授之，曰：「此名太平要術。汝得之，當代天宣化，普救世人；若萌異心，必獲惡報。」角拜問姓名。老人曰：「吾乃南華老仙也。」言訖，化陣清風而去。
角得此書，曉夜攻習，能呼風喚雨，號為太平道人。中平元年正月內，疫氣流行，張角散施符水，為人治病，自稱大賢良師。角有徒弟五百餘人，雲游四方，皆能書符念咒。次後徒眾日多，角乃立三十六方，─大方萬餘人，小方六七千─，各立渠帥，稱為將軍。訛言「蒼天已死，黃天當立。」又云「歲在甲子，天下大吉。」令人各以白土，書「甲子」二字於家中大門上。青、幽、徐、冀、荊、揚、兗、豫八州之人，家家侍奉大賢良師張角名字。角遣其黨馬元義，暗齎金帛，結交中涓封諝，以為內應。角與二弟商議曰：「至難得者，民心也。今民心已順，若不乘勢取天下，誠為可惜。」遂一面私造黃旗，約期舉事；一面使弟子唐州，馳書報封諝。唐州乃逕赴省中告變。帝召大將軍何進調兵擒馬元義，斬之；次收封諝等一干人下獄。
張角聞知事露，星夜舉兵，自稱天公將軍，─張寶稱地公將軍，張梁稱人公將軍─。申言於眾曰：「今漢運將終，大聖人出﹔汝等皆宜順從天意，以槳太平。」四方百姓，裹黃巾從張角反者，四五十萬。賊勢浩大，官軍望風而靡。何進奏帝火速降詔，令各處備禦，討賊立功；一面遣中郎將盧植，皇甫嵩，朱雋，各引精兵，分三路討之。
且說張角一軍，前犯幽州界分。幽州太守劉焉，乃江夏竟陵人氏，漢魯恭王之後也；當時聞得賊兵將至，召校尉鄒靖計議。靖曰：「賊兵眾，我兵寡，明公宜作速招軍應敵。」劉焉然其說，隨即出榜招募義兵。榜文行到涿縣，乃引出涿縣中一個英雄。
那人不甚好讀書；性寬和，寡言語，喜怒不形於色；素有大志，專好結交天下豪傑；生得身長七尺五寸，兩耳垂肩，雙手過膝，目能自顧其耳，面如冠玉，脣若塗脂；中山靖王劉勝之後，漢景帝閣下玄孫﹔姓劉，名備，字玄德。昔劉勝之子劉貞，漢武時封涿鹿亭侯，後坐酬金失侯，因此遺這一枝在涿縣。玄德祖劉雄，父劉弘。弘曾舉孝廉，亦嘗作吏，早喪。玄德幼孤，事母至孝；家貧，販屨織蓆為業。家住本縣樓桑村。其家之東南，有一大桑樹，高五丈餘，遙望之，童童如車蓋。相者云：「此家必出貴人。」
玄德幼時，與鄉中小兒戲於樹下，曰：「我為天子，當乘此車蓋。」叔父劉元起奇其言，曰：「此兒非常人也！」因見玄德家貧，常資給之。年十五歲，母使游學，嘗師事鄭玄、盧植；與公孫瓚等為友。及劉焉發榜招軍時，玄德年己二十八歲矣。當日見了榜文，慨然長歎。隨後一人厲聲言曰：「大丈夫不與國家出力，何故長歎？」
玄德回視其人：身長八尺，豹頭環眼，燕頷虎鬚，聲若巨雷，勢如奔馬。玄德見他形貌異常，問其姓名。其人曰：「某姓張，名飛，字翼德。世居涿郡，頗有莊田，賣酒屠豬，專好結交天下豪傑。適纔見公看榜而歎，故此相問。」玄德曰：「我本漢室宗親，姓劉，名備。今聞黃巾倡亂，有志欲破賊安民；恨力不能，故長歎耳。」飛曰：「吾頗有資財，當招募鄉勇，與公同舉大事，如何？」玄德甚喜，遂與同入村店中飲酒。
正飲間，見一大漢，推著一輛車子，到店門首歇了；入店坐下，便喚酒保：「快斟酒來吃，我待趕入城去投軍。」玄德看其人：身長九尺，髯長二尺：面如重棗，脣若塗脂；丹鳳眼，臥蠶眉：相貌堂堂，威風凜凜。玄德就邀他同坐，叩其姓名。其人曰：「吾姓關，名羽，字壽長，後改雲長，河東解良人也。因本處勢豪，倚勢凌人，被吾殺了；逃難江湖，五六年矣。今聞此處招軍破賊，特來應募。」玄德遂以己志告之。雲長大喜。同到張飛莊上，共議大事。
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">
								<div class="checkbox">
									<label> <input type="checkbox" id="read">
										我已閱讀使用條款
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-7">
								<button type="submit" class="btn btn-default">確認送出</button>
							</div>
						</div>
					</form>


					<div class="col-xs-12">
						<br /> <br /> <br />
					</div>
				</div>
			</div>

		</div>

		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>


	</div>
</body>
</html>