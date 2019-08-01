package dao;

import java.util.List;

import entity.Product;

public interface ProductDao {
	//查询所有商品信息
	List<Product> list();
	//根据名称查找商品
	List<Product> find(String name);
	//根据id查询商品所有信息
	Product getProductByID(int pID);
	//根据id删除商品信息
	boolean delete(int pId);
	//添加商品信息
	boolean add(Product p);
	//修改商品信息
	boolean update(Product p);
}
