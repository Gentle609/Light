package factory;

import dao.OrderDao;
import impl.OrderDaoImpl;

public class OrderDaoFactory {
	public static OrderDao getInstance() {
		return new OrderDaoImpl();
	}
}
