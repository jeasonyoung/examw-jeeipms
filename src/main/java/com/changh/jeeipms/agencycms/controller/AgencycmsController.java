package com.changh.jeeipms.agencycms.controller;

import java.awt.image.BufferedImage;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.extend.datasource.DataSourceContextHolder;
import org.jeecgframework.core.extend.datasource.DataSourceType;
import org.jeecgframework.core.util.BrowserUtils;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.IPUtil;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.changh.jeeipms.cms.service.agency.AgencyServiceI;
import com.changh.jeeipms.cms.service.agency.AgencyUserServiceI;
import com.changh.jeeipms.common.entity.agency.AgencyEntity;
import com.changh.jeeipms.common.entity.agency.AgencyParameterEntity;
import com.changh.jeeipms.common.entity.agency.AgencyUserEntity;
import com.changh.jeeipms.common.entity.agency.CourseCategoryEntity;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

/**   
 * @Title: Controller
 * @Description: 机构管理
 * @author failymiss
 * @date 2013-07-23 10:53:37
 * @version V1.0   
 *
 */
@Controller
@RequestMapping(value="/agencycms")
public class AgencycmsController extends BaseController {
	@Autowired
	private AgencyServiceI agencyService;
	@Autowired
	private AgencyUserServiceI agencyUserService;
	@Autowired  
    private Producer captchaProducer = null; 
	
