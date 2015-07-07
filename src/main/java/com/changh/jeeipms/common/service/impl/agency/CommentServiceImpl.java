package com.changh.jeeipms.common.service.impl.agency;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.agency.CommentServiceI;

@Service("commentService")
@Transactional
public class CommentServiceImpl extends CommonServiceImpl implements CommentServiceI {
	
}