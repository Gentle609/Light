<%@page import="entity.OrderDetail"%>
<%@page import="entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="impl.OrderDaoImpl"%>
<%@page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
<link rel="stylesheet" type="text/css" href="style/main.css">
<style type="text/css">
#buycar {
	width: 80%;
	margin: 20px 0px 0px 300px;
	text-align: center;
	margin-bottom: 200px;
}
</style>
<script language="JavaScript">
	var isShow = false;
	function getDetailList(tarId){
		var detaillist=document.getElementsByName("detaillist"+tarId);
		if(isShow){
			for (var i=0; i<detaillist.length; i++){
				 detaillist[i].style.display="none" ;
			}
			isShow = false;
		}else{
			for (i=0; i<detaillist.length; i++){
				 detaillist[i].style.display='';
			}
			isShow = true;
		}		
	}
	</script>
</head>
<body>

	<div id="header"><%@ include file="header.jsp"%></div>
	<div id="content">
		<div id="buycar">
			<%
				User user1 = (User) session.getAttribute("user");
				OrderDaoImpl odi = new OrderDaoImpl();
				if (user1 == null) {
					out.print("<h1>请重新登陆！</h1>");
				} else {
					List<Order> orderList = odi.getOrderByUserID(user1.getId());
					if(orderList.size()==0){
						out.print("<h1>您还没有订单！ </h1>");
					}else{
			%>
			<div align="center" style="width: 535px">
				<div align="center" style="width: 535px;margin-bottom: 10px">
					<font size="6" style="margin-left: 40px">我的订单</font>
				</div>
				<div style="width: 530px">
					<%
						int j = 0;
							for (Order order : orderList) {
								j++;
					%>
					<table width="600px">
						<tr id="order<%=j%>" style="background: #eec900;">
							<th scope="col" colspan="4"><a
								onclick="getDetailList(<%=j%>)"> 订单编号：<span
									style="font-size: 12px;color: blue;"><%=order.getoID()%></span>&nbsp;
									状态：<span style="font-size: 12px;color: blue;"><%=order.getOrderStatus()%></span>&nbsp;
									订单时间：<span style="font-size: 12px;color: blue;"><%=order.getRegistTime()%></span>&nbsp;
									收货人：<span style="font-size: 12px;color: blue;"><%=order.getRealName()%></span>&nbsp;

									<%
										if (order.getOrderStatus().equals("已发货")) {
									%> <span style="font-size: 12px;color: red;"> <a
										href="OrderReceiveServlet?id=<%=order.getoID()%>"
										onclick="if(confirm('确定要收货吗？')) return true;else return false;">确认收货</a>
								</span> <%
 	}
 %>
							</a></th>
						</tr>
						<%
							for (OrderDetail od : order.getOrderDetail()) {
						%>
						<tr name="detaillist<%=j%>" style="display: none">
							<td class="row" width="50%" align="center"><%=od.getpName()%></td>
							<td class="row" width="30%"><img src="<%=od.getPic()%>"
								width="75" height="50" /></td>
							<td class="row" width="10%"><%=od.getPrice()%></td>
							<td class="row" width="10%"><%=od.getNum()%></td>
						</tr>
						<%
							}}
						%>
					</table>
					<%
						}
					%>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<div id="footer"><%@ include file="footer.jsp"%></div>
</body>
</html>