	/**
	 * 日志消息
	 */
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * 机构注册页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "regist")
	public ModelAndView register() {
		return new ModelAndView("agency/user/register");
	}
	/**
	 * 注册机构
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "register")
	public ModelAndView save(AgencyParameterEntity agency,AgencyUserEntity user,String code, HttpServletRequest request) {
		HttpSession session = ContextHolderUtils.getSession();
		if(!StringUtil.isEmpty(code)&&code.toLowerCase().equals(session.getAttribute(Constants.KAPTCHA_SESSION_KEY))){
			//移除验证码
			session.removeAttribute(Constants.KAPTCHA_SESSION_KEY);
			if (StringUtil.isNotEmpty(agency.getId())) {
				AgencyParameterEntity t = agencyService.get(AgencyParameterEntity.class, agency.getId());
				try {
					MyBeanUtils.copyBeanNotNull2Bean(agency, t);
					agencyService.saveOrUpdate(t);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				agency.setCreateTime(new Date());
				agency.setStatus("0");
				agency.setVip("0");
				agency.setExpirationdate(new Date(agency.getCreateTime().getTime()+((long)365 * 24 * 60 * 60 * 1000)));
				agency.setScore("0");
				agency.setLiveness("0");
				agency.setGrade("0");
				agency.setPageview("0");
				agency.setRecommend(Integer.MAX_VALUE);
				agency.setCurrency("0");
				agency.setContent("未审核");
				agencyService.save(agency);
				session.setAttribute(Globals.AGENCY_SESSION, agency);
			}
			user.setApe(agency);
			user.setLogincount(0);
			session.setAttribute(Globals.AGENCY_USER_SESSION, user);
			//机构
			session.setAttribute(Globals.AGENCY_SESSION, agency);
			//机构id
			session.setAttribute("agengcyid", agency.getId());
			//机构城市
			session.setAttribute("city", agency.getCity());
			session.setAttribute("province", agency.getProvince());
			session.setAttribute("username",user.getUsername());
			session.setAttribute(Globals.AGENCY_USER_SESSION,user);
			agencyUserService.save(user);
		
		}
		return new ModelAndView("redirect:/agencycms.do?login");
		
	}
	
	/**
	 * 检查用户
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "checkuser")
	@ResponseBody
	public AjaxJson checkuser(String username, String password,String code, HttpServletRequest req) {
		HttpSession session = ContextHolderUtils.getSession();
		DataSourceContextHolder.setDataSourceType(DataSourceType.dataSource_jeecg);
		AjaxJson j = new AjaxJson();
		if(!StringUtil.isEmpty(username)&&!StringUtil.isEmpty(password)&&code.toLowerCase().equals(session.getAttribute(Constants.KAPTCHA_SESSION_KEY))){
			//移除codesession
			session.removeAttribute(Constants.KAPTCHA_SESSION_KEY);
			AgencyUserEntity agencyUser = agencyUserService.findUniqueByProperty(AgencyUserEntity.class, "username", username); 
			if(StringUtil.isNotEmpty(agencyUser)&&password.equals(agencyUser.getPassword())){
				// 修改机构用户一些基本信息
				String ip = agencyUser.getLoginip();
				Date date = agencyUser.getLastlogintime();
				agencyUser.setLastlogintime(new Date());
				agencyUser.setLoginip(IPUtil.getIpAddr(req));
				agencyUser.setBrowser(BrowserUtils.checkBrowse(req));
				agencyUser.setLogincount(agencyUser.getLogincount().intValue()+1);
				agencyUserService.saveOrUpdate(agencyUser);
				session.setMaxInactiveInterval(60 * 30);
				AgencyEntity agency =agencyUserService.getEntity(AgencyEntity.class, agencyUser.getApe().getId());
				//机构用户
				session.setAttribute(Globals.AGENCY_USER_SESSION, agencyUser);
				//机构
				session.setAttribute(Globals.AGENCY_SESSION, agency);
				//机构id
				session.setAttribute("agengcyid", agency.getId());
				//机构二级域名	2014.03.26
				session.setAttribute("secondDomain", agency.getSecondDomain());
				//机构城市
				session.setAttribute("city", agency.getCity());
				session.setAttribute("ip", ip);	
				session.setAttribute("date", date);
				session.setAttribute("username",agencyUser.getUsername());
			}else{
				j.setMsg("用户名或密码错误!");
				j.setSuccess(false);
			}
		}
	
		return j;
	}
	/**
	 * 检查用户名
	 */
	@RequestMapping(params = "checkusername")
	@ResponseBody
	public AjaxJson checkUsername(String username,HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		AgencyUserEntity user = new AgencyUserEntity();
		if(StringUtil.isMatch(username, "^[0-9a-zA-Z_]+$")&&!StringUtil.check(username)){
			user=agencyService.findUniqueByProperty(AgencyUserEntity.class, "username", username);
		}else{
			j.setMsg("用户名不合法");
			j.setSuccess(false);
			return j;
		}
		if(StringUtil.isNotEmpty(user)){
			j.setMsg("用户名已被使用");
			j.setSuccess(false);
		}else{
			j.setMsg("用户名可以使用");
			j.setSuccess(true);
		}
		return j;
	}
	/**
	 * 检查邮箱 后台验证
	 * @param email
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "checkemail")
	@ResponseBody
	public AjaxJson checkemail(String email,HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		AgencyUserEntity user = new AgencyUserEntity();
		if(StringUtil.isMatch(email, "^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)+$")){
			user=agencyService.findUniqueByProperty(AgencyUserEntity.class, "email", email);
		}else{
			j.setMsg("邮箱格式不正确");
			j.setSuccess(false);
			return j;
		}
		if(StringUtil.isNotEmpty(user)){
			j.setMsg("邮箱已经被注册");
			j.setSuccess(false);
		}else{
			j.setMsg("邮箱可以使用");
			j.setSuccess(true);
		}
		return j;
	}
	/**
	 * 获取验证码
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params = "getcode")
	public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session =  ContextHolderUtils.getSession();
		/*String code = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		System.out.println("******************验证码是: " + code + "******************");*/
		response.setDateHeader("Expires", 0);
		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
			
		// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
			
		// Set standard HTTP/1.0 no-cache header.
		response.setHeader("Pragma", "no-cache");
			
		// return a jpeg
		response.setContentType("image/jpeg");
			
		// create the text for the image
		String capText = captchaProducer.createText();
			
		// store the text in the session
		session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		// create the image with the text
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();
			
		// write the data out
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
			return null;
		}
	@RequestMapping(params = "checkcode")
	@ResponseBody
	public AjaxJson checkCode(String code,HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if(StringUtil.isEmpty(code.trim())){
			j.setMsg("验证码不能为空");
			j.setSuccess(false);
			return j;
		}else{
			HttpSession session =  ContextHolderUtils.getSession();
			String realcode = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if(realcode!=null&&realcode.equals(code.toLowerCase())){
				j.setMsg("验证码输入正确");
				j.setSuccess(true);
				return j;
			}else{
				j.setMsg("验证码输入不正确");
				j.setSuccess(false);
				return j;
			}
		}
	}
	

	/**
	 * 用户登录
	 * 
	 * @param user
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(params = "login")
	public String login(HttpServletRequest request) {
		DataSourceContextHolder.setDataSourceType(DataSourceType.dataSource_jeecg);
		AgencyUserEntity user = ResourceUtil.getSessionAgencyUser();
		HttpSession session = ContextHolderUtils.getSession();
		if (StringUtil.isNotEmpty(user)) {
			SimpleDateFormat format = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = (Date) session.getAttribute("date");
			if(StringUtil.isNotEmpty(date)){
				request.setAttribute("date",format.format(date));
			}else{
				request.setAttribute("date","未知");
			}
			String ip = (String) session.getAttribute("ip");
			if(StringUtil.isEmpty(ip)){
				request.setAttribute("ip", "未知");
			}else{
				request.setAttribute("ip", ip);
			}	
			return "agency/cms/index";
		} else {
			return "agency/user/login";
		}

	}

	/**
	 * 退出系统
	 * 
	 * @param user
	 * @param req
	 * @return
	 */
	@RequestMapping(params = "logout")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView modelAndView = null;

		HttpSession session = ContextHolderUtils.getSession();
		// 判断用户是否为空不为空则清空session中的用户object
		session.removeAttribute(Globals.AGENCY_USER_SESSION);// 注销该操作用户
		modelAndView = new ModelAndView(new RedirectView("agencycms.do?login"));
		return modelAndView;
	}
	
	/**
	 * 机构管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "update")
	public ModelAndView addorupdate(AgencyEntity agency, HttpServletRequest req) {
		agency = ResourceUtil.getAgency();
		String[] name ={};
		String categoryname = "";
		if(StringUtil.isNotEmpty( agency.getCategory())){
			 name = agency.getCategory().split(",");
			 for(String s:name){
					CourseCategoryEntity c = agencyService.getEntity(CourseCategoryEntity.class, s);
					categoryname += c.getCategoryname()+",";
			}
		}
		agency.setCategoryname(categoryname);
		req.setAttribute("agency", agency);
		return new ModelAndView("agency/cms/agencyInfo");
	}
	
	@RequestMapping(params = "save")
	public ModelAndView addorupdate(AgencyEntity agency, HttpServletRequest req,RedirectAttributes redirectAttributes) {
		if (StringUtil.isNotEmpty(agency.getId())) {
			AgencyEntity a = agencyService.getEntity(AgencyEntity.class, agency.getId());
			try {
				agency.setIntroduction(req.getParameter("myeditor"));
				MyBeanUtils.copyBeanNotNull2Bean(agency, a);
				agencyService.saveOrUpdate(a);
				addMessage(redirectAttributes, "修改机构信息成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
			HttpSession session = ContextHolderUtils.getSession();
			session.setAttribute(Globals.AGENCY_SESSION, a);
			return new ModelAndView("redirect:/agencycms.do?update");
		}else{
			return new ModelAndView("redirect:/agencycms.do?login");
		}
	}
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "filemanger")
	public ModelAndView filemanger(HttpServletRequest request) {
		return new ModelAndView("agency/cms/fileManger");
	}
	
	@RequestMapping(params = "agencyUser")
	public ModelAndView agencyUser(HttpServletRequest request) {
		return new ModelAndView("com/changh/jeeipms/cms/agency/agencyUserList");
	}
}
