package com.changh.jeeipms.agencycms.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.changh.jeeipms.agencycms.entity.Page;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.agency.PhotoEntity;
import com.changh.jeeipms.common.service.agency.PhotoServiceI;
import com.changh.jeeipms.common.util.StringUtils;

@Controller
@RequestMapping("/agencycmsphoto")
public class AgencycmsPhotoController extends BaseController{
	@Autowired
	private PhotoServiceI  photoService;
	/**
	 * 相册列表
	 * @param photo
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(params = "photoList")
	public String facelist( PhotoEntity photo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PhotoEntity> page = photoService.find(new Page<PhotoEntity>(request, response), photo);	
        model.addAttribute("photo", photo);
        model.addAttribute("page", page);
		return "agency/cms/photoList";
	}
	

	/**
	 * 添加机构相册
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	public String save(PhotoEntity photo, RedirectAttributes redirectAttributes,HttpServletRequest request) {
		String message ="";
		if (StringUtil.isNotEmpty(photo.getId())) {
			PhotoEntity t = photoService.get(PhotoEntity.class, photo.getId());
			try {
				message="更新成功";
				photo.setThumbUrl(photo.getUrlpath());
				MyBeanUtils.copyBeanNotNull2Bean(photo, t);
				photoService.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message="添加成功";
			photo.setAddtime(new Date());
			photo.setAgency(ResourceUtil.getAgency());
			photo.setThumbUrl(photo.getUrlpath());
			photoService.save(photo);
		}
		addMessage(redirectAttributes, message );
		return "redirect:/agencycmsphoto.do?photoList&repage";
	}
	
	/**
	 * 删除机构在线课程
	 * 
	 * @return
	 */
	@RequestMapping(params = "delete")
	public String delonline( String id,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		PhotoEntity photo = photoService.getEntity(PhotoEntity.class, id);
		photoService.delete(photo);
		addMessage(redirectAttributes, "删除图片'" + StringUtils.abbr(photo.getTitle(),18) + "'成功");
		return "redirect:/agencycmsphoto.do?photoList&repage";
	}
	

}
