package com.changh.jeeipms.common.service.impl.student;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.changh.jeeipms.common.service.student.NoteServiceI;

@Service("noteService")
@Transactional
public class NoteServiceImpl extends CommonServiceImpl implements NoteServiceI {
	
}