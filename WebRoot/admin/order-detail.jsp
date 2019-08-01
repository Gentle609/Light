<%@page import="entity.OrderDetail"%>
<%@page import="entity.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/style.css" />
<link href="assets/css/codemirror.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="font/css/font-awesome.min.css" />
<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
<script src="js/jquery-1.9.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<title>订单详细</title>
</head>
<body>
	<%
		Order order = (Order) session.getAttribute("order");
	%>
	<div class="margin clearfix">
		<div class="Order_Details_style">
			<div class="Numbering">
				订单编号:<b><%=order.getoID()%></b>
			</div>
		</div>
		<div class="detailed_style">
			<!--收件人信息-->
			<div class="Receiver_style">
				<div class="title_name">收件人信息</div>
				<div class="Info_style clearfix">
					<div class="col-xs-3">
						<label class="label_name" for="form-field-2"> 收件人姓名： </label>
						<div class="o_content"><%=order.getRealName()%></div>
					</div>
					<div class="col-xs-3">
						<label class="label_name" for="form-field-2"> 收件人电话： </label>
						<div class="o_content"><%=order.getTelephone()%></div>
					</div>
					<div class="col-xs-3">
						<label class="label_name" for="form-field-2"> 收件地址： </label>
						<div class="o_content"><%=order.getAddress()%></div>
					</div>
				</div>
			</div>
			<!--订单信息-->
			<div class="product_style">
				<div class="title_name">产品信息</div>
				<%
					for (OrderDetail od : order.getOrderDetail()) {
				%>
				<div class="Info_style clearfix" style="display: inline-block;">
					<div class="product_info clearfix">
						<a href="#" class="img_link"><img src="<%=od.getPic()%>" /></a>
						<span><%=od.getpName()%>
							<p>
								数量：<%=od.getNum()%></p>
							<p>
								价格：<b class="price"><i>￥</i><%=od.getPrice()%></b>
							</p>
						</span>
					</div>
				</div>
			<%
				}
			%>
			</div>

			<div class="Button_operation">
				<button onclick="cancel()"
					class="btn btn-primary radius" type="submit">
					<i class="icon-save "></i>返回上一步
				</button>
			</div>
		</div>
	</div>
	<script>

		function cancel(){
			window.location.href="order-list.jsp";
		}
	</script>
</body>
</html>
