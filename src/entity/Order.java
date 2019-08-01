package entity;

import java.util.ArrayList;


public class Order {
	private int oID;
	private int userID;
	private String orderStatus;
	private String registTime;
	private String realName;
	private String address;
	private String telephone;
	public java.util.Collection<OrderDetail> orderDetail;
	public int getoID() {
		return oID;
	}
	public void setoID(int oID) {
		this.oID = oID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getRegistTime() {
		return registTime;
	}
	public void setRegistTime(String registTime) {
		this.registTime = registTime;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public java.util.Collection<OrderDetail> getOrderDetail() {
		if(orderDetail==null) {
			orderDetail=new ArrayList<OrderDetail>();
		}
		return this.orderDetail;
	}

	public void setOrderDetail(java.util.Collection<OrderDetail> orderDetail) {
		if(orderDetail==null) {
			orderDetail=new ArrayList<OrderDetail>();
		}
		this.orderDetail = orderDetail;
	}

	
}
