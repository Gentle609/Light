<%@page import="java.util.List"%>
<%@page import="factory.ProductDaoFactory"%>
<%@page import="dao.ProductDao"%>
<%@page import="entity.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ProductDao pdi = ProductDaoFactory.getInstance();
	List<Product> pList = pdi.list();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<link type="text/css" rel="stylesheet" href="style/main.css">
<script src="js/jquery-1.6.js" type="text/javascript"></script>
<script type="text/javascript" src="js/show.js"></script>
</head>
<body>
	<!-- 广告缩略图轮播 -->
	<div id="ifocus">
		<div id="ifocus_pic">
			<div id="ifocus_piclist" style="left: 0; top: 0;">
				<ul>
					<li><a href=""><img alt="流苏吊灯" src="images/ads/01.jpg"></a></li>
					<li><a href=""><img alt="爱心灯具" src="images/ads/02.jpg"></a></li>
					<li><a href=""><img alt="简约圆形" src="images/ads/03.jpg"></a></li>
					<li><a href=""><img alt="现代前卫" src="images/ads/04.jpg"></a></li>
				</ul>
			</div>
			<div id="ifocus_opdiv"></div>
			<div id="ifocus_tx">
				<ul>
					<li class="current">流苏吊灯-维系永久的美</li>
					<li class="normal">爱心灯具-绽放最真的爱</li>
					<li class="normal">简约圆形-释放如初的暖</li>
					<li class="normal">现代前卫-充满活力的家</li>
				</ul>
			</div>
		</div>
		<div id="ifocus_btn">
			<ul>
				<li class="current"><img src="images/ads/btn_01.jpg" alt="流苏吊灯" /></li>
				<li class="normal"><img src="images/ads/btn_02.jpg" alt="爱心灯具" /></li>
				<li class="normal"><img src="images/ads/btn_03.jpg" alt="简约圆形" /></li>
				<li class="normal"><img src="images/ads/btn_04.jpg" alt="现代前卫" /></li>
			</ul>
		</div>
	</div>
	<div class="title1">
		<div class="china">人气商品</div>
		<div class="english">POPULAR GOODS</div>
		<hr style="width: 100%; color: #eee; margin-top: 8px;">
		<%
			for (int i = 0; i < pList.size(); i++) {
				Product p = pList.get(i);
				if (p.getpFlag() == 1) {
		%>
		<ul class="lie">
			<li><a href="product_detail.jsp?id=<%=p.getpId()%>"><img
					src="<%=p.getPicture()%>" width=192px height=192px
					style="text-align: center" /></a></li>
			<li class="name"><a
				href="product_detail.jsp?id=<%=p.getpId()%>"><%=p.getpName()%></a></li>
			<li class="Ad"><%=p.getAd()%></li>
			<li class="price">￥<%=(int) p.getPrice()%></li>
		</ul>
		<%
			}
			}
		%>
		<div class="china">新品首发</div>
		<div class="english">NEW PRODUCT LAUNCH</div>
		<hr style="width: 100%; color: #eee; margin-top: 8px;">
		<%
			for (int i = 0; i < pList.size(); i++) {
				Product p = pList.get(i);
				if (p.getpFlag() == 2) {
		%>
		<ul class="lie">
			<li><a href="product_detail.jsp?id=<%=p.getpId()%>"><img
					src="<%=p.getPicture()%>" width=192px height=192px
					style="text-align: center" /></a></li>
			<li class="name"><a
				href="product_detail.jsp?id=<%=p.getpId()%>"><%=p.getpName()%></a></li>
			<li class="Ad"><%=p.getAd()%></li>
			<li class="price">￥<%=(int) p.getPrice()%></li>
		</ul>
		<%
			}
			}
		%>
		<div class="china">现代简约</div>
		<div class="english">MODERN CONCISE</div>
		<hr style="width: 100%; color: #eee; margin-top: 8px;">
		<%
			for (int i = 0; i < pList.size(); i++) {
				Product p = pList.get(i);
				if (p.getpFlag() == 3) {
		%>
		<ul class="lie">
			<li><a href="product_detail.jsp?id=<%=p.getpId()%>"><img
					src="<%=p.getPicture()%>" width=192px height=192px
					style="text-align: center" /></a></li>
			<li class="name"><a
				href="product_detail.jsp?id=<%=p.getpId()%>"><%=p.getpName()%></a></li>
			<li class="Ad"><%=p.getAd()%></li>
			<li class="price">￥<%=(int) p.getPrice()%></li>
		</ul>
		<%
			}
			}
		%>
		<div class="china">欧式水晶</div>
		<div class="english">EUROPEAN CRYSTAL</div>
		<hr style="width: 100%; color: #eee; margin-top: 8px;">
		<%
			for (int i = 0; i < pList.size(); i++) {
				Product p = pList.get(i);
				if (p.getpFlag() == 4) {
		%>
		<ul class="lie">
			<li><a href="product_detail.jsp?id=<%=p.getpId()%>"><img
					src="<%=p.getPicture()%>" width=192px height=192px
					style="text-align: center" /></a></li>
			<li class="name"><a
				href="product_detail.jsp?id=<%=p.getpId()%>"><%=p.getpName()%></a></li>
			<li class="Ad"><%=p.getAd()%></li>
			<li class="price">￥<%=(int) p.getPrice()%></li>
		</ul>
		<%
			}
			}
		%>
		<div class="china">传统中式</div>
		<div class="english">TRADITIONAL CHINESE STYLE</div>
		<hr style="width: 100%; color: #eee; margin-top: 8px;">
		<%
			for (int i = 0; i < pList.size(); i++) {
				Product p = pList.get(i);
				if (p.getpFlag() == 5) {
		%>
		<ul class="lie">
			<li><a href="product_detail.jsp?id=<%=p.getpId()%>"><img
					src="<%=p.getPicture()%>" width=192px height=192px
					style="text-align: center" /></a></li>
			<li class="name"><a
				href="product_detail.jsp?id=<%=p.getpId()%>"><%=p.getpName()%></a></li>
			<li class="Ad"><%=p.getAd()%></li>
			<li class="price">￥<%=(int) p.getPrice()%></li>
		</ul>
		<%
				}
				}
			%>
	</div>
</body>
</html>