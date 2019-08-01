<%@page import="entity.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<style type="text/css">
#cart {
	text-align: center;
	width: 1150px;
	margin: 0px auto;
	font-size: 18px;
	margin-bottom: 120px;
}

#cart t1 {
	margin: 0px auto;
	width: 70%;
}

#cart .title {
	text-align: left;
	margin-left: 30px;
}

#cart .pcart {
	border-radius: 50%;
}

#cart .pname {
	font-size: 15px;
}
#cart .picbut{
	background: #FFFACD;
	width: 120px;
	font-size: 18px;
	border: 1.5px solid #CDC8B1;
	border-radius:10%;
	margin-right: 10px;
	margin-left: 10px;
}
</style>
</head>
<body>
	<div id="header"><%@ include file="header.jsp"%></div>
	<div id="content">
		<div id="cart">
		<%
			if(cartList!=null){
		%>
			<div class="title">
				<table>
					<tr>
						<td rowspan="2" align="right"><img src="images/cart.png"
							class="pcart"></td>
						<td style="vertical-align: bottom;"><font
							style="width: 150px; text-align: center; font-size: 20px; font-weight: 500;">我的购物车</font></td>
					</tr>
					<tr>
						<td style="vertical-align: top;"><font
							style="width: 150px; text-align: center; font-size: 15px; font-weight: 500; color: #00BFFF; vertical-align: top;">MY
								CART</font></td>
					</tr>
				</table>
				<table class="t1" border="1" bordercolor="#E0EEE0" cellspacing="0"
					width="75%" style="text-align: center;">
					<tr>
						<th width="10%"><input type="checkbox" id="check-box"
							onclick="checkAll()" />全选</th>
						<th width="15%">商品图片</th>
						<th width="25%">名称</th>
						<th width="15%">单价(元)</th>
						<th width="15%">数量(件)</th>
						<th width="15%">金额(元)</th>
						<th width="10%">操作</th>
					</tr>
					<%
						double sum = 0.0;
						if (cartList != null) {
							int i = 0;
							for (Cart c : cartList) {
					%>
					<form id="form<%=i%>" method="post" action="UpdateCartServlet">
						<input type="hidden" name="id" value="<%=c.getpId()%>" /> <input
							type="hidden" name="pnum" id="pnum" value="<%=c.getPnum()%>" />
						<tr>
							<td align="left"><input type="checkbox" id="check-all"
								style="margin-left: 16px" onchange="doChange()"/></td>
							<td><a href="product_detail.jsp?id=<%=c.getpId()%>"><img
									src="<%=c.getPicture()%>" width="64px" height="64px" /></a></td>
							<td><a href="product_detail.jsp?id=<%=c.getpId()%>"
								class="pname"><%=c.getpName()%></a></td>
							<td>￥<%=c.getPrice()%></td>
							<td><a onclick="updateCart(<%=i%>,-1)">-</a> <input
								type="text" size="2" onChange=" return changeNum(<%=i%>);"
								name="num" id="num" value="<%=c.getNum()%>" /> <a
								onclick="updateCart(<%=i%>,1)">+</a></td>
							<td><%=c.getPrice() * c.getNum()%></td>
							<td><a href="DeleteCartServlet?id=<%=c.getpId()%>"><img
									src="images/delete.png" width="32px" height="32px" /></a></td>
						</tr>
					</form>
					<%
						i++;
						sum += c.getPrice()*c.getNum();
							}
							}
						%>
						
						<tr>
							<td colspan="5" align="right"><input type="button"
								name="totalprice" value="返回" class="picbut"
								onclick="history.back(-1)" /></td>
							<td colspan="2" align="left"><input type="button"
								name="totalprice" value="结 算" class="picbut"
								onclick=" javascript:window.location.href='checkout.jsp'" /></td>
						</tr>
				</table>
			</div>
			<%
			}else{%>
				<h2 style="margin-top: 50px;color:#FF6347;">您的购物车还没有商品</h2>
			<% }
			%>
		</div>
	</div>
	<div id="footer"><%@ include file="footer.jsp"%></div>
	<script src="js/jquery-1.8.0.js"></script>
	<script type="text/javascript">
	function updateCart(index,num){
	       var curForm = document.getElementById("form"+index);
	       if(parseInt(curForm.num.value)>parseInt(curForm.pnum.value)){
	   		
	   		alert("购买数量超过了库存量！");
	   		return false;		
	   	
	   		
	   	}
	       if((curForm.num.value-(-num))<=0){
	       	  alert("请输入正确的数量！");
	       	  return false;
	       }else{
	      	 curForm.num.value = curForm.num.value -(-num);
	      	 curForm.submit();
	      	 return true;
	       }
		}
		function changeNum(index){
			 var curForm = document.getElementById("form"+index);
			 if(parseInt(curForm.num.value)>parseInt(curForm.pnum.value)){
			   		
			   		alert("购买数量超过了库存量！");
			   		return false;		
			   	
			   		
			   	}
			 if(curForm.num.value<=0){
			   alert("请输入正确的数量！");
			   curForm.num.value = 1;
			   return false;
			 }else{
			   curForm.submit();
			   return true;
			 }
		}
		function checkAll(){
				var state=$("input[id='check-box']").prop("checked");
				$(this).prop("checked",state);
			   $("input[type='checkbox']").prop("checked",state);
		}
		function doChange(){
			 var flag=true;
			 $("input[id='check-all']").each(function(){
					 flag=flag&&$(this).prop("checked");
			 })
			  $("input[id='check-box']").prop("checked",flag);
		}
	</script>
</body>
</html>