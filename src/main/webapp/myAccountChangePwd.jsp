<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link href="layui/css/layui.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-3.3.1.js"></script>
	</head>
	<body>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label" style="width:100px;">原密码</label>
				<div class="layui-input-inline">
					<input id="rawPwd" type="password" name="raw" autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label" style="width:100px;">新密码</label>
				<div class="layui-input-inline">
					<input id="newPwd" type="password" name="new" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label" id="newPwdTip" style="width:200px;"></label>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label" style="width:100px;">确认密码</label>
				<div class="layui-input-inline">
					<input id="repeatPwd" type="password" name="newrepeat" autocomplete="off" class="layui-input">
				</div>
				<label class="layui-form-label" id="repeatPwdTip" style="width:200px;"></label>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width:100px;"></label>
			<div class="layui-input-block">
				<button id="confirmBtn" class="layui-btn" style="background:#ffc423" lay-filter="demo1">确认修改</button>
			</div>
		</div>
		<div class="layui-form-item">
			<label id="changePwdResponse" class="layui-form-label"></label>
		</div>
		<script type="text/javascript">
			function isPasswd(s) {
				var patrn = /^(\w){6,20}$/;
				if (!patrn.exec(s)) return false
				return true
			}

			function validate() {
				var pwd1 = document.getElementById("newPwd").value;
				var pwd2 = document.getElementById("repeatPwd").value;

				//<!-- 对比两次输入的密码 -->
				if (pwd1 == pwd2) {
					document.getElementById("repeatPwdTip").innerHTML = "";
					document.getElementById("confirmBtn").disabled = false;
					return true;
				} else {
					document.getElementById("repeatPwdTip").innerHTML = "两次密码输入不相同";
					document.getElementById("confirmBtn").disabled = true;
					return false;
				}

			}
			//          生成json数据
			// 			function GetJsonData() {
			// 				var json = {
			// 					"classid": 2,
			// 					"name": $("#tb_name").val(),
			// 					"zlclass": "测试类型1,测试类型2,测试类型3",
			// 					"pname": $("#tb_contact_people").val(),
			// 					"tel": $("#tb_contact_phone").val()
			// 				};
			// 				return json;
			// 			}

			$(function() {
				$("#repeatPwd").bind('input porpertychange', function() {
					validate();
				});
			});
			$("#newPwd").blur(function() {
				var newpwd = document.getElementById("newPwd").value;
				if (!isPasswd(newpwd)) {
					document.getElementById("newPwdTip").innerHTML = "新密码不符合要求";
				} else {
					document.getElementById("newPwdTip").innerHTML = "";
				}
			});
			$("#confirmBtn").click(function() {
				if (validate() && isPasswd($("#rawPwd").val()) && isPasswd($("#newPwd").val())) {
					$.ajax({
						type: "POST",
						//xxtodo:加入POST请求地址
						url: "http://127.0.0.1:8848/LearnLayUI/myAccountChangePwd",
						dataType: "json",
						data: {
							rawp: $("#rawPwd").val(),
							newp: $("#newPwd").val(),
							repeatp: $("#repeatPwd").val()
						},
						//xxtodo:可能发送json数据
						// data: JSON.stringify(GetJsonData()),
						success: function(data) {
							if (data.success) {
								$("#changePwdResponse").html(data.msg);
								//xxtodo:修改成功跳转到主页
								window.location.replace("http://www.baidu.com");
							} else {
								$("#changePwdResponse").html("出现错误,请重试" + data.msg);
								document.getElementById("rawPwd").innerHTML = "";
								document.getElementById("newPwd").innerHTML = "";
								document.getElementById("repeatPwd").innerHTML = "";
							}
						},
						error: function(jqXHR) {
							console.log("发生错误：" + jqXHR.status);
						}
					});
				} else {
					//提示出错
				}
			});
		</script>
	</body>
</html>
    