<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>adminList page</title>

	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>
	<!-- web路径
		不以/开始的相对路径，找资源，以当前资源为基准，经常容易出错
		以/开始的相对路径，找资源，以服务器的路径为基准(http://localhost:3306); 需要加上项目名
		http://localhost:3306/crud

-->

	<!-- Bootstrap -->
	<link href="${APP_PATH }/static/Bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
	<!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
	<!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  	<![endif]-->
  	
</head>

<body>
	
	<!-- Modal 管理员修改 -->
	<div class="modal fade" id="inspectionUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
					<h4 class="modal-title">修改</h4>
				</div>
							<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="update_person" class="col-sm-2 control-label">巡查人</label>
							<div class="col-sm-8 ">
								<input type="text" class="form-control" name="person" id="update_person" placeholder="巡查人"><span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="update_type" class="col-sm-2 control-label">类型</label>
							<div class="col-sm-8">
								<input type="text" name="type" class="form-control" id="update_type" placeholder="类型"><span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="update_itime" class="col-sm-2 control-label">时间</label>
							<div class="col-sm-8">
								<input type="text" name="itime" class="form-control" id="update_itime" placeholder="时间:如2018/2/23"><span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="update_conductor" class="col-sm-2 control-label">处理人</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="conductor" id="update_conductor" placeholder="处理人">
							</div>
						</div>
						<div class="form-group">
							<label for="update_party" class="col-sm-2 control-label">当事人</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="party" id="update_party" placeholder="当事人">
							</div>
						</div>
						<div class="form-group">
							<label for="update_result" class="col-sm-2 control-label">巡查结果</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="result" id="update_result" placeholder="巡查结果">
							</div>
						</div>
						<div class="form-group">
							<label for="update_memo" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea class="form-control" name="memo" id="update_memo" placeholder="..."></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="inspection_update_butn">更新</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 管理员添加 -->
	<div class="modal fade" id="inspectionAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
					<h4 class="modal-title" id="myModalLabel">添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="person" class="col-sm-2 control-label">巡查人</label>
							<div class="col-sm-8 ">
								<input type="text" class="form-control" name="person" id="person" placeholder="巡查人"><span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="type" class="col-sm-2 control-label">类型</label>
							<div class="col-sm-8">
								<input type="text" name="type" class="form-control" id="type" placeholder="类型"><span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="itime" class="col-sm-2 control-label">时间</label>
							<div class="col-sm-8">
								<input type="text" name="itime" class="form-control" id="itime" placeholder="时间:如2018/2/23"><span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="conductor" class="col-sm-2 control-label">处理人</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="conductor" id="conductor" placeholder="处理人">
							</div>
						</div>
						<div class="form-group">
							<label for="party" class="col-sm-2 control-label">当事人</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="party" id="party" placeholder="当事人">
							</div>
						</div>
						<div class="form-group">
							<label for="result" class="col-sm-2 control-label">巡查结果</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="result" id="result" placeholder="巡查结果">
							</div>
						</div>
						<div class="form-group">
							<label for="memo" class="col-sm-2 control-label">备注</label>
							<div class="col-sm-8">
								<textarea class="form-control" name="memo" id="memo" placeholder="..."></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="inspection_save_butn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 col-md-offset-6">
				<form class="navbar-form navbar-left" action="#">
					<button type="button" class="btn btn-primary" id="inspection_add_modal_btn">新增</button>

					<button type="button" class="btn btn-danger" id="inspection_delete_all_btn">删除</button> &nbsp;&nbsp;&nbsp;
					<!-- <div class="form-group">
						<input style="display:none">
						<input type="text" class="form-control" placeholder="输入时间" id="inspection_search_text">
					</div>
					<button type="button" class="btn btn-default" id="inspection_search_btn">搜索</button> -->
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="inspection_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all"/>
							</th>
							<th>编号</th>
							<th>巡查人</th>
							<th>类型</th>
							<th>时间</th>
							<th>处理人</th>
							<th>当事人</th>
							<th>巡查结果</th>
							<th>备注</th>
							<th>操作</th>						</tr>
					</thead>
					<tbody>

					</tbody>

				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">

			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area"></div>

			<!-- 分页条信息 -->
			<div class="col-md-5 col-md-offset-1" id="page_nav_area"></div>
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${APP_PATH }/static/js/jquery-3.3.1.js"></script>
	<script src="${APP_PATH }/static/Bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var totalRecord,currentPag;
		//1.页面加载完成以后，直接发送一个ajax请求，要到分页数据
		$(function() {
			//去首页
			to_page(1);
		});

		function to_page(pn) {
			$.ajax({
				url: "${APP_PATH }/inspections",
				data: "pn=" + pn,
				type: "GET",
				success: function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_inspection_table(result);
					//2.解析分页信息数据
					build_page_info(result);
					//解析分页条数据
					build_page_nav(result);
				}
			});
		}

		function build_inspection_table(result) {
			//清空table表
			$("#inspection_table tbody").empty();

			var adms = result.extend.pageInfo.list;
			$.each(adms, function(index, item) {
				
				var checkBox = $("<td><input type='checkbox' class='check_item'/></tb>");
				
				var inspectionId = $("<td></td>").append(item.id);
				var inspectionPerson = $("<td></td>").append(item.person);
				var inspectionType = $("<td></td>").append(item.type);
				
				var time = Number(item.itime);
				var transTime = new Date(time);
				var itime = transTime.toLocaleDateString();
				var inspectionItime = $("<td></td>").append(itime);
				
				var inspectionConductor = $("<td></td>").append(item.conductor);
				var inspectionParty = $("<td></td>").append(item.party);
				var inspectionResult = $("<td></td>").append(item.result);
				var inspectionmemo = $("<td></td>").append(item.memo);
				

				//构建按钮
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
					.append($("<span></span>")
					.addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加一个自定义的属性，来表示当前管理员的id
				editBtn.attr("edit-id", item.id);
				
				var delBtn = $("<button></button>")
					.addClass("btn btn-danger btn-sm delete_btn")
					.append($("<span></span>")
					.addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加一个自定义的属性，来表示当前管理员的id
				delBtn.attr("del-id", item.id);
				
				var btnTd = $("<td></td>")
					.append(editBtn)
					.append(" ")
					.append(delBtn);

				$("<tr></tr>").append(checkBox)
				.append(inspectionId)
				.append(inspectionPerson)
				.append(inspectionType)
				.append(inspectionItime)
				.append(inspectionConductor)
				.append(inspectionParty)
				.append(inspectionResult)
				.append(inspectionmemo)
				.append(btnTd)
				.appendTo("#inspection_table tbody");
			});
		}

		//分页信息数据
		function build_page_info(result) {
			//清空
			$("#page_info_area").empty();

			$("#page_info_area").append(
				"当前" + result.extend.pageInfo.pageNum + "页,总" +
						 result.extend.pageInfo.pages + "页 ,总" +
						 result.extend.pageInfo.total + "条记录")
			
			totalRecord = result.extend.pageInfo.total;
			currentPag = result.extend.pageInfo.pageNum;
		}

		//解析显示分页条,点击动作
		function build_page_nav(result) {
			//清空
			$("#page_nav_area").empty();

			//page_nav_area
			var ul = $("<ul></ul>").addClass("pagination");

			//构建元素
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
			if(result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页事件
				//首页
				firstPageLi.click(function() {
					to_page(1);
				});
				//上一页
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1);
				});
			}

			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
			if(result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				//下一页
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1);
				});
				//末页
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages);
				});
			}

			//下一页
			nextPageLi.click(function() {
				to_page(result.extend.pageInfo.pageNum + 1);
			});
			//末页
			lastPageLi.click(function() {
				to_page(result.extend.pageInfo.pages);
			});

			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);

			//遍历给ul添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
				item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
				if(result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});

			//添加下一页和末页的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav中
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}

		//重置表单内容及样式
		function reset_form(ele) {
			//清除表单数据 表单重置
			$(ele)[0].reset();
			//重置表单的样式
			$(ele).find("*").removeClass("has-success has-error");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增按钮
		$("#inspection_add_modal_btn").click(function() {

			reset_form("#inspectionAddModal form");
			//弹出模态框
			$("#inspectionAddModal").modal({
				backdrop: "static"
			});
		});

		//校验表单数据
		function validate_add_form() {
			//拿到要校验的数据，使用正则表达式
			var adminName = $("#person").val();
			var regName = /(^[a-zA-Z0-9_-]{2,6}$)|(^[\u2E80-\u9FFF]{2,6})/
			if(!regName.test(adminName)) {
				show_validate_msg("#person", "error","巡查人可以是2-6位数字字母的组合");
				return false;
			} else {
				show_validate_msg("#person", "success", "");
				return true;
			};
		}

		//校验抽取
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);

			} else if("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}

		//绑定一个change事件，巡查人改变验证
		$("#person").change(
			function() {
				//发送ajax请求校验是否门牌号是否可用
				var num = this.value;
				$.ajax({
					url: "${APP_PATH}/checkInspection",
					data: "num=" + num,
					type: "POST",
					success: function(result) {
						if(result.code == 100) {
							show_validate_msg("#person","success", "可用");
							$("#inspection_save_butn").attr("ajax-va", "success");
						} else {
							show_validate_msg("#person","error", result.extend.va_msg);
							$("#inspection_save_butn").attr("ajax-va", "error");
						}
					}

				});

			});

		//保存按钮绑定单击事件，点击保存，保存管理员
		$("#inspection_save_butn")
			.click(
				function() {
					//模态框填写的表单数据提交给服务器进行保存

					//先对要提交给服务器的数据进行校验。
					if(!validate_add_form()) {
						return false;
					};

					//判断之前的ajax用户名校验是否成功
					if($(this).attr("ajax-va") == "error") {
						return false;
					}

					//发送ajax保存
					$.ajax({
						url: "${APP_PATH}/inspection",
						type: "POST",
						data: $("#inspectionAddModal form").serialize(),
						success: function(result) {
							//alert(result.msg);

							if(result.code == 100) {
								//保存成功
								//1.关闭模态框
								$("#inspectionAddModal").modal('hide');

								//2.来到最后一页,显示保存的数据
								//发送ajax请求显示最后一页数据即可
								//总记录数作为页码
								to_page(totalRecord);
							} else {
								//显示失败信息
								//console.log(result);
								if(undefined != result.extend.errorFields.name) {
									//显示用户名错误信息
									show_validate_msg(
										"#inspectionNum_add_input",
										"error",
										result.extend.errorFields.name);
								}
								if(undefined != result.extend.errorFields.password) {
									//显示密码错误信息inspectionPassword
									show_validate_msg(
										"#inspectionPassword",
										"error",
										result.extend.errorFields.password);
								}
							}
						}
					});
				});
		
		//1.我们是按钮创建之前绑定了click，所有绑不上
		//1）,在创建按钮的时候绑定。 2). 绑定.live(),使用on替代
		
		//修改按钮添加点击事件
		$(document).on("click",".edit_btn",function() {
			//alert("edit");
			//查出管理员信息
			getInspection($(this).attr("edit-id"));
			
			//把id传递给模态框的更新按钮
			$("#inspection_update_butn").attr("edit-id", $(this).attr("edit-id"));
			
			//打开模态框
			$("#inspectionUpdateModal").modal({
				backdrop: "static"
			});
			
		});
		
		//数据回显
		function getInspection(id) {
			$.ajax({
				url:"${APP_PATH}/inspection/" +id,
				type:"GET", 
				success:function(result) {
					//console.log(result);
					var inspectionData = result.extend.inspection;
					$("#update_person").val(inspectionData.person);
					$("#update_type").val(inspectionData.type);
					$("#update_conductor").val(inspectionData.conductor);
					$("#update_party").val(inspectionData.party);
					$("#update_result").val(inspectionData.result);
					$("#update_memo").val(inspectionData.memo);
					
				}
			});
		}
		
		//点击更新   更新管理员
		$("#inspection_update_butn").click(function() {
			//验证
			
			// 发送ajax请求，保存更新
			$.ajax({
				url:"${APP_PATH}/inspection/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#inspectionUpdateModal form").serialize(),
				success:function(result){
					//alert(result.msg);
					
					//关闭对话框
					$("#inspectionUpdateModal").modal("hide");
					
					//回到本页面
					to_page(currentPag);
				}
			});
		});
		
		//单个删除按钮添加点击事件
		$(document).on("click",".delete_btn",function(){
			//弹出是否确认删除对话框
			var adminName = $(this).parents("tr").find("td:eq(2)").text();
			var admid = $(this).attr("del-id");
			if(confirm("确认删除【" + adminName + "】吗？")) {
				$.ajax({
					url:"${APP_PATH}/inspection/"+admid,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页
						to_page(currentPag);
					}
				});
			}
		});
		
		//完成全选 /全不选
		$("#check_all").click(function() {
			//attr获取checked是undefined
			//attr获取自定义属性的值
			//prop修改和读取dom原生属性的值
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		
		$(document).on("click", ".check_item",function(){
			var flag = $(".check_item:checked").length == $(".check_item").length ;
			$("#check_all").prop("checked", flag);
		});
		
		//点击全部删除，批量删除
		//inspection_delete_all_btn
		$("#inspection_delete_all_btn").click(function(){
			var adminName = "";
			var del_idstr = "";
			$.each($(".check_item:checked"), function(){
				//组装name字符串
				adminName += $(this).parents("tr").find("td:eq(2)").text() + ",";
				//组装id字符串
				del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
			});
			//去除adminName 多余的','
			adminName = adminName.substring(0, adminName.length-1);
			//去除adminName 多余的'-'
			del_idstr = del_idstr.substring(0, del_idstr.length-1);
			
			if(confirm("确认删除【" + adminName +"】吗？")) {
				//发送ajax请求
				$.ajax({
					url:"${APP_PATH}/inspection/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//回到本页
						to_page(currentPag);
					}
				});
			}
		});
		
		//搜索框点击事件
		$("#inspection_search_btn").click(function(){
			var num = $("#inspection_search_text").val();
			$.ajax({
				url: "${APP_PATH }/inspections/"+ num,
				type: "GET",
				success: function(result) {
					//console.log(result);
					//1.解析并显示员工数据
					build_inspection_table(result);
					//2.解析分页信息数据
					build_page_info(result);
					//解析分页条数据
					build_page_nav(result);
				}
			});
		});
		
	</script>
</body>

</html>