<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/jquery-3.3.1.js"></script>
<script  src="${APP_PATH }/static/jquery.cookie.js"></script>
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<style type="text/css">
	.breadcrumb a, a:link, a:visited {
	    color: #3d3d3d;
	    font-weight: normal;
	    text-decoration: none;
	}
	
	.breadcrumb a:hover{
	    color: #ffc423;
	    text-decoration: none;
	}
	.navbar {
		border: none;
		border-radius: 10px;
	}
	.container-fluid{
	padding-right: 0px; 
    padding-left: 0px;
	}
	.dropdown-menu .divider {
		background-color:#00000000;
		
	}
	.divider {
	    margin-bottom: 8px;
	    padding-bottom: 0px;
	    border-bottom: 1px solid #ffc423;
	}
	</style>
</head>
<body>
<% if(session.getAttribute("loginInfo")!=null){%>
	<div id="top123">
		<ol class="breadcrumb text-right" style="background-color:#00000000; margin-bottom: 0px;">
			<li>欢迎登录，${sessionScope.loginInfo.name }</li>
			<li><a href="${APP_PATH }/invalidate">注销</a></li>
		</ol>
	</div>
	<%} else{%>
	<div id="top123">
		<ol class="breadcrumb text-right" style="background-color:#00000000; margin-bottom: 0px;">
			<li><a href="${APP_PATH }/homePage.jsp">登录</a></li>
			
		</ol>
	</div>
	<%}
	%>
	<div class="row">
		<nav class="navbar navbar-default  navbar-inverse">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="col-md-2">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="${APP_PATH }/homePage.jsp" style="background: #e81c25"><img
							style="margin-top: -12px;" alt="哈哈"
							src="${APP_PATH }/static/images/logo.jpg"></a>
					</div>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse "
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
					
						<li id="nav_menu"> <a href="${APP_PATH }/main.jsp">浏览菜单</a></li>
						<li id="nav_mycar"><a href="${APP_PATH }/car" id="myCar">我的订单</a></li>
						<li id="nav_account"><a href="#" >我的账户</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">帮助 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li role="separator" class="divider"></li>
								<li><a href="#">网站条款</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">隐私政策</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">订餐须知</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">常见问题</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">关于30分钟必达</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">关于我们</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">安全公示</a></li>
							</ul></li>
							
					</ul>
					<!-- 	<form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
				-->
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</div>
	<script type="text/javascript">
		function active(id) {
			$("#nav_menu").removeClass("active");
			$("#nav_mycar").removeClass("active");
			$("#nav_account").removeClass("active");
			$(id).addClass("active");
		}
		$("#nav_menu").click(function() {
			active("#nav_menu");
		});
		$("#nav_mycar").click(function() {
			active("#nav_mycar");
		});
		$("#nav_account").click(function() {
			active("#nav_account");
		});
	</script>
</body>
</html>