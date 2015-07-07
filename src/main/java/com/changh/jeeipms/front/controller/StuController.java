package com.changh.jeeipms.front.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.IPUtil;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.core.util.oConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.common.entity.order.CourseOrderEntity;
import com.changh.jeeipms.common.entity.student.StudentEntity;
import com.changh.jeeipms.common.service.student.StudentServiceI;
import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

/**
 * @Title: Controller
 * @Description: 学员前台controller
 * @author failymiss
 * @date 2013-09-22 09:23:58
 * @version V1.0
 * 
 */
@Controller
@RequestMapping("/stuCenter")
public class StuController extends BaseController {
	@Autowired
	private StudentServiceI studentService;
	@Autowired
	private Producer captchaProducer = null;

	/**
	 * 学员注册跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "regist")
	public ModelAndView regist() {
		return new ModelAndView("front/stuRegist");
	}

	/**
	 * 学员注册
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(StudentEntity student, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(student.getId())) {
			StudentEntity t = studentService.get(StudentEntity.class,
					student.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(student, t);
				studentService.saveOrUpdate(t);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			student.setAddtime(new Date());
			Random r = new Random();
			student.setImageurl("/images/user/user-default-" + r.nextInt(4)
					+ ".png");
			student.setLastloginip(oConvertUtils.getIpAddrByRequest(request));
			student.setLastlogintime(new Date());
			student.setLogintimes(1);
			student.setStatus(0);
			HttpSession session = ContextHolderUtils.getSession();
			studentService.save(student);
			StudentEntity stu = studentService.findUniqueByProperty(
					StudentEntity.class, "username", student.getUsername());
			session.setAttribute("student", stu);
		}
		return j;
	}

	/**
	 * 检查学员登陆
	 * 
	 * @param stu
	 * @param code
	 * @return
	 */
	@RequestMapping(params = "checkLogin")
	public void checkStu(StudentEntity stu, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		j.setSuccess(false);
		j.setMsg("密码或用户名错误");
		HttpSession session = ContextHolderUtils.getSession();
		if (StringUtil.isNotEmpty(stu.getUsername())
				&& StringUtil.isNotEmpty(stu.getSpassword())) {
			StudentEntity student = studentService.findUniqueByProperty(
					StudentEntity.class, "username", stu.getUsername());
			// 登陆成功
			if (StringUtil.isNotEmpty(student)
					&& stu.getSpassword().equalsIgnoreCase(
							student.getSpassword())) {
				j.setSuccess(true);
				// 修改student的一些基本信息
				student.setLastloginip(IPUtil.getIpAddr(request));
				student.setLastlogintime(new Date());
				student.setLogintimes(student.getLogintimes() + 1);
				// 登陆成功 移除登陆失败次数统计
				session.removeAttribute("counts");
				// 保存至seesion
				/**
				 * 统计该学员未未支付的订单
				 */
				List<CourseOrderEntity> nopay = studentService
						.findHql("from CourseOrderEntity c where c.student.id = '"
								+ student.getId() + "' and c.orderStatus=0");
				if (StringUtil.isNotEmpty(nopay)) {
					session.setAttribute("nopay", nopay.size());
				} else {
					session.setAttribute("nopay", 0);
				}
				studentService.saveOrUpdate(student);
				session.setAttribute("student", student);
			} else {
				session.setAttribute("counts",
						(session.getAttribute("counts") == null ? 0
								: (Integer) session.getAttribute("counts")) + 1);
			}
		}
		String callback = request.getParameter("callback");
		if (StringUtil.isNotEmpty(callback)) {
			String result = "";
			if(j.isSuccess())
			{
				result=callback+ "({\"success\":\"true\"})";
			}else
			{
				result=callback+ "({\"success\":\"\",\"msg\":\"密码或用户名错误\"})";
			}
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter pw=	null;
			try {
				pw = response.getWriter();
				pw.write(result);
				pw.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(pw!=null)
				{
					pw.close();
				}
			}
			return;
		}
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "no-store");
		JSONObject object = JSONObject.fromObject(j);
		PrintWriter pw=	null;
		try {
			pw=response.getWriter();
			pw.write(object.toString());
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(pw!=null)
			{
				pw.close();
			}
		}
	}

	/**
	 * Ajax 登陆
	 * 
	 * @param stu
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "login")
	@ResponseBody
	public AjaxJson checkLogin(StudentEntity stu, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		j.setSuccess(false);
		j.setMsg("密码或用户名错误");
		HttpSession session = ContextHolderUtils.getSession();
		if (StringUtil.isNotEmpty(stu.getUsername())
				&& StringUtil.isNotEmpty(stu.getSpassword())) {
			StudentEntity student = studentService.findUniqueByProperty(
					StudentEntity.class, "username", stu.getUsername());
			// 登陆成功
			if (StringUtil.isNotEmpty(student)
					&& stu.getSpassword().equalsIgnoreCase(
							student.getSpassword())) {
				// 修改student的一些基本信息
				student.setLastloginip(IPUtil.getIpAddr(request));
				student.setLastlogintime(new Date());
				student.setLogintimes(student.getLogintimes() + 1);
				// 登陆成功 移除登陆失败次数统计
				session.removeAttribute("counts");
				// 保存至seesion
				session.setAttribute("student", student);
				j.setSuccess(true);
			} else {
				session.setAttribute("counts",
						(session.getAttribute("counts") == null ? 0
								: (Integer) session.getAttribute("counts")) + 1);
			}
		}
		return j;
	}

	/**
	 * 检查用户名唯一性
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(params = "checkusername")
	@ResponseBody
	public AjaxJson checkUsername(String username) {
		AjaxJson j = new AjaxJson();
		j.setMsg("恭喜，可以使用");
		StudentEntity stu = studentService.findUniqueByProperty(
				StudentEntity.class, "username", username);
		if (StringUtil.isNotEmpty(stu)) {
			j.setMsg("该用户名已被使用");
			j.setSuccess(false);
		}
		return j;
	}

	/**
	 * 检查邮箱唯一性
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(params = "checkemail")
	@ResponseBody
	public AjaxJson checkemail(String email) {
		AjaxJson j = new AjaxJson();
		j.setMsg("恭喜，可以使用");
		StudentEntity stu = studentService.findUniqueByProperty(
				StudentEntity.class, "email", email);
		if (StringUtil.isNotEmpty(stu)) {
			j.setSuccess(false);
			j.setMsg("该邮箱已被使用");
		}
		return j;
	}

	/**
	 * 跳转至会员中心
	 * 
	 * @return
	 */
	@RequestMapping(params = "index")
	public ModelAndView stuCenter(HttpServletRequest request) {
		HttpSession session = ContextHolderUtils.getSession();
		if (StringUtil.isNotEmpty(session.getAttribute("student"))) {
			return new ModelAndView("front/center/index");
		} else {
			return new ModelAndView("front/stuLogin");
		}

	}

	/**
	 * 退出
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		HttpSession session = ContextHolderUtils.getSession();
		//session.invalidate();
		session.removeAttribute("student");
		String callback = request.getParameter("callback");
		if (StringUtil.isNotEmpty(callback)) {
			String result = "";
			result=callback+ "({\"success\":\"true\"})";
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter pw = null;
			try {
				pw=response.getWriter();
				pw.write(result);
				pw.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(pw!=null)
				{
					pw.close();
				}
			}
			return;
		}
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "no-store");
		JSONObject object = JSONObject.fromObject(j);
		PrintWriter pw = null;
		try {
			pw=response.getWriter();
			pw.write(object.toString());
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(pw!=null)
			{
				pw.close();
			}
		}
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "checkStu")
	public void checkStu(HttpServletRequest request, HttpServletResponse response) {
		String callback = request.getParameter("callback");
		StudentEntity stu = ResourceUtil.getStudent();
		if (StringUtil.isNotEmpty(callback)) {
			String result = "";
			if (StringUtil.isNotEmpty(stu)) {
				result = callback
						+ "({\"success\":\"true\",\"attributes\":{\"id\":\""
						+ stu.getId() + "\",\"username\":\"" + stu.getUsername()
						+ "\"}})";
			} else {
				result = callback + "({\"success\":\"\"})";
			}
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			try {
				PrintWriter pw=response.getWriter();
				pw.write(result);
				pw.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return;
		}
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(stu)) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", stu.getId());
			map.put("username", stu.getUsername());
			j.setAttributes(map);
		} else {
			j.setSuccess(false);
		}
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "no-store");
		JSONObject object = JSONObject.fromObject(j);
		try {
			PrintWriter pw=response.getWriter();
			pw.write(object.toString());
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取验证码
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(params = "getcode")
	public ModelAndView getKaptchaImage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = ContextHolderUtils.getSession();
		/*
		 * String code =
		 * (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		 * System.out.println("******************验证码是: " + code +
		 * "******************");
		 */
		response.setDateHeader("Expires", 0);
		// Set standard HTTP/1.1 no-cache headers.
		response.setHeader("Cache-Control",
				"no-store, no-cache, must-revalidate");

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
	public AjaxJson checkCode(String code, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isEmpty(code.trim())) {
			j.setMsg("验证码不能为空");
			j.setSuccess(false);
			return j;
		} else {
			HttpSession session = ContextHolderUtils.getSession();
			String realcode = (String) session
					.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if (realcode.equals(code.toLowerCase())) {
				j.setMsg("验证码输入正确");
				j.setSuccess(true);
				return j;
			} else {
				j.setMsg("验证码输入不正确");
				j.setSuccess(false);
				return j;
			}
		}
	}
}
