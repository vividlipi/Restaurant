<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的订单</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%><style type="text/css">
#body1 {
	width: 1100px;
	height: 1100px;
	margin: 0 auto;
	margin-top: 0.625rem;
}
</style>
</head>
<body style="background: #f1f1f1">
	<div id="body1">
		<div id="top">
			<jsp:include page="/Index/top.jsp"></jsp:include>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>商品信息</th>
							<th>商品图片</th>
							<th>单价</th>
							<th>数量</th>
							<th>金额</th>
							<th>操作</th>

						</tr>
					</thead>
					<tbody id="table_build">

					</tbody>
				</table>
				<div style="float: right; margin-right: 150px;">
					<p style="font-size: 21px;" id="TOTAL"></p>
				</div>

				<div style="float: right; margin-right: -40px; margin-top: 50px;">
					<button class="btn btn-success btn-lg">结算</button>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			var TOTLE = 0;
			var ids = [];

			window.onload = function() {
				$("#nav_mycar").addClass("active");
				var car = $.cookie('car');
				$
						.ajax({
							url : "${APP_PATH}/dealCar",
							data : "car=" + car,
							type : "get",
							success : function(result) {
								var dishes = result.extend.dishs;
								$
										.each(
												dishes,
												function(index, item) {
													ids.push(1);
													TOTLE += item.price;
													var checkbox = $("<td><input type='checkbox' class='littlecheckbox'/></td>");
													var name = $("<td></td>")
															.append(item.name);
													var pic = $("<td></td>")
															.append(
																	$(
																			"<img ></img>")
																			.attr(
																					"src",
																					item.pic)
																			.addClass(
																					"img-responsive")
																			.attr(
																					"style",
																					"width:80px;"))
													var price = $("<td></td>")
															.append(item.price);
													var total = $("<td></td>")
															.append(item.price);

													//构建 2个按钮，中间一个文本框控制数量
													var left = $("<li></li>")
															.append(
																	$("<a></a>")
																			.addClass(
																					"edit_href_left")
																			.attr(
																					"href",
																					"#")
																			.append(
																					$(
																							"<span></span>")
																							.append(
																									"&laquo;")
																							.attr(
																									"aria-hidden",
																									"true")));
													var right = $("<li></li>")
															.append(
																	$("<a></a>")
																			.addClass(
																					"edit_href_right")
																			.attr(
																					"href",
																					"#")
																			.append(
																					$(
																							"<span></span>")
																							.append(
																									"&raquo;")
																							.attr(
																									"aria-hidden",
																									"true")));
													var text = $("<li></li>")
															.append(
																	$(
																			"<span></span>")
																			.attr(
																					"id",
																					index)
																			.append(
																					"1")
																			.attr(
																					"style",
																					"color: red;"));
													var button_group = $(
															"<td></td>")
															.append(
																	$(
																			"<ul></ul>")
																			.append(
																					left)
																			.append(
																					text)
																			.append(
																					right)
																			.attr(
																					"style",
																					"margin:0px;")
																			.addClass(
																					"pagination"));
													var num = $("<td>1</td>");
													var button_delete = $(
															"<button></button>")
															.addClass(
																	"btn btn-danger btn-sm delete-btn")
															.attr("id",
																	"del-btn")
															.append(
																	$(
																			"<span></span>")
																			.addClass(
																					"glyphicon glyphicon-trash"))
															.append("删除")
															.attr("delete-id",
																	item.id);
													$("<tr></tr>")
															.append(checkbox)
															.append(name)
															.append(pic)
															.append(price)
															.append(
																	button_group)
															.append(total)
															.append(
																	button_delete)
															.appendTo(
																	$("#table_build"));
												});
								$("#TOTAL").html("一共" + TOTLE + "元");
							}
						});

			};
			//绑定事件
			$(document).on(
					"click",
					".edit_href_right",
					function() {
						var now = $(this).parents("ul").find("span:eq(1)");
						var nownum = now.text();
						var future = parseInt(nownum) + 1;
						now.text(future);
						//同时更新金额
						var total = parseInt($(this).parents("tr").find(
								"td:eq(5)").text());
						var price = parseInt($(this).parents("tr").find(
								"td:eq(3)").text());
						$(this).parents("tr").find("td:eq(5)").text(
								total + price);
						TOTLE += price;
						$("#TOTAL").html("一共" + TOTLE + "元");
					});
			$(document).on(
					"click",
					".edit_href_left",
					function() {

						var now = $(this).parents("ul").find("span:eq(1)");
						var nownum = now.text();
						if (nownum > 1) {
							var future = parseInt(nownum) - 1;
							now.text(future);
							var total = parseInt($(this).parents("tr").find(
									"td:eq(5)").text());
							var price = parseInt($(this).parents("tr").find(
									"td:eq(3)").text());
							$(this).parents("tr").find("td:eq(5)").text(
									total - price);
							TOTLE -= price;
							$("#TOTAL").html("一共" + TOTLE + "元");
						}
						return false;
					});

			$(document).on(
					"click",
					"#del-btn",
					function() {

						var total = parseInt($(this).parents("tr").find(
								"td:eq(5)").text());
						TOTLE = TOTLE - total;
						$("#TOTAL").html("一共" + TOTLE + "元");
						$(this).parents("tr").empty();

					})
		</script>
	</div>
</body>
</html>