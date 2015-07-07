package com.changh.jeeipms.agencycms.controller;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.excel.ExcelExportUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyStudentEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.service.agency.AgencyStudentServiceI;
import com.changh.jeeipms.common.util.StringUtils;
/**   
 * @Title: Controller
 * @Description: 咨询学员
 * @author failymiss
 * @date 2013-08-08 16:30:15
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/agencycmsStudent")
public class AgencycmsStudentController extends BaseController {
	@Autowired
	private AgencyStudentServiceI agencyStudentService;
	
	@RequestMapping(params = "list")
	public String list(AgencyStudentEntity stu, HttpServletRequest request, HttpServletResponse response, Model model) {
        Page<AgencyStudentEntity> page = agencyStudentService.find(new Page<AgencyStudentEntity>(request, response), stu);
        model.addAttribute("stu", stu);
        model.addAttribute("page", page);
		return "agency/cms/studentList";
	}
	
	/**
	 * 删除咨询学员
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	public String del( String stuId,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		AgencyStudentEntity agencyStudent = agencyStudentService.getEntity(AgencyStudentEntity.class, stuId);
		agencyStudentService.delete(agencyStudent);
		addMessage(redirectAttributes, "删除学员'" + StringUtils.abbr(agencyStudent.getRealname(),15) + "'成功");
		return "redirect:/agencycmsStudent.do?list&repage";
	}
	/**
	 * 修改咨询学员
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	public String  save(AgencyStudentEntity agencyStudent, HttpServletRequest request,RedirectAttributes redirectAttributes,String agencyId) {
		String message ="";
		HttpSession session = ContextHolderUtils.getSession();
		AgencyUserEntity user = (AgencyUserEntity) session.getAttribute(Globals.AGENCY_USER_SESSION);
		if (StringUtil.isNotEmpty(agencyStudent.getId())) {
			message = "更新成功";
			AgencyStudentEntity t = agencyStudentService.get(AgencyStudentEntity.class, agencyStudent.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(agencyStudent, t);
				t.setAgency(user.getApe());
				agencyStudentService.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "添加成功";
			agencyStudentService.save(agencyStudent);
		}
		addMessage(redirectAttributes, message );
		return "redirect:/agencycmsStudent.do?list&repage";
		
	}
	
	/**
	 * 导出咨询学员
	 * @param stu
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "exportXls")
	public void exportXls( AgencyStudentEntity stu,HttpServletRequest request, HttpServletResponse response) {
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
	            Page<AgencyStudentEntity> page = agencyStudentService.find(new Page<AgencyStudentEntity>(request, response, -1), stu); 
	            
	            List<AgencyStudentEntity> stus = page.getList();
	            workbook =  ExcelExportUtil.exportExcel("导出信息", AgencyStudentEntity.class, stus);
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
}
