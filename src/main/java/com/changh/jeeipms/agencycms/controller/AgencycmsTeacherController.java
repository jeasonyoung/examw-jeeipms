package com.changh.jeeipms.agencycms.controller;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.excel.ExcelExportUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.changh.jeeipms.common.entity.agency.TeacherEntity;
import com.changh.jeeipms.common.service.agency.TeacherServiceI;
import com.changh.jeeipms.common.util.StringUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
/**   
 * @Title: Controller
 * @Description: 机构老师
 * @author failymiss
 * @date 2013-08-08 16:30:15
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/agencycmsteacher")
public class AgencycmsTeacherController extends BaseController {
	@Autowired
	private TeacherServiceI teacherService;
	
	@RequestMapping(params = "list")
	public String list(TeacherEntity teacher, HttpServletRequest request, HttpServletResponse response, Model model) {
		/*String[] realname={"张","李","王","柳","杨","赵","陈","周","钱","孙"};
		String[] name={"三","四","五","七","八","九","实","爽","卫东","卫国","豪"};
		Random r = new Random();
		for(int i=1;i<100;i++){
			TeacherEntity t = new TeacherEntity();
			t.setAddtime(new Date());
			t.setAgencyid(ResourceUtil.getAgencyId());
			t.setDescription("测试专用");
			t.setEmail("examw@163.com");
			t.setImageurl("http://www.examw.com");
			t.setLessons("综合型人才");
			t.setPhone("1890070"+(10000+r.nextInt(10000)));
			t.setRealname(realname[r.nextInt(10)]+name[r.nextInt(11)]);
			teacherService.save(t);
		}*/
        Page<TeacherEntity> page = teacherService.find(new Page<TeacherEntity>(request, response), teacher);
        model.addAttribute("teacher", teacher);
        model.addAttribute("page", page);
		return "agency/cms/teacherList";
	}
	
	/**
	 * 删除咨询学员
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	public String del( String teacherId,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		TeacherEntity Teacher = teacherService.getEntity(TeacherEntity.class, teacherId);
		teacherService.delete(Teacher);
		addMessage(redirectAttributes, "删除老师'" + StringUtils.abbr(Teacher.getRealname(),15) + "'成功");
		return "redirect:/agencycmsteacher.do?list&repage";
	}
	/**
	 * 修改咨询学员
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	public String  save(TeacherEntity teacher, HttpServletRequest request,RedirectAttributes redirectAttributes,String Id) {
		String message ="";
		if (StringUtil.isNotEmpty(teacher.getId())) {
			message = "更新成功";
			TeacherEntity t = teacherService.get(TeacherEntity.class, teacher.getId());
			try {
				teacher.setDescription(request.getParameter("myeditor"));
				MyBeanUtils.copyBeanNotNull2Bean(teacher, t);
				teacherService.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			teacher.setDescription(request.getParameter("myeditor"));
			teacher.setAgencyid(ResourceUtil.getAgencyId());
			teacher.setAddtime(new Date());
			message = "添加成功";
			teacherService.save(teacher);
		}
		addMessage(redirectAttributes, message );
		return "redirect:/agencycmsteacher.do?list&repage";
		
	}
	
	/**
	 * 机构老师表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(TeacherEntity teacher, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(teacher.getId())) {
			teacher =teacherService.getEntity(TeacherEntity.class, teacher.getId());
			req.setAttribute("teacher", teacher);
		}
		return new ModelAndView("agency/cms/teacher");
	}
	
	/**
	 * 导出咨询学员
	 * @param stu
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public void exportXls( TeacherEntity stu,HttpServletRequest request, HttpServletResponse response) {
	        // 生成提示信息，
	        response.setContentType("application/vnd.ms-excel");
	        String codedFileName = null;
	        OutputStream fOut = null;
	        try
	        {
	        	 // ---------begin --------Author:邢双阳---date：2013-5-14---for：firefox浏览器下载时文件标题乱码
	        	codedFileName =  "咨询学员" ;
	        	// 根据浏览器进行转码，使其支持中文文件名
				String browse = BrowserUtils.checkBrowse(request);
				if ("MSIE".equalsIgnoreCase(browse.substring(0, 4))) {
					response.setHeader(
							"content-disposition",
							"attachment;filename="
									+ java.net.URLEncoder.encode(codedFileName, "UTF-8")
									+ ".xls");
				} else {
					String newtitle = new String(codedFileName.getBytes("UTF-8"), "ISO8859-1");
					response.setHeader("content-disposition",
							"attachment;filename=" + newtitle + ".xls");
				}
	            // 进行转码，使其支持中文文件名
				// ---------end --------Author:邢双阳---date：2013-5-14---for：firefox浏览器下载时文件标题乱码 
	            // 产生工作簿对象
	            HSSFWorkbook workbook = null ;
	            Page<TeacherEntity> page = teacherService.find(new Page<TeacherEntity>(request, response, -1), stu); 
	            
	            List<TeacherEntity> stus = page.getList();
	            System.out.println(stus.size());
	            workbook =  ExcelExportUtil.exportExcel("导出信息", TeacherEntity.class, stus);
	            fOut = response.getOutputStream();
	            workbook.write(fOut);
	        }
	        catch (UnsupportedEncodingException e1)
	        {
	            
	        }
	        catch (Exception e)
	        {
	            
	        }
	        finally
	        {
	            try
	            {
	                fOut.flush();
	                fOut.close();
	            }
	            catch (IOException e)
	            {
	                
	            }
	        }
	    }
	
	@ResponseBody
	@RequestMapping(params = "treeData")
	public List<Map<String, Object>> treeData(HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		AgencyEntity agency =  ResourceUtil.getAgency();
		List<TeacherEntity> list = teacherService.findByProperty(TeacherEntity.class, "agencyid",agency.getId());
		for (int i=0; i<list.size(); i++){
			TeacherEntity c = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", c.getId());
			map.put("pId", 0);
			map.put("name", c.getRealname());
			mapList.add(map);
		}
		return mapList;
	}
}
