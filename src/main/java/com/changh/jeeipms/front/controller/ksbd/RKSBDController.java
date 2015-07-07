package com.changh.jeeipms.front.controller.ksbd;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.changh.jeeipms.cms.service.SystemService;
import com.changh.jeeipms.common.entity.exam.ExamCategoryEntity;
import com.changh.jeeipms.common.entity.ksbd.KSBDEntity;
import com.changh.jeeipms.common.service.ksbd.KSBDServiceI;
import com.changh.jeeipms.common.util.FreeMarkerUtil;

/**   
 * @Title: Controller
 * @Description: 考试宝典
 * @author failymiss
 * @date 2013-12-30 16:25:41
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/kSBDController")
public class RKSBDController extends BaseController {
	
	@Autowired
	private KSBDServiceI kSBDService;
	@Autowired
	private SystemService systemService;
	
	
	/**
	 * 发布考试宝典首页
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "index")
	public void index(HttpServletRequest request, HttpServletResponse response) {
		List<ExamCategoryEntity> list =getExamCategoryList();
		Map<String, Object> root = new HashMap<String, Object>();
		//导航栏菜单 
		root.put("list", list);
		FreeMarkerUtil.getInstance().genHtmlFile(request,getPhysicalPath(),
				"/front/index_ksbd.ftl", root, "webpage/static/ksbd", "index.html");
		
		//发布
		for(ExamCategoryEntity exam:list){
			exam(exam.getId(), request);
		}
	}
	
	public void exam(String examId,HttpServletRequest request){
		Map<String, Object> root = new HashMap<String, Object>();
		Map<String, Object> ksroot = new HashMap<String, Object>();
		List<ExamCategoryEntity> list =getExamCategoryList();
		ExamCategoryEntity exam = kSBDService.getEntity(ExamCategoryEntity.class, examId);
		for(ExamCategoryEntity child:exam.getExamList()){
			if(child.getKsbd().size()!=1){
				root.put("exam", child);
				root.put("list", list);
				root.put("examList", exam.getExamList());
				root.put("ksbdlist", child.getKsbd());
				FreeMarkerUtil.getInstance().genHtmlFile(request,getPhysicalPath(),
						"/front/exam.ftl", root, "webpage/static/ksbd/"+child.getExamEname(), "index.html");
				for(KSBDEntity ksbd:child.getKsbd()){
					ksroot.put("list", list);
					ksroot.put("ksbd", ksbd);
					FreeMarkerUtil.getInstance().genHtmlFile(request,getPhysicalPath(),
							"/front/desc_ksbd.ftl", ksroot, "webpage/static"+ksbd.getSavepath(), "index.html");
				}
			}else if(child.getKsbd().size()==1){
				ksroot.put("list", list);
				ksroot.put("ksbd", child.getKsbd().get(0));
				FreeMarkerUtil.getInstance().genHtmlFile(request,getPhysicalPath(),
						"/front/desc_ksbd.ftl", ksroot, "webpage/static"+child.getKsbd().get(0).getSavepath(), "index.html");
			}
		}
	}
	
	/**
	 * 获取考试分类
	 * @return
	 */
	public List<ExamCategoryEntity> getExamCategoryList(){
		List<ExamCategoryEntity> list =systemService.getListByOrder(ExamCategoryEntity.class, "pexam.id", "0", "orderId", true, "EQ");
		return list;
	}
	/**
	 * 根据传入的虚拟路径获取物理路径
	 * 
	 * @param path
	 */
	private static String getPhysicalPath() {
		return  ContextHolderUtils.getSession().getServletContext().getRealPath("");
	}
	
	
}
