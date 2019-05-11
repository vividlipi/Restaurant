<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="css/base.css">
		<link rel="stylesheet" href="./layui/css/layui.css">
		<style>
			#left{padding-bottom: 10px;}
			ul.bg_yellow{
				background: #ffc423;
			}
			ul .layui-nav{
				border-radius: 3px;
			}
			ul.layui-nav-tree .layui-nav-itemed{
				-webkit-box-shadow: 0 2px 1px #d69c00;
				border-bottom: 1px solid #efaf00;
				box-shadow: 0 2px 2px #d69c00;
			}
			ul.layui-nav-tree .layui-nav-item{
				-webkit-box-shadow: 0 2px 1px #d69c00;
				box-shadow: 0 2px 2px #d69c00;
			}
			.layui-nav .layui-nav-child dd.layui-this a, .layui-nav-child dd{
				border-bottom: 1px solid #ffd256;
				border-bottom: 1px solid #efaf00;
			}
/* 			ul.bg_yellow:hover{
				background-color: #ffc423;
				
				display: block; 
			} */
			ul.a:hover{
				background: #d69c00;
			}
			.layui-nav-tree .amenu a{
				color: #a25716;
				border-bottom: 1px solid #efaf00;
			}
			.layui-nav-tree .amenu a:hover{
				color: #e71b23;
			}
			.layui-nav-tree .layui-nav-child a{
				color: #a25716;
			}
			.layui-nav-tree .layui-nav-child a:hover{
				color: #e71b23;
			}
			.layui-nav-itemed > .layui-nav-child{
				background-color: #ffc423 !important;
			}
			.layui-nav-tree .layui-nav-bar{	/*左侧的条条*/
				background-color: #FBFBFB;
			}
			.layui-nav-tree .layui-nav-item a:hover{ /*ul 鼠标移上去时的背景色*/
				background: #ffc423;
			}
			ul.layui-nav-tree .layui-nav-child dd.layui-this, .layui-nav-tree .layui-nav-child dd.layui-this a, .layui-nav-tree .layui-this, .layui-nav-tree .layui-this > a, .layui-nav-tree .layui-this > a:hover{
				background-color: #ffc423;
				color: #e71b23;
			}
		</style>
	</head>
	<body>
<!-- 左部导航 -->
<div id="left">
	<ul class="layui-nav layui-nav-tree layui-inline bg_yellow"  lay-filter="demo">
	  <li class="layui-nav-item layui-nav-itemed">
		<dl class="layui-nav-child">
		  <dd><a href="javascript:;" id="menu1" onclick="loadOrder();">历史订单</a></dd>
		  <dd><a href="javascript:;" id="menu2" onclick="loadPersonDetail();">个人信息</a></dd>
		  <dd><a href="javascript:;" id="menu3" onclick="loadChangePwd();">修改密码</a></dd>
		</dl>
	  </li>
	</ul>
</div>
	<script type="text/javascript">
	function loadOrder() {
		$("#main").load("./myAccountOrder.html");
	}
	function loadPersonDetail() {
		$("#main").load("./myAccountPersonDetail.html");
	}
	function loadChangePwd() {
		$("#main").load("./myAccountChangePwd.jsp");
	}
	</script>
	</body>
</html>
