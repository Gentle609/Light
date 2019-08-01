package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectLight;
import dao.ProductDao;
import entity.Product;

public class ProductDaoImpl implements ProductDao {
	private Connection conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	private String sql="";
	private int row=0;
	//查询所有商品信息
	public List<Product> list() {
		List<Product> list=new ArrayList<Product>();
		conn=ConnectLight.getConnection();
		sql="select * from product";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Product p=new Product();
				p.setpId(rs.getInt("pId"));
				p.setpCode(rs.getString("pCode"));
				p.setpName(rs.getString("pName"));
				p.setType(rs.getString("type"));
				p.setPicture(rs.getString("picture"));
				p.setNumber(rs.getInt("number"));
				p.setPrice(rs.getDouble("price"));
				p.setInformation(rs.getString("information"));
				p.setAd(rs.getString("ad"));
				p.setpFlag(rs.getInt("pFlag"));
				list.add(p);
			}
			ConnectLight.close(conn, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	//根据name查找商品
	public List<Product> find(String name) {
		List<Product> list = new ArrayList<Product>();
		conn = ConnectLight.getConnection();
		sql = "select * from product where pName like '%" + name + "%'";
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				Product p = new Product();
				p.setpId(rs.getInt("pId"));
				p.setpCode(rs.getString("pCode"));
				p.setpName(rs.getString("pName"));
				p.setType(rs.getString("type"));
				p.setPicture(rs.getString("picture"));
				p.setNumber(rs.getInt("number"));
				p.setPrice(rs.getDouble("price"));
				p.setInformation(rs.getString("information"));
				p.setAd(rs.getString("ad"));
				p.setpFlag(rs.getInt("pFlag"));
				list.add(p);
			}
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	//根据id查询商品所有信息
	public Product getProductByID(int pID) {
		Product p = new Product();
		conn = ConnectLight.getConnection();
		sql = "select * from product where pId=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pID);
			rs=ps.executeQuery();
			while (rs.next()) {
				p.setpId(rs.getInt("pId"));
				p.setpCode(rs.getString("pCode"));
				p.setpName(rs.getString("pName"));
				p.setType(rs.getString("type"));
				p.setPicture(rs.getString("picture"));
				p.setNumber(rs.getInt("number"));
				p.setPrice(rs.getDouble("price"));
				p.setInformation(rs.getString("information"));
				p.setAd(rs.getString("ad"));
				p.setpFlag(rs.getInt("pFlag"));
			}
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}
	//根据id删除商品信息
	public boolean delete(int pId) {
		conn = ConnectLight.getConnection();
		sql = "delete from product where pId=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pId);
			row = ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row > 0 ? true : false;
	}
	//添加商品信息
	public boolean add(Product p) {
		conn = ConnectLight.getConnection();
		sql = "insert into product(pCode,pName,type,picture,number,price,information,ad,pFlag)values(?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, p.getpCode());
			ps.setString(2, p.getpName());
			ps.setString(3, p.getType());
			ps.setString(4, p.getPicture());
			ps.setInt(5, p.getNumber());
			ps.setDouble(6, p.getPrice());
			ps.setString(7, p.getInformation());
			ps.setString(8, p.getAd());
			ps.setInt(9, p.getpFlag());
			row = ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row > 0 ? true : false;
	}
	//修改商品信息
	public boolean update(Product p) {
		conn = ConnectLight.getConnection();
		sql = "update product set pCode=?,pName=?,type=?,picture=?,number=?,price=?,information=?,ad=? where pId=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, p.getpCode());
			ps.setString(2, p.getpName());
			ps.setString(3, p.getType());
			ps.setString(4, p.getPicture());
			ps.setInt(5, p.getNumber());
			ps.setDouble(6, p.getPrice());
			ps.setString(7, p.getInformation());
			ps.setString(8, p.getAd());
			ps.setInt(9, p.getpId());
			System.out.println(ps);
			row = ps.executeUpdate();
			ConnectLight.close(conn, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return row > 0 ? true : false;
	}
	
}
