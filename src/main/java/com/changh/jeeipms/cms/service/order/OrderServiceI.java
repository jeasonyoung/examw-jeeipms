package com.changh.jeeipms.cms.service.order;

import java.util.List;

import org.jeecgframework.core.common.service.CommonService;

import com.changh.jeeipms.cms.entity.order.ItemEntity;
import com.changh.jeeipms.cms.entity.order.OrderEntity;

public interface OrderServiceI extends CommonService{

	/**
	 * 添加一对多
	 * 
	 */
	public void addMain(OrderEntity order,
	        List<ItemEntity> itemList) ;
	/**
	 * 修改一对多
	 * 
	 */
	public void updateMain(OrderEntity order,
	        List<ItemEntity> itemList);
	public void delMain (OrderEntity order);
}
