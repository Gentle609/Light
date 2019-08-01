<%@page import="entity.Product"%>
<%@page import="impl.ProductDaoImpl"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%
	String[] ops = {"爱维加", "奥丹尼", "阿斯法", "北鹿源", "吊灯", "壁灯", "吸顶灯", "智能灯/音乐灯", "现代简约", "欧式", "后现代", "中式", "艺术个性",
			"锌合金", "木艺", "不锈钢", "水晶", "有机玻璃"};
	String strId = request.getParameter("id");
	if (strId == null)
		response.sendRedirect("list_product.jsp");
	ProductDaoImpl pdi = new ProductDaoImpl();
	Product p = pdi.getProductByID(Integer.parseInt(strId));
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link href="assets/css/codemirror.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="Widget/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
<link href="Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet"
	type="text/css" />
<title>添加商品</title>
<script type="text/javascript">
	function Juge(updateform) {
		if (updateform.pname.value == "") {
			window.alert("请输入商品名称！");
			updateform.pname.focus();
			return (false);
		}
		if (updateform.pcode.value == "") {
			window.alert("请输入商品编码！");
			updateform.pcode.focus();
			return (false);
		}
		if (updateform.num.value == "" || updateform.num.value.length == 0) {
			window.alert("请输入商品数量！");
			updateform.num.focus();
			return (false);
		}
		if (isNaN(updateform.num.value)) {
			alert("商品数量不能是字符!");
			updateform.num.focus();
			return false;
		}
		if (updateform.price.value == "") {
			window.alert("请输入商品价格！");
			updateform.price.focus();
			return (false);
		}
		if (isNaN(updateform.price.value)) {
			alert("价格不能是字符!");
			updateform.price.focus();
			return false;
		}
		if (updateform.pic.value == "") {
			window.alert("请选择商品图片！");
			updateform.pic.focus();
			return (false);
		}
		if (updateform.ad.value == "") {
			window.alert("请编辑商品广告信息！");
			updateform.ad.focus();
			return (false);
		}
	}
</script>
</head>
<body>
	<div class="clearfix" id="add_picture">
		<form class="form form-horizontal" id="form-article-add"
			name="updateform" method="post" action="../UpdateProductServlet"
			onsubmit="return Juge(updateform);">
			<input type="hidden" name="id" value="<%=p.getpId()%>">
			<div class="clearfix cl">
				<label class="form-label col-2"><span class="c-red"
					style="color: red">*</span>商品名称：</label>
				<div class="formControls col-10">
					<input type="text" class="input-text" placeholder="请输入商品名称"
						id="pname" name="pname" style="width: 450px;"
						value="<%=p.getpName()%>">
				</div>
			</div>
			<div class=" clearfix cl">
				<div class="Add_p_s">
					<label class="form-label col-2">商品编号：</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" name="pcode"
							value="<%=p.getpCode()%>">
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">商品类别：</label>
					<div class="formControls col-2">
						<select name="type">
							<%
								for (String s : ops) {
									if (s.equals(p.getType())) {
										out.print("<option value='" + s + "' selected>" + s + "</option>");
									} else {
										out.print("<option value='" + s + "'>" + s + "</option>");
									}
								}
							%>
						</select>
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">商品数量：</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" name="num"
							value="<%=p.getNumber()%>">
					</div>
				</div>
				<div class="Add_p_s">
					<label class="form-label col-2">商品价格：</label>
					<div class="formControls col-2">
						<input type="text" class="input-text" name="price"
							value="<%=p.getPrice()%>">
					</div>
				</div>
			</div>
			<div class="clearfix cl">
				<label class="form-label col-2">商品图片：</label>
				<div class="formControls col-10">
					<input type="text" class="input-text" name="pic" id="pic"
						style="width: 300px;" value="<%=p.getPicture()%>">
				</div>
			</div>
			<div class="clearfix cl">
				<label class="form-label col-2">广告语：</label>
				<div class="formControls col-10" style="width: 800px;">
					<textarea id="ad" name="ad" cols="5" rows="5" class="textarea"
						datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！"
						onKeyUp="textarealength(this,200)"><%=p.getAd()%></textarea>
					<p class="textarea-numberbar">
						<em class="textarea-length">0</em>/200
					</p>
				</div>
			</div>
			<div class="clearfix cl">
				<label class="form-label col-2">详细内容：</label>
				<div class="formControls col-10">
					<script id="editor" type="text/plain"
						style="width: 100%; height: 400px;"><%=p.getInformation()%></script>
				</div>
			</div>
			<div class="clearfix cl">
				<div class="Button_operation">
					<button onClick="article_save_submit();"
						class="btn btn-primary radius" type="submit">
						<i class="icon-save "></i>保存
					</button>
					<button onclick="cancel()" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
	</div>
	<script src="js/jquery-1.9.1.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>
	<script src="assets/layer/layer.js" type="text/javascript"></script>
	<script src="assets/laydate/laydate.js" type="text/javascript"></script>
	<script type="text/javascript"
		src="Widget/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="Widget/icheck/jquery.icheck.min.js"></script>
	<script type="text/javascript"
		src="Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
	<script type="text/javascript"
		src="Widget/Validform/5.3.2/Validform.min.js"></script>
	<script type="text/javascript"
		src="Widget/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript"
		src="Widget/ueditor/1.4.3/ueditor.config.js"></script>
	<script type="text/javascript"
		src="Widget/ueditor/1.4.3/ueditor.all.min.js">
		
	</script>
	<script type="text/javascript"
		src="Widget/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
	<script src="js/lrtk.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script>
		$(document).ready(function() {
			//初始化宽度、高度

			$(".widget-box").height($(window).height());
			$(".page_right_style").height($(window).height());
			$(".page_right_style").width($(window).width() - 220);
			//当文档窗口发生改变时 触发  
			$(window).resize(function() {

				$(".widget-box").height($(window).height());
				$(".page_right_style").height($(window).height());
				$(".page_right_style").width($(window).width() - 220);
			});
		});
		$(function() {
			var ue = UE.getEditor('editor');
		});
		function cancel(){
			window.location.href="product-list.jsp";
		}
	</script>
</body>
</html>