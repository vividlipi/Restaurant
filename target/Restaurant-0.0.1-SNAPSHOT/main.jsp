<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home</title>
<style type="text/css">
#menu{
width:1100px;
padding:0.625rem;
background: #f1f1f1;
margin:0 auto;
}
#left {
	width: 200px;
	float: left;
}

#menu-cards {
	width: 720px;
	padding-bottom: 10px;
	margin-left: 250px;
	background-color: #f1f1f1;
}

#cell {
	height: 240px;
	width: 230px;
	background: white;
	float: left;
	margin: 5px;
}

#bottom {
	height: 30px;
	width: 230px;
	background-image: linear-gradient(#f3f3f3, #fff 15px, #fff);
}
#foot{
background-color: #f1f1f1;
	margin-top: 1400px;
}
#name {
	height: 30px;
	width: 227px;
	font-size: 15px;
	text-align: center;
}

#sp {
	font-size: 18px;
	color: green;
}

#link {
	display: block;
	font-weight: bold;
	color: #FFFFFF;
	background-color: #98bf21;
	width: 80px;
	text-align: center;
	padding: 4px;
	margin-left: 145px;
	font-size: 18px;
	text-decoration: none;
	margin-top: -15px;
}

</style>
</head>
<body style="background: #f1f1f1">
<div id="menu">
	<jsp:include page="Index/top.jsp"></jsp:include>
	<div id="left">
		<jsp:include page="left.jsp"></jsp:include>
	</div>
	<div id="menu-cards"></div>
	




	<script type="text/javascript">
		var carValue = "";
		window.onload = function() {
			var info;
			$.ajax({
				async : false,
				url : "${APP_PATH}/dishes",
				type : "get",
				success : function(result) {
					info = result.extend.dishes;
				}
			});
			for ( var i in info) {
				//alert(info[i].name);

				var $div1 = $("<div id='cell'></div>");

				var $div2 = $("<div id='image'></div>");
				var $img = $("<img width='215' height='150'>");
				$img.attr('src', "${APP_PATH}/" + info[i].pic);
				$div2.append($img);

				var $div3 = $("<div id='name'>" + info[i].name + "</div>");

				var $div4 = $("<div id='bottom'></div>");
				var $span = $("<span id='sp'>￥" + info[i].price + "起</span>");
				var $a = $("<input type='button' class="+info[i].id+" id='link' value='添 加' >");
				$div4.append($span).append($a);

				$div1.append($div2).append($div3).append($div4);
				$("#menu-cards").append($div1);
			}
			$(document).on("click", "#link", function() {
				var id = $(this).attr("class");
				carValue = carValue + id + ",";
				$(this).attr("value","已添加").attr("disabled","disabled");
			});
		}

		function getDishes(kind) {
			$("#menu-cards").empty();
			var info;
			$.ajax({
				async : false,
				url : "${APP_PATH}/dishes/" + kind,
				type : "get",
				success : function(result) {
					info = result.extend.dishes;
				}
			});
			for ( var i in info) {
				//alert(info[i].name);

				var $div1 = $("<div id='cell'></div>");

				var $div2 = $("<div id='image'></div>");
				var $img = $("<img width='215' height='150'>");
				$img.attr('src', "${APP_PATH}/" + info[i].pic);
				$div2.append($img);

				var $div3 = $("<div id='name'>" + info[i].name + "</div>");

				var $div4 = $("<div id='bottom'></div>");
				var $span = $("<span id='sp'>￥" + info[i].price + "起</span>");
				var $a = $("<input type='button' class="+info[i].id+" id='link' value='添 加' >");
				$div4.append($span).append($a);

				$div1.append($div2).append($div3).append($div4);
				$("#menu-cards").append($div1);
			}
		}
		$("#menu0").click(function() {
			var info;
			$.ajax({
				async : false,
				url : "${APP_PATH}/dishes",
				type : "get",
				success : function(result) {
					info = result.extend.dishes;
				}
			});
			for ( var i in info) {
				//alert(info[i].name);

				var $div1 = $("<div id='cell'></div>");

				var $div2 = $("<div id='image'></div>");
				var $img = $("<img width='215' height='150'>");
				$img.attr('src', "${APP_PATH}/" + info[i].pic);
				$div2.append($img);

				var $div3 = $("<div id='name'>" + info[i].name + "</div>");

				var $div4 = $("<div id='bottom'></div>");
				var $span = $("<span id='sp'>￥" + info[i].price + "起</span>");
				var $a = $("<input type='button' class="+info[i].id+" id='link' value='添 加' >");
				$div4.append($span).append($a);

				$div1.append($div2).append($div3).append($div4);
				$("#menu-cards").append($div1);
			}
		});
		$("#menu1").click(function() {
			getDishes(1);
		});
		$("#menu2").click(function() {
			getDishes(2);
		});
		$("#menu3").click(function() {
			getDishes(3);
		});
		$("#menu4").click(function() {
			getDishes(4);
		});
		$("#menu5").click(function() {
			getDishes(1);
		});
		$("#menu6").click(function() {
			getDishes(3);
		});

		function setCookie(cname, cvalue, exdays) {
			var d = new Date();
			d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
			var expires = "expires=" + d.toGMTString();
			document.cookie = cname + "=" + cvalue + "; " + expires;
		}
		$("#myCar").click(function() {
			setCookie("car",carValue,1);
		})
	</script>
	</div>
	<div id="foot">
	<jsp:include page="bottom.jsp"></jsp:include>
	</div>
</body>
</html>



