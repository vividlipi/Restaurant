<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${APP_PATH }</title>
<link rel="stylesheet" href="./layui/css/layui.css">
<link href="./layui/css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-3.3.1.js"></script>
<style>
	#menu-cards{width: 720px;padding-bottom: 10px; margin: 0 auto;}
	#cell{height:240px;width:230px;background:white;float: left;margin: 5px;}
	#bottom{padding-top:15px; height:30px;width:230px;background-image: linear-gradient(#f3f3f3,#fff 15px,#fff);} 
	#name{height:30px;width:227px;font-size:15px; text-align:center;}
	#sp{font-size: 18px;color: green;}
	#link{
		display:block;
		font-weight:bold;
		color:#FFFFFF;
		background-color:#98bf21;
		width:80px;
		text-align:center;
		padding:4px;
		margin-left:145px;
		font-size:18px;
		text-decoration:none;
		margin-top: -15px;
	}

</style>
<script type="text/javascript">
       var carValue="";
	window.onload=function (){
		var info;
		$.ajax({
			async: false,
			url:"${APP_PATH}/dishes",
			type:"get",
			success:function(result){
				info=result.extend.dishes;
				
			}
		});
		for(var i in info){
			//alert(info[i].name);
		
			var $div1=$("<div id='cell'></div>");
			
			var $div2=$("<div id='image'></div>");
			var $img=$("<img width='215' height='150'>");
			$img.attr('src',info[i].pic);
			$div2.append($img);
			
			var $div3=$("<div id='name'>"+info[i].name+"</div>");
			
			var $div4=$("<div id='bottom'></div>");
			var $span=$("<span id='sp'>￥"+info[i].price+"起</span>");
			var $a=$("<input type='button' class="+info[i].id+" id='link' value='添 加' >");
			$div4.append($span).append($a);
			
			$div1.append($div2).append($div3).append($div4);
			$("#menu-cards").append($div1);
		}		
		$(document).on("click","#link",function(){
			var id=$(this).attr("class");
			carValue=carValue+id+",";
			alert(carValue);
		});
	}
	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
		var expires = "expires=" + d.toGMTString();
		document.cookie = cname + "=" + cvalue + "; " + expires;
	}
	window.unonload=function(){
		alert("离开？");
	}
</script>
</head>
<body>
<div id="menu-cards">
</div>
</body>
</html>
