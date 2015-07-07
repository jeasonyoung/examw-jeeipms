package com.changh.jeeipms.front.controller.center;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.ContextHolderUtils;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.core.util.PropertiesUtil;
import org.jeecgframework.core.util.ResourceUtil;
import org.jeecgframework.core.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DataAccessUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.changh.jeeipms.common.entity.agency.CourseEntity;
import com.changh.jeeipms.common.entity.ask.AskEntity;
import com.changh.jeeipms.common.entity.card.CardRecordEntity;
import com.changh.jeeipms.common.entity.card.StudyCardEntity;
import com.changh.jeeipms.common.entity.order.CourseItemEntity;
import com.changh.jeeipms.common.entity.order.CourseOrderEntity;
import com.changh.jeeipms.common.entity.student.NoteEntity;
import com.changh.jeeipms.common.entity.student.StudentEntity;
import com.changh.jeeipms.common.entity.student.StudyRecordEntity;
import com.changh.jeeipms.common.service.student.StudyRecordServiceI;

/**   
 * @Title: Controller
 * @Description: 学习记录
 * @author failymiss
 * @date 2013-10-10 14:30:46
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("/cstudyRecordController")
public class CstudyRecordController extends BaseController {
	@Autowired
	private StudyRecordServiceI studyRecordService;
	/**
	 * 获取学员的学习记录
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "list")
	public ModelAndView getRecordListByStuId(HttpServletRequest request){
		StudentEntity student = ResourceUtil.getStudent();
		List<StudyRecordEntity> list = studyRecordService.findHql("from StudyRecordEntity r where r.student.id= '"+student.getId()+"' order by r.starttime desc",1,5, (Object[])null);
		request.setAttribute("records", list);
		return new ModelAndView("front/center/record");
	}
	/**
	 * 推荐学员课程
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "recommend")
	public ModelAndView getRecommendCourse(HttpServletRequest request){
		List<CourseEntity> list = studyRecordService.findHql("from CourseEntity c where c.coursetype='1' and c.status="+Globals.AGENCY_COURSE_SUCCESS+"  order by c.courseorder asc" , 1, 7, (Object[])null);
		request.setAttribute("list",list);
		return new ModelAndView("front/center/recommend");
	}
	/**
	 * 学员的未支付订单
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "order")
	public ModelAndView getStuOrder(HttpServletRequest request){
		StudentEntity student = ResourceUtil.getStudent();
		List<CourseOrderEntity> list = studyRecordService.findHql("from CourseOrderEntity c where c.student.id='"+student.getId()+"' and c.orderStatus=0 and c.orderType = 1 order by c.orderAddtime desc",1,10, (Object[])null);
		request.setAttribute("list", list);
		return new ModelAndView("front/center/order");
	}
	@RequestMapping(params = "paid")
	public ModelAndView getPaidOrder(HttpServletRequest request){
		StudentEntity student = ResourceUtil.getStudent();
		List<CourseOrderEntity> list = studyRecordService.findHql("from CourseOrderEntity c where c.student.id='"+student.getId()+"' and c.orderStatus=1 and c.orderType = 1 order by c.orderAddtime desc",1,10, (Object[])null);
		request.setAttribute("list", list);
		return new ModelAndView("front/center/paid");
	}
	/**
	 * 删除学习记录
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(StudyRecordEntity studyRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		studyRecord = studyRecordService.getEntity(StudyRecordEntity.class, studyRecord.getId());
		studyRecordService.delete(studyRecord);
		j.setMsg("删除成功");
		return j;
	}
	/**
	 * 添加学习记录
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(StudyRecordEntity studyRecord, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();	
		return j;
	}
	/**
	 * 学习卡页面
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "studycard")
	public ModelAndView studycard(HttpServletRequest request){
		StudentEntity student = ResourceUtil.getStudent();
		List<CardRecordEntity> list = studyRecordService.findHql("from CardRecordEntity c where c.student.id = '"+student.getId()+"' order by c.useTime desc");
		request.setAttribute("list", list);
		return new ModelAndView("front/center/studyCard");
	}
	/**
	 * 学习卡充值
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "recharge")
	@ResponseBody
	public AjaxJson recharge(String cardNo, String pwd,String money,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		StudyCardEntity studycard = studyRecordService.findUniqueByProperty(StudyCardEntity.class, "cardNum", cardNo);
		StudentEntity student = ResourceUtil.getStudent();
		if(StringUtil.isNotEmpty(studycard)&&studycard.getCardPassword().equals(pwd)){
			Integer value;
			if(StringUtil.isNotEmpty(money)){
				 value = Integer.parseInt(money);
			}else{
				 value= studycard.getCardBalance().intValue();
			}
			Integer cardbalance = studycard.getCardBalance().intValue();
		
			if(value>cardbalance){
				j.setSuccess(false);
				j.setMsg("学习卡余额不足");
			}else{
				//修改学习卡状态
				studycard.setCardBalance(new BigDecimal(cardbalance-value));
				studycard.setStuId(student.getId());
				studycard.setUsetime(new Date());
				studyRecordService.saveOrUpdate(studycard);
				//添加学员流水信息
				CardRecordEntity record = new CardRecordEntity();
				record.setRecordContent("充值");
				record.setRecordValue(new BigDecimal(value));
				record.setStudent(student);
				record.setStudycard(studycard);	
				record.setUserContent("学习卡充值");
				record.setUseTime(new Date());
				studyRecordService.save(record);
				//修改学员账户信息
				System.out.println(student.getId());
				student.setStudycard(null==student.getStudycard()?new BigDecimal(value):student.getStudycard().add(new BigDecimal(value)));
				studyRecordService.saveOrUpdate(student);
				HttpSession session = ContextHolderUtils.getSession();
				session.setAttribute("student", student);
			}
			
		}else{
			j.setMsg("请输入正确的卡号和密码");
			j.setSuccess(false);
		}
		
		return j;
	}
	/**
	 * 查询学习卡余额
	 * @return
	 */
	@RequestMapping(params = "checkCard")
	@ResponseBody
	public AjaxJson getCardBalance(String cardNo,String password,HttpServletRequest request){		
		AjaxJson j = new AjaxJson();
		System.out.println(cardNo);
		StudyCardEntity card = studyRecordService.findUniqueByProperty(StudyCardEntity.class, "cardNum", cardNo);
		
		if(StringUtil.isNotEmpty(card)&&card.getCardPassword().equals(password)){
			j.setMsg("学习卡余额还有"+card.getCardBalance());
		}else{
			j.setMsg("请输入正确的卡号和密码");
		}
		return j;
	}
	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "cash")
	public ModelAndView cash(HttpServletRequest request){
		return new ModelAndView("front/center/charge");
	}
	@RequestMapping(params ="info")
	public ModelAndView info(HttpServletRequest request){
		return new ModelAndView("front/center/info");
	}
	@RequestMapping(params ="head")
	public ModelAndView head(HttpServletRequest request){
		return new ModelAndView("front/center/headImg");
	}
	@RequestMapping(params ="password")
	public ModelAndView password(HttpServletRequest request){
		return new ModelAndView("front/center/password");
	}
	/**
	 * 修改学员信息
	 * @param student
	 * @param request
	 * @return
	 */
	@RequestMapping(params ="saveInfo")
	@ResponseBody
	public AjaxJson saveInfo(StudentEntity student,HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		StudentEntity stu = ResourceUtil.getStudent();
		HttpSession session  = ContextHolderUtils.getSession();
		try {
			MyBeanUtils.copyBeanNotNull2Bean(student, stu);
			System.out.println(stu.getRealname());
			studyRecordService.saveOrUpdate(stu);
			session.setAttribute("student", stu);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("修改失败");
			e.printStackTrace();
		}
		return j;
	}
	/**
	 * 获取学员购买的课程
	 * @param request
	 * @return
	 */
	@RequestMapping(params ="myclass")
	public ModelAndView getCource(HttpServletRequest request){
		StudentEntity stu = ResourceUtil.getStudent();
		List<CourseItemEntity> list = studyRecordService.findHql("from CourseItemEntity c where c.order.orderStatus="+Globals.ORDER_PAY_SUCCESS+" and c.order.student.id='"+stu.getId()+"' order by c.order.orderPaytime desc");
		request.setAttribute("list",list);
		return new ModelAndView("front/center/myclass");
	}
	/**
	 * 获取学员笔记
	 * @param request
	 * @param page
	 * @param pagesize
	 * @return
	 */
	@RequestMapping(params ="getNote")
	public ModelAndView getStudyNote(HttpServletRequest request,int page){
		StudentEntity stu = ResourceUtil.getStudent();
		int count = DataAccessUtils.intResult(studyRecordService.findHql("select count(*) from  NoteEntity n  where n.student.id='"+stu.getId()+"'"));
		if(!StringUtil.isNotEmpty(page)){
			page=1;
		}else if(page>count/10){
			if(count%10==0){
				page = count/10;	
			}else{
				page = count/10+1;
			}
			
		}
		List<NoteEntity> list = studyRecordService.findHql("from NoteEntity n where n.student.id='"+stu.getId()+"' order by n.notetime desc", page, 10, (Object[])null);
		request.setAttribute("list",list);	
		request.setAttribute("total",count);
		request.setAttribute("page",page);
		return new ModelAndView("front/center/mynote") ;
	}
	/**
	 * 获取学员提问
	 * @param request
	 * @param page
	 * @param pagesize
	 * @return
	 */
	@RequestMapping(params ="getAsk")
	public ModelAndView getAsk(HttpServletRequest request,int page){
		StudentEntity stu = ResourceUtil.getStudent();
		int count = DataAccessUtils.intResult(studyRecordService.findHql("select count(*) from  AskEntity n  where n.student.id='"+stu.getId()+"'"));
		if(!StringUtil.isNotEmpty(page)){
			page=1;
		}else if(page>count/10){
			if(count%10==0){
				page = count/10;	
			}else{
				page = count/10+1;
			}
			
		}
		List<NoteEntity> list = studyRecordService.findHql("from AskEntity n where n.student.id='"+stu.getId()+"' order by n.createDate desc", page, 10, (Object[])null);
		request.setAttribute("list",list);	
		request.setAttribute("total",count);
		request.setAttribute("page",page);
		return new ModelAndView("front/center/myAsk") ;
	}
	@RequestMapping(params ="askDetail")
	public ModelAndView askDetail(AskEntity ask ,HttpServletRequest request){
		String id = ask.getId();
		if(StringUtil.isNotEmpty(id))
		{
			ask = studyRecordService.get(AskEntity.class, id);
			ask.setStatus(Integer.valueOf(Globals.ASK_ANSWER_DONE)); //已经查看
			studyRecordService.updateEntitie(ask);
		}
		request.setAttribute("ask",ask);
		return new ModelAndView("front/center/askDetail") ;
	}
	@RequestMapping(params ="askcount")
	@ResponseBody
	public AjaxJson askCount(HttpServletRequest request){
		AjaxJson j = new AjaxJson();
		StudentEntity stu = ResourceUtil.getStudent();
		int count = DataAccessUtils.intResult(studyRecordService.findHql("select count(*) from  AskEntity n  where n.student.id='"+stu.getId()+"' and n.status = 1"));
		j.setObj(count);
		if(count == 0) j.setSuccess(false);
		return j;
	}
	
	/**
	 * 删除笔记
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(params ="deleteNote")
	@ResponseBody
	public AjaxJson deleteNote(HttpServletRequest request,String id){
		AjaxJson j = new AjaxJson();
		NoteEntity note = studyRecordService.getEntity(NoteEntity.class, id);
		studyRecordService.delete(note);
		return j;
	}
	
	@RequestMapping(params ="updatePwd")
	@ResponseBody
	public AjaxJson updatePwd(String oldpwd,String newpwd){
		AjaxJson j = new AjaxJson();
		StudentEntity stu = ResourceUtil.getStudent();
		if(oldpwd.equals(stu.getSpassword())){
			j.setMsg("修改成功");
			stu.setSpassword(newpwd);
			studyRecordService.saveOrUpdate(stu);
			HttpSession session = ContextHolderUtils.getSession();
			session.removeAttribute("student"); 
		}else{
			j.setSuccess(false);
			j.setMsg("原始密码不正确");
		}
		return j;
	}
	/**
	 * 上传图片文件,并保存到指定的路径当中
	 * @param request
	 * @param path1
	 * @param path2
	 */
	@RequestMapping(params = "upload", method = RequestMethod.POST)
	public ModelAndView addImage(HttpServletRequest request) {
		//转型为MultipartHttpRequest(重点的所在)
	     MultipartHttpServletRequest multipartRequest  =  (MultipartHttpServletRequest) request;
	     //  获得第1张图片（根据前台的name名称得到上传的文件） 
	     MultipartFile imgFile1  =  multipartRequest.getFile("filename");   
	     //定义一个数组，用于保存可上传的文件类型
	     List<String> fileTypes = new ArrayList<String>();
	     fileTypes.add("jpg");
	     fileTypes.add("jpeg");
	     fileTypes.add("gif");
	     fileTypes.add("png");
	     //保存第一张图片
	     if(!(imgFile1.getOriginalFilename() ==null || "".equals(imgFile1.getOriginalFilename()))) {
	    	getFile(imgFile1,fileTypes,request);
	    	 
	     }  
	     return new ModelAndView("front/center/headImg");
	}
	/**
	 * 通过传入页面读取到的文件，处理后保存到本地磁盘，并返回一个已经创建好的File
	 * @param imgFile 从页面中读取到的文件
	 * @param typeName	商品的分类名称
	 * @param brandName 商品的品牌名称
	 * @param fileTypes 允许的文件扩展名集合
	 * @return
	 */
	private void getFile(MultipartFile imgFile,List fileTypes,HttpServletRequest request) {
		 String fileName = imgFile.getOriginalFilename();
		//获取上传文件类型的扩展名,先得到.的位置，再截取从.的下一个位置到文件的最后，最后得到扩展名
	     String ext = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
	     String path = PropertiesUtil.getOptValue("userImg")+getName(fileName);
	     //对扩展名进行小写转换
	     ext = ext.toLowerCase();     
	     File file = new File(this.getPhysicalPath(path,request));
	     if(fileTypes.contains(ext)) {						//如果扩展名属于允许上传的类型，则创建文件
	    	 this.getFolder(path, request);
	    	 StudentEntity stu = ResourceUtil.getStudent();
		     stu.setImageurl(path);
		     studyRecordService.saveOrUpdate(stu);
		     HttpSession session = ContextHolderUtils.getSession();
		     session.setAttribute("student",stu);
	    	 try {
				imgFile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}    
	     }
	}
	
	private String getName(String filename) {
		return "headimg"+new Random().nextInt(10)+System.currentTimeMillis()+getFileExt(filename);
	}
	
	/**
	 * 获取文件扩展名
	 * 
	 * @return string
	 */
	private String getFileExt(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}
	/**
	 * 根据字符串创建本地目录 并按照日期建立子目录返回
	 * @param path 
	 * @return 
	 */
	private void getFolder(String path,HttpServletRequest request) {
		File dir = new File(this.getPhysicalPath(path,request));
		if (!dir.exists()) {
			try {
				dir.mkdirs();
			} catch (Exception e) {
				
			}
		}
	}

	/**
	 * 根据传入的虚拟路径获取物理路径
	 * 
	 * @param path
	 * @return
	 */
	private String getPhysicalPath(String path,HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("");
		return realPath +"/" +path;
	}
	

    @RequestMapping(params = "download")  
    public void download(String courseId,HttpServletRequest request, HttpServletResponse res) throws IOException {
    	StudentEntity stu =	ResourceUtil.getStudent();
		HttpSession session = ContextHolderUtils.getSession();
		List<String> list = (List<String>) session.getAttribute("listC");
		if(list==null||list.size()==0){
		list = new ArrayList<String>();
		List<CourseItemEntity>	list1 = studyRecordService.findHql("from CourseItemEntity c where c.order.orderStatus="+Globals.ORDER_PAY_SUCCESS+" and c.order.student.id='"+stu.getId()+"' order by c.order.orderPaytime desc");
			for(CourseItemEntity item:list1){
				 list.add(item.getCourse().getId());
				 System.out.println(item.getCourse().getId());
			 }
			 session.setAttribute("listC", list);
		}
		if(StringUtil.isNotEmpty(courseId)&&list.contains(courseId)&&StringUtil.isNotEmpty(stu)){
			
			CourseEntity c = studyRecordService.getEntity(CourseEntity.class, courseId);
			String audition = c.getAudition();
			OutputStream os = res.getOutputStream();  
			try {  
				audition = URLDecoder.decode(audition, "utf-8");
				String suffix = getFileExt(audition);
				File file = new File(getPhysicalPath(audition, request));
				res.reset();  
				res.setHeader("Content-Disposition", "attachment; filename=paper"+suffix);  
				res.setContentType("application/octet-stream; charset=utf-8");  
				os.write(FileUtils.readFileToByteArray(file));  
				os.flush();  
			} catch(Exception e)
			{
				e.printStackTrace();
				res.reset();
				res.setContentType("text/html;charset=UTF-8");
				os.write("Sorry, download failed".getBytes());
				os.flush();
			}
			finally {  
				if (os != null) {  
					os.close();  
				}  
			}  
		}
    }  
}
