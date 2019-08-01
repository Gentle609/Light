<%@page import="impl.OrderDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<script type="text/javascript" src="js/H-ui.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>
<script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/jquery.dataTables.bootstrap.js"></script>
<script src="assets/layer/layer.js" type="text/javascript"></script>
<script src="assets/laydate/laydate.js" type="text/javascript"></script>
<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
<script src="js/lrtk.js" type="text/javascript"></script>
<title>查询订单</title>
<script type="text/javascript">
	function tiao(){
		window.location.href="../FindOrderServlet";
	}
</script>
<style type="text/css">
.page {
	float: right;
}

.page a {
	color: blue;
	background: pink;
	border: 1px solid pink;
	padding: 5px;
}

.page a:hover {
	text-decoration: none;
	background: blue;
}
</style>
</head>
<body>
	<div class="margin clearfix">
		<!--内容-->
		<div class="centent_style" id="centent_style">
			<form action="../FindOrderServlet" method="post">
				<div class="search_style">
					<ul class="search_content clearfix">
						<li><label class="l_f">订单编号</label><input name="code"
							type="text" class="text_add" placeholder="输入订单编号"
							style="width: 250px" /></li>
						<li style="width: 90px;"><button type="submit"
								class="btn_search">
								<i class="fa fa-search"></i>查询
							</button></li>
					</ul>
				</div>
			</form>
			<!--订单列表展示-->
			<table class="table table-striped table-bordered table-hover"
				id="sample-table">
				<thead>
					<tr>
						<th width="100px">订单编号</th>
						<th width="100px">用户</th>
						<th width="220px">收货地址</th>
						<th width="100px">联系电话</th>
						<th width="100px">订单时间</th>
						<th width="100px">操作</th>
					</tr>
				</thead>
				<tbody>
					<%
   		List<Order> list = (List<Order>)session.getAttribute("orderList");
 		if(list==null) {
 			OrderDaoImpl odi=new OrderDaoImpl();
 	   		list = odi.findAll();
		}
 		int all = 0;//总记录数
		int pageCount = 3;//没有显示的记录数
		int pageTotal = 0;//总页数
		int curPage = 1;//当前页
		if (list != null) {
			all = list.size();
			pageTotal = (all % pageCount) == 0 ? all / pageCount : (all
					/ pageCount + 1);
			String strCurPage = request.getParameter("page");
			if (strCurPage != null) {
				curPage = Integer.parseInt(strCurPage);
			}
			int start = (curPage - 1) * pageCount;
			int end = curPage * pageCount > all ? all : curPage * pageCount;
			for (int i = start; i < end; i++) {
   		 		 Order o=list.get(i);
    %>
					<tr>
						<td><%=o.getoID() %></td>
						<td><%=o.getRealName() %></td>
						<td><%=o.getAddress() %></td>
						<td><%=o.getTelephone() %></td>
						<td><%=o.getRegistTime() %></td>
						<td><a href="../OrderAdminDetailServlet?id=<%=o.getoID()%>">查看详细</a></td>
					</tr>
					<%} %>
					<tr>
						<td colspan="6">
							<div style="float: left;">
								第<%=curPage%>页，共<%=pageTotal%>页
							</div>
							<div class="page">
								<a href="order-list.jsp?page=1">首页</a> <a
									href="order-list.jsp?page=<%=curPage - 1 > 0 ? curPage - 1 : 1%>">上一页</a>
								<a
									href="order-list.jsp?page=<%=curPage + 1 < pageTotal ? curPage + 1 : pageTotal%>">下一页</a>
								<a href="order-list.jsp?page=<%=pageTotal%>">尾页</a>
							</div>
						</td>
					</tr>
					<%
							}
						%>
				</tbody>
			</table>
		</div>
	</div>
	<script>
 $(function() { 
	$("#cover_style").fix({
		float : 'top',
		minStatue : false,
		skin : 'green',	
		durationTime :false,
		window_height:30,//设置浏览器与div的高度值差
		spacingw:0,//
		spacingh:0,//
		close_btn:'.yingchan_btn',
		show_btn:'.xianshi_btn',
		side_list:'.hide_style',
		widgetbox:'.top_style',
		close_btn_width:60,	
		da_height:'#centent_style,.left_Treeview,.list_right_style',	
		side_title:'.b_n_btn',		
		content:null,
		left_css:'.left_Treeview,.list_right_style'
		
		
	});
});
//面包屑返回值
var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Order_form,.order_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});

//初始化宽度、高度  
  var heights=$(".top_style").outerHeight()+47; 
 $(".centent_style").height($(window).height()-heights); 
 $(".page_right_style").width($(window).width()-220);
 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2); 
 $(".list_right_style").width($(window).width()-250);
  //当文档窗口发生改变时 触发  
    $(window).resize(function(){
	$(".centent_style").height($(window).height()-heights); 
	 $(".page_right_style").width($(window).width()-220);
	 $(".left_Treeview,.list_right_style").height($(window).height()-heights-2);  
	 $(".list_right_style").width($(window).width()-250);
	}) 
//比例
var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
			$('.easy-pie-chart.percentage').each(function(){
				$(this).easyPieChart({
					barColor: $(this).data('color'),
					trackColor: '#EEEEEE',
					scaleColor: false,
					lineCap: 'butt',
					lineWidth: 10,
					animate: oldie ? false : 1000,
					size:103
				}).css('color', $(this).data('color'));
			});
		
			$('[data-rel=tooltip]').tooltip();
			$('[data-rel=popover]').popover({html:true});
</script>
	<script>
//订单列表
jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable( {
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,1,2,3,4,5,6,7,8,9]}// 制定列不参与排序
		] } );
				
				
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			
			
			
			});
</script>
</body>
</html>