package entity;

public class Product {
	private int pId;
	private String pCode;
	private String pName;
	private String type;
	private String picture;
	private int number;
	private double price;
	private String information;
	private String ad;
	private int pFlag;
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getAd() {
		return ad;
	}
	public void setAd(String ad) {
		this.ad = ad;
	}
	public int getpFlag() {
		return pFlag;
	}
	public void setpFlag(int pFlag) {
		this.pFlag = pFlag;
	}
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pCode=" + pCode + ", type=" + type + ", picture=" + picture + ", number="
				+ number + ", price=" + price + ", information=" + information + ", ad=" + ad + ", pFlag=" + pFlag
				+ "]";
	}
	
}
