package com.changh.jeeipms.cms.service.impl.order;

import java.util.List;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.cms.entity.order.ItemEntity;
import com.changh.jeeipms.cms.entity.order.OrderEntity;
import com.changh.jeeipms.cms.service.order.OrderServiceI;
@Service("orderService")
@Transactional
public class OrderServiceImpl extends CommonServiceImpl implements OrderServiceI {

	//@Override
	public void addMain(OrderEntity order, List<ItemEntity> itemList){
			//保存主信息
			this.save(order);
		
			/**保存-订单明细*/
			for(ItemEntity item:itemList){
				//外键设置
				item.setOrderId(order.getId());
				this.save(item);
			}
	}

	//@Override
	public void updateMain(OrderEntity order,  List<ItemEntity> itemList) {
		//保存订单主信息
		this.saveOrUpdate(order);	
		//===================================================================================
		//获取参数
		Object id0 = order.getId();
		//===================================================================================
		//删除-订单明细
	    String hql0 = "from ItemEntity where 1 = 1 AND orderId = ? ";
	    List<ItemEntity> itemOldList = this.findHql(hql0,id0);
		this.deleteAllEntitie(itemOldList);
		//保存-订单明细
		for(ItemEntity item:itemList){
			//外键设置
			item.setOrderId(order.getId());
			this.save(item);
		}
	}

	//@Override
	public void delMain(OrderEntity order) {
		//删除主表信息
		this.delete(order);	
		//===================================================================================
		//获取参数
		Object id0 = order.getId();
		//===================================================================================
		//删除-订单明细
	    String hql0 = "from ItemEntity where 1 = 1 AND orderId = ? ";
	    List<ItemEntity> itemOldList = this.findHql(hql0,id0);
		this.deleteAllEntitie(itemOldList);
	}
	
}