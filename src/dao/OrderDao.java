package dao;

import java.util.List;

import entity.Order;

public interface OrderDao {
	   boolean add(Order order);

	List<Order> find(String number);

}
