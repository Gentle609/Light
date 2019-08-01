<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们</title>
<style type="text/css">
#about {
	text-align: center;
	font-size: 18px;
	margin: 0px auto;
	overflow: hidden;
}

#about .title {
	width: 800px;
	height: 30px;
	margin-top: 10px;
}

#about .tu {
	width: 4px;
	height: 28px;
	background: #9932CC;
	vertical-align: middle;
	display: inline-block;
}

#about .i {
	color: #9932CC;
	height: 28px;
	display: inline-block;
	margin-left: 5px;
	font-size: 22px;
	font-weight: bold;
	vertical-align: middle;
}

#about table tr td {
	text-align: center;
}

#about table {
	width: 884px;
	height: auto;
	margin-top: 10px;
	margin-left: 25%;
	font-size: 13px;
}

#about .td1 {
	width: 180px;
	height: 129px;
}

#about .td2 {
	width: 695px;
	height: 129px;
	text-align: left;
	padding: 20px;
}

#about .details {
	margin-top: 10px;
	text-align: center;
	position: relative;
	font-size: 15px;
}
</style>
</head>
<body>
	<div id="header"><%@ include file="header.jsp"%></div>
	<div id="content">
		<div id="about">
			<div class="title">
				<div class="tu"></div>
				<div class="i">商城介绍</div>
			</div>
			<div
				style="border-bottom: 1px dashed black; margin: 0px auto; width: 49%; margin-top: 5px"></div>
			<div class="details">
				<h4>灯具在线销售系统</h4>
				<p>
					地址：河南省郑州市巩义市紫荆路136号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：0317-6528452
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;灯具在线销售系统，是一个全网营销的网上商城，这里有欧式、中式、现代简约、 艺术个性<br>等不同的风格，种类繁多，深受广大群众的喜欢。商城的来源是线下体验
					店的种类稀少，耗时耗<br>力，为了解决传统的现状，因此开发了灯具的网上商城系统。通过该平台，给用户最好的体验。
				</p>
			</div>
			<div class="title">
				<div class="tu"></div>
				<div class="i">服务保障</div>
			</div>
			<div
				style="border-bottom: 1px dashed black; margin: 0px auto; width: 49%; margin-top: 5px"></div>
			<table>
				<tr>
					<td class="td1"><img src="images/ab/1.png"></td>
					<td class="td2">
						退货条件：在商品签收15天内，商品外包装完好，外观完好，说明书等齐全，可提出退货申请。<br>
						非全额退款：本平台会根据商品外包装，外观及配件完整度适当收取少量费用。<br>
						邮费说明：发货运费由本平台承担，退货运费由买家承担。
					</td>
				</tr>
				<tr>
					<td class="td1"><img src="images/ab/2.png"></td>
					<td class="td2">补寄条件：商品签收之日起3天内，如发现商品在运输途中破损，可向卖家申请1次补寄。<br>
						邮费说明：卖家承担
					</td>
				</tr>
				<tr>
					<td class="td1"><img src="images/ab/3.png"></td>
					<td class="td2">72小时内二次检查完灯具后立即发货。<br>
						同城地区1-2天到货，省外地区3-5天到货。
					</td>
				</tr>
				<tr>
					<td class="td1"><img src="images/ab/4.png"></td>
					<td class="td2">如实描述产品，百分百的正品保障。</td>
				</tr>
				<tr>
					<td class="td1"><img src="images/ab/5.png"></td>
					<td class="td2">满188元，全国地区包邮。<br>
						未满188元，同城地区邮费10元，省外地区邮费20元，偏远地区邮费30元。
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="footer"><%@ include file="footer.jsp"%></div>
</body>
</html>