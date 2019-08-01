package entity;

public class Cart {
	private int pId;
	private String pName;
	private String picture;
	private double price;
	//库存数量
	private int pnum;
	//购买数量
	private int num;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Cart [pId=" + pId + ", pName=" + pName + ", picture=" + picture + ", price=" + price + ", pnum=" + pnum
				+ ", num=" + num + "]";
	}
	
}
