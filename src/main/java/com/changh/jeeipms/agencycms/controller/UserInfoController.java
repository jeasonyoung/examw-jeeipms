package com.changh.jeeipms.agencycms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.cms.service.agency.AgencyUserServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;

/**   
 * @Title: Controller
 * @Description: 机构用户
 * @author failymiss
 * @date 2013-07-25 17:32:51
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/agencycmsUser")
public class UserInfoController extends BaseController {
	@Autowired
	private AgencyUserServiceI agencyUserService;
	
	/**
	 * 机构用户列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(HttpServletRequest req ,AgencyUserEntity user) {
		AgencyUserEntity users = ResourceUtil.getSessionAgencyUser();
		if (StringUtil.isNotEmpty(user.getId())) {
			users.setEmail(user.getEmail());
			users.setOfficephone(user.getOfficephone());
			users.setMobilephone(user.getMobilephone());
			users.setRealname(user.getRealname());
			users.setQq(user.getQq());
			HttpSession session = ContextHolderUtils.getSession();
			//更改session里面的用户
			session.setAttribute(Globals.AGENCY_USER_SESSION, users);	
			//更改数据库的用户
			agencyUserService.updateEntitie(users);
			
			req.setAttribute("message", "保存用户信息成功");
		}
		//将用户保存到request
		req.setAttribute("user", users);
		return new ModelAndView("agency/cms/userInfo");
	}
	
	/**
	 * 修改密码
	 * 
	 * @return
	 */
	@RequestMapping(params = "savenewpwd")
	@ResponseBody
	public AjaxJson savenewpwd(HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		AgencyUserEntity user = ResourceUtil.getSessionAgencyUser();
		String password = oConvertUtils.getString(request.getParameter("oldpwd"));
		String newpassword = oConvertUtils.getString(request.getParameter("pwd"));
		if (!password.equals(user.getPassword())) {
			j.setMsg("原密码不正确");
			j.setSuccess(false);
		} else {
			System.out.println(StringUtil.isMatch("11111111", "^[0-9a-zA-Z]{6,20}$"));
			if(StringUtil.isMatch(newpassword, "^[0-9a-zA-Z]{6,20}$")){
				user.setPassword(newpassword);
				HttpSession session = ContextHolderUtils.getSession();
				session.setAttribute(Globals.AGENCY_USER_SESSION, user);		
				agencyUserService.updateEntitie(user);
				j.setMsg("修改成功");
			}else{
				j.setMsg("密码格式不正确");
				j.setSuccess(false);
				return j;
			}
		}
		return j;
	}
	
}
