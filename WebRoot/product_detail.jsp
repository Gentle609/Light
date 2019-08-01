<%@page import="entity.Product"%>
<%@page import="impl.ProductDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String strId = request.getParameter("id");
	if (strId == null)
		response.sendRedirect("search.jsp");
	int id = Integer.parseInt(strId);
	ProductDaoImpl pdi = new ProductDaoImpl();
	Product p = pdi.getProductByID(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<link href="../style/main.css" rel="stylesheet" type="text/css">
<style type="text/css">
#detail table {
	font-size: 16px;
	width: 80%;
	margin: 0px auto;
	padding: 0;
}

#detail .pname {
	font-size: 18px;
	font-weight: bolder;
}

#detail #count {
	height: 25px;
	vertical-align: middle;
	text-align: center;
	font-size: 18px;
}
/* 加入购物车样式 */
#detail .add {
	height: 34px;
	width: 134px;
	border-radius: 15px;
}

#detail .add:HOVER {
	cursor: pointer;
}
</style>
</head>
<body>
	<!-- 引入头部样式 -->
	<div id="header"><%@ include file="header.jsp"%></div>
	<!-- 引入中间样式 -->
	<div id="content">
		<div id="detail">
			<form action="AddCartServlet" method="post" name="addCartForm">
				<table cellspacing="0">
					<tr>
						<td rowspan="6" align="right"><img src="<%=p.getPicture()%>"
							width="400px" height="400px" style="margin-right: 20px;"></td>
					</tr>
					<tr>
						<td colspan="2" class="pname"><%=p.getpName()%></td>
					</tr>
					<tr>
						<td class="pcode">型号：<%=p.getpCode()%></td>
						<td>库存：<%=p.getNumber()%></td>
					</tr>
					<tr>
						<td colspan="2">全国统一价：￥<font
							style="color: red; font-size: 28px;"><%=(int) p.getPrice()%></font></td>
					</tr>
					<tr>
						<td class="pcount" width="20%">数量：
							<div style="display: inline-block; width: 220px; height: 20px;">
								<div style="display: inline-block;" onclick="sub()">
									<img src="images/substract.png" width="25px" height="25px"
										style="border-radius: 50%; vertical-align: middle; cursor: pointer;">
								</div>
								<input type="text" size="4" name="count" id="count" value="1">
								<input type="hidden" name="pid" value="<%=p.getpId() %>"/>
								<input type="hidden" name="picture" value="<%=p.getPicture() %>"/>
								<input type="hidden" name="pname" value="<%=p.getpName() %>"/>
								<input type="hidden" name="price" value="<%=p.getPrice() %>"/>
								<input id="max" name="max" value="<%=p.getNumber()%>" type="hidden"/>
								<div style="display: inline-block;" onclick="sum()">
									<img src="images/sum.png" width="25px" height="25px"
										style="border-radius: 50%; vertical-align: middle; cursor: pointer;">
								</div>
							</div>
						</td>
						<td><img src="images/shopping.jpg"
							onclick=" return checkAddCartForm();" class="add"></td>
					</tr>
					<tr>
						<td colspan="2" style="vertical-align: top;"><img
							src="images/xq.jpg" style="border: 1px solid red;"></td>
					</tr>
					<tr>
						<td colspan="3" align="center" height="90px"><h2
								style="font-size: 40px; color: #66CDAA;">商品详情信息</h2></td>
					</tr>
					<%-- <%
						String[] a = p.getInformation().split(";");
						for (int j = 0; j < a.length; j++) {
					%>
					<tr>
						<td colspan="3" align="center"><img src="<%=a[j]%>"
							width=790px /></td>
					</tr>
					<%
						}
					%> --%>
					<tr>
						<td colspan="3" align="center"><%=p.getInformation() %></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<!-- 引入底部样式 -->
	<div id="footer"><%@include file="footer.jsp"%></div>
	<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript">
		function sum() {
			var demoDiv = parseInt(document.getElementById("max").value);
			//获取自定义属性值
			//var textshow = demoDiv.getAttribute("data-max");
			var input = parseInt(document.getElementById("count").value);
			if (input >= demoDiv) {
				document.getElementById("count").value = parseInt(demoDiv);
				alert("选择的数量超出库存，请重新选择");
			}else{
				document.getElementById("count").value =  parseInt(input)+ 1;
			}
		}
		function sub() {
			document.getElementById("count").value = parseInt(document
					.getElementById("count").value) - 1;
			var input = document.getElementById("count").value;
			if (input == 0) {
				alert("数量不能少于一个");
				document.getElementById("count").value = 1;
			}
		
		}
		function checkAddCartForm() {
			var pnum = document.getElementById("max");//商品的总量
			var num = document.getElementById("count");//用户购买量
			if (parseInt(num.value) > parseInt(pnum.value)) {
				alert("购买数量超过了库存量！");
				return false;
			}else if (isNaN(num.value) || num.value <= 0) {
				alert("请输入正确的购买数量！");
				return false;
			} else {
				document.addCartForm.submit();
				return true;
			}
		}
	</script>
</body>
</html>