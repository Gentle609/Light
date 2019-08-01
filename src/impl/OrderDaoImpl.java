package impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import connection.ConnectLight;
import dao.OrderDao;
import entity.Order;
import entity.OrderDetail;

public class OrderDaoImpl implements OrderDao{
	private Connection con = null;
	private PreparedStatement ps = null;
	private String sql = "";
	private ResultSet rs = null;
	private int row = 0;
	//提交订单
	public boolean add(Order order) {
		//con对应多个预编译对象psmt,psmt对象对应多个结果集
		int od_row=0;
		con=ConnectLight.getConnection();
		sql="insert into order_info(id,status,ordertime) values(?,?,?)";	 
		try {
			con.setAutoCommit(false);
			PreparedStatement psmt1=con.prepareStatement(sql);
			psmt1.setInt(1, order.getUserID());
			psmt1.setString(2, order.getOrderStatus());
			psmt1.setString(3, order.getRegistTime());
			row=psmt1.executeUpdate();
			if(row>0) {
				String sql1="select oId from order_info order by oId desc limit 1";
				PreparedStatement psmt2=con.prepareStatement(sql1);
				ResultSet rs1=psmt2.executeQuery();
				if(rs1.next()) {
					order.setoID(rs1.getInt("oId"));
					List<OrderDetail> list=(List<OrderDetail>)order.getOrderDetail();
					String sql2="insert into order_detail(oId,pId,num) values(?,?,?)";
					PreparedStatement psmt3=con.prepareStatement(sql2);
					psmt3.setInt(1, order.getoID());
					for(OrderDetail od:list) {					
						psmt3.setInt(2, od.getProductID());
						psmt3.setInt(3, od.getNum());
						od_row=psmt3.executeUpdate();
					}
					psmt3.close();
				}
				rs1.close();
				psmt2.close();
			}
			psmt1.close();

			if(od_row>0) {
				con.commit();
			}
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try {
				con.setAutoCommit(true);
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return od_row>0?true:false;
	}
	//根据用户id查找订单
	public List<Order> getOrderByUserID(int userID) {
		List<Order> list=new ArrayList<Order>();
		con=ConnectLight.getConnection();
		sql="select order_info.oId,order_info.id,order_info.status,order_info.ordertime,user.realName,user.telephone,user.address from order_info ,user where order_info.id =  user.id and order_info.id =? order by ordertime desc";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, userID);
			rs=ps.executeQuery();
			while(rs.next()) {
				Order o=new Order();
				o.setoID(rs.getInt("oId"));
				o.setUserID(userID);
				o.setOrderStatus(rs.getString("status"));
				o.setRegistTime(rs.getString("ordertime"));
				o.setRealName(rs.getString("realName"));
				o.setTelephone(rs.getString("telephone"));
				o.setAddress(rs.getString("address"));
				String sql1="select order_detail.dId,order_detail.oId,order_detail.pId,order_detail.num,product.pName,product.picture,product.price from order_detail,product where order_detail.pId =  product.pId and order_detail.oId = ?";
				PreparedStatement psmt1=con.prepareStatement(sql1);
				psmt1.setInt(1, o.getoID());
				ResultSet rs1=psmt1.executeQuery();
				List<OrderDetail> odList=(List<OrderDetail>)o.getOrderDetail();
				while(rs1.next()) {
					OrderDetail od=new OrderDetail();
					od.setOdID(rs1.getInt("dId"));
					od.setOid(rs1.getInt("oId"));
					od.setProductID(rs1.getInt("pId"));
					od.setNum(rs1.getInt("num"));
					od.setpName(rs1.getString("pName"));
					od.setPic(rs1.getString("picture"));
					od.setPrice(rs1.getDouble("price"));
					odList.add(od);
				}
				rs1.close();
				psmt1.close();
				list.add(o);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//查询所有订单信息
	public List<Order> findAll() {
		List<Order> list=new ArrayList<Order>();
		con=ConnectLight.getConnection();
		sql="select order_info.oId,order_info.id,order_info.status,order_info.ordertime,user.realName,user.telephone,user.address from order_info ,user where order_info.id =  user.id order by ordertime desc";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Order o=new Order();
				o.setoID(rs.getInt("oId"));
				o.setUserID(rs.getInt("id"));
				o.setOrderStatus(rs.getString("status"));
				o.setRegistTime(rs.getString("ordertime"));
				o.setRealName(rs.getString("realName"));
				o.setTelephone(rs.getString("telephone"));
				o.setAddress(rs.getString("address"));
				String sql1="select order_detail.did,order_detail.oId,order_detail.pId,order_detail.num,product.pName,product.picture,product.price from order_detail ,product where order_detail.pId =  product.pId";
				PreparedStatement psmt1=con.prepareStatement(sql1);
				ResultSet rs1=psmt1.executeQuery();
				List<OrderDetail> odList=(List<OrderDetail>)o.getOrderDetail();
				while(rs1.next()) {
					OrderDetail od=new OrderDetail();
					od.setOdID(rs1.getInt("did"));
					od.setOid(rs1.getInt("oId"));
					od.setProductID(rs1.getInt("pId"));
					od.setNum(rs1.getInt("num"));
					od.setpName(rs1.getString("pName"));
					od.setPic(rs1.getString("picture"));
					od.setPrice(rs1.getDouble("price"));
					odList.add(od);
				}
				rs1.close();
				psmt1.close();
				list.add(o);
			}
			ConnectLight.close(con, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Order> find(String number) {
		List<Order> list = new ArrayList<Order>();
		con= ConnectLight.getConnection();
		if(number!=""){
			sql = "select order_info.oId,user.realName,user.address,user.telephone,order_info.orderTime from user,order_info where user.id=order_info.id and oId="+number;
		}else{
			sql = "select order_info.oId,user.realName,user.address,user.telephone,order_info.orderTime from user,order_info where user.id=order_info.id";
		}
		try {
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setoID(rs.getInt("oId"));
				o.setRealName(rs.getString("realName"));
				o.setAddress(rs.getString("address"));
				o.setTelephone(rs.getString("telephone"));
				o.setRegistTime(rs.getString("orderTime"));
				list.add(o);
			}
			ConnectLight.close(con, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public Order getOrderByOrderID(int orderID) {
		Order o=new Order();
		con=ConnectLight.getConnection();
		sql="select order_info.oId,order_info.id,order_info.status,order_info.ordertime,user.realName,user.telephone,user.address from order_info ,user where order_info.id =  user.id and order_info.oId=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, orderID);
			rs=ps.executeQuery();
			if(rs.next()) {			
				o.setoID(rs.getInt("oId"));
				o.setUserID(rs.getInt("id"));
				o.setOrderStatus(rs.getString("status"));
				o.setRegistTime(rs.getString("ordertime"));
				o.setRealName(rs.getString("realName"));
				o.setTelephone(rs.getString("telephone"));
				o.setAddress(rs.getString("address"));
				String sql1="select order_detail.did,order_detail.oId,order_detail.pId,order_detail.num,product.pName,product.picture,product.price from order_detail ,product where order_detail.pId =  product.pId and order_detail.oId = ?";
				PreparedStatement psmt1=con.prepareStatement(sql1);
				psmt1.setInt(1, o.getoID());
				ResultSet rs1=psmt1.executeQuery();
				List<OrderDetail> odList=(List<OrderDetail>)o.getOrderDetail();
				while(rs1.next()) {
					OrderDetail od=new OrderDetail();
					od.setOdID(rs1.getInt("did"));
					od.setOid(rs1.getInt("oId"));
					od.setProductID(rs1.getInt("pId"));
					od.setNum(rs1.getInt("num"));
					od.setpName(rs1.getString("pName"));
					od.setPic(rs1.getString("picture"));
					od.setPrice(rs1.getDouble("price"));
					odList.add(od);
				}
			}
			ConnectLight.close(con, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return o;
	}
	//发货
	public boolean send(int orderID) {
		con= ConnectLight.getConnection();
		sql="update order_info set status='已发货' where oId=?";
		 try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, orderID);
			row=ps.executeUpdate();
			ConnectLight.close(con, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	      return row>0?true:false;
	}
	//收货
	public boolean receive(int orderID) {
	      // TODO: implement
		   con= ConnectLight.getConnection();
			  sql="update order_info set status='交易完成' where oId=?";
			  try {
				ps=con.prepareStatement(sql);
				ps.setInt(1, orderID);
				row=ps.executeUpdate();
				ConnectLight.close(con, ps, rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      return row>0?true:false;
	   }
}
