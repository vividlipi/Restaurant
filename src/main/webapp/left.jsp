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
		<span class="layui-nav-item layui-nav-itemed" style="color: #FFFFFF; box-shadow: 0 2px 2px #d69c00;">
		<a href="javascript:;" >菜单</a>
		</span>
		<span class=" amenu" style="color: #FFFFFF; box-shadow: 0 2px 2px #d69c00;">
		<a href="" style="color:" id="menu0">正餐菜单</a>
		</span>
		<dl class="layui-nav-child">
		  <dd><a href="javascript:;" id="menu1">促销产品和热卖产品</a></dd>
		  <dd><a href="javascript:;" id="menu2">主食和超值套餐</a></dd>
		  <dd><a href="javascript:;" id="menu3">小食</a></dd>
		  <dd><a href="javascript:;" id="menu4">甜品</a></dd>
		  <dd><a href="javascript:;" id="menu5">饮品</a></dd>
		  <dd><a href="javascript:;" id="menu6">开心乐园餐</a></dd>
		</dl>
	  </li>
	</ul>
</div>
	
	</body>
</html>
