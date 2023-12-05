package com.blogcdk.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blogcdk.model.BlogDetail;
import com.blogcdk.model.User;
import com.blogcdk.model.Userinfo;
import com.blogcdk.service.UserService;
import com.blogcdk.util.Functions;
import com.blogcdk.util.PageUtil;

import net.sf.json.JSONArray;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping("/register")
	public String insertUser(User user,Model model){
		System.out.println("用户注册调用username:"+user.getUsername()+" password:"+user.getPassword()+" email:"+user.getEmail());
		List<User> userList = userService.selectUserByUsernameOfReg(user.getUsername());
		System.out.println("userList.size():"+userList.size());
		String jsonStr = null; 
		if(userList.size()==0){
			if(user.getPassword()!=null && user.getUsername()!=null && user.getEmail()!=null){
				//设置Gravatar图片链接
				String gravatarImg = Functions.getGravatar(user.getEmail());
				//设置激活码code
				String code = Functions.getCode()+Functions.getCode();
				user.setGravatarImg(gravatarImg);
				user.setCode(code);
				user.setState(0);//默认为0,,激活为1
				userService.insertUser(user);
				Functions.sendMail(user.getEmail(), code);
				model.addAttribute("msg","注册成功,激活邮件已经发送到您的邮箱请及时激活!");
			}
			
			String regStatus = "regSuccess";
			jsonStr =  "[{'regStatus':'" + regStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			return json.toString();
		}else{
			String regStatus = "hasThisUser";
			jsonStr =  "[{'regStatus':'" + regStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			model.addAttribute("msg","用户名存在，注册失败");
			return json.toString();
		}
	}
	
	/**
	 * 用户账号激活
	 * @param code
	 * @param model
	 * @return
	 */
	@RequestMapping("/activate")
	public String activateUser(@RequestParam("code") String code,
			Model model){
		User user =userService.findByCode(code);
		if(user!=null){
		    user.setState(1);
		    user.setCode(null);
		    if(userService.updateUser(user)){
		    	model.addAttribute("msg","账号激活成功!");
		    	return "registerSuccess";
		    }else{
		    	model.addAttribute("msg","账号激活失败!");
		    	return "registerSuccess";
		    }
		}else{
			
			model.addAttribute("msg","账号激活码不存在!");
	    	return "registerSuccess";
		}
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(@PathParam("username") String username,
			@PathParam("password") String password,
			Model model,
			HttpServletRequest request){
		System.out.println("用户登录时调用:"+username+"--"+password);
		String jsonStr = null;
		//如果没有session则新建一个
		HttpSession session = request.getSession(true);
		//session.setAttribute("logined", 0);
		User user = userService.selectUserByUsername(username);
		//System.out.println("user.getState():"+user.getState());
		if(user!=null){
			if(user.getState()==1){
				User user2 = userService.login(username, password);
				System.out.println("user2:"+user2);
				if(user2!=null){
					//登录验证成功
					//将用户信息存储在session中
					session.setAttribute("user", user2);
					session.setAttribute("userId", user2.getUserId());
					//说明用户已经登录状态码
					session.setAttribute("logined", 1);
					String logStatus = "true";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
				else{
					//密码输入错误
					String logStatus = "false";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
			} 
			if(user.getState()==0){
				//账号未激活
				String logStatus = "nonactivated";
				jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
				JSONArray json = JSONArray.fromObject(jsonStr);
				return json.toString();
				//model.addAttribute("msg", "账号未激活");
				//model.addAttribute("user",user);
			}
		}
		else{
			//该账户不存在
			String logStatus = "false";
			jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			return json.toString();
		}
		return null;
	}
	/**
	 * 后台登陆
	 * @param managerName
	 * @param managerPassword
	 * @param model
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/back/backLogin")
	public String backLogin(@PathParam("managerName") String managerName,
			@PathParam("managerPassword") String managerPassword,
			Model model,
			HttpServletRequest request){
		//System.out.println("用户登录时调用:"+username+"--"+password);
		String jsonStr = null;
		//如果没有session则新建一个
		HttpSession session = request.getSession(true);
		User user = userService.selectAdminByAdminName(managerName);
		if(user!=null){
			if(user.getState()==1){
				User user2 = userService.login(managerName, managerPassword);
				System.out.println("管理员账户:"+user2);
				if(user2!=null){
					//登录验证成功
					//将管理员信息存储在session中
					session.setAttribute("admin", user2);
					session.setAttribute("adminId", user2.getUserId());
					//说明管理员已经登录状态码
					session.setAttribute("adminLogined", 1);
					String logStatus = "true";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
				else{
					//密码输入错误
					String logStatus = "false";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
			} 
			
		}
		else{
			//该账户不存在
			String logStatus = "false";
			jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			return json.toString();
		}
		return null;
	}
	
	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginout(){
		SecurityUtils.getSubject().logout();
		return "redirect:index";
	}
	
	/**
	 * 管理员退出登录
	 * @return
	 */
	@RequestMapping("/back/loginout")
	public String adminloginout(){
		SecurityUtils.getSubject().logout();
		return "redirect:/back/index";
	}
	
	/**
	 * 获取用户主页信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/userinfo")
	public String userinfo(Model model,HttpSession session){
		//从session中获取userId
		int userId = (int)session.getAttribute("userId");
		User user = userService.findById(userId);
		Userinfo userinfo = userService.findUserinfoById(userId);
		//如果用户还没有填写个人资料，则创建默认的用户资料
		if(userinfo==null){
			userinfo = new Userinfo();
			userinfo.setUserAbout("<font style='color:gray;'>（默认签名）</font>欢迎来到smile博客！"
					+ "smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，"
					+ "给一些热爱写作的网友提供了一个很好的平台。");
			//用户邮箱默认为注册邮箱
			userinfo.setUserEmail(user.getEmail());
			//默认个人网址
			userinfo.setUserUrl("www.smileblog.com");
			//默认头像
			userinfo.setUserHeadImg("defaulthead.jpg");
			//年龄和得分为0
			userinfo.setUserAge(0);
			userinfo.setUserPoints(0);
			//默认昵称为登录账号
			userinfo.setUserNickname(user.getUsername());
			userinfo.setUserId(userId);
			//插入userinfo到数据库userinfo表中
			userService.insertUserinfo(userinfo);
		}
		//找到用户信息
		model.addAttribute("userinfo", userinfo);
		return "personCenter";
	}
	
	/**
	 * 修改用户资料
	 * @param nickname
	 * @param age
	 * @param email
	 * @param about
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/updateUserinfo")
	public String updateUserinfo(String nickname,int age,String email,String about,Model model,HttpSession session){
		//从session中获取userId
		int userId = (int)session.getAttribute("userId");
		//初始化userinfo
		Userinfo userinfo = new Userinfo();
		Userinfo userinfo2 = userService.findUserinfoById(userId);
		//如果之前userinfo表没有记录，则插入记录
		if(userinfo2==null){
			userinfo = new Userinfo(userId, nickname, age, email, "cdk1997.top", about, "defaulthead.jpg", 0);
			userService.insertUserinfo(userinfo);
		}
		//否则更新userinfo表
		else{
			userinfo = new Userinfo(userId, nickname, age, email, userinfo2.getUserUrl(), about, userinfo2.getUserHeadImg(), userinfo2.getUserPoints());
			userService.updateUserInfo(userinfo);
		}
		model.addAttribute("userinfo", userinfo);
		return "personCenter";
	}
	
	/**
	 * 显示用户头像信息
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/editHeadImg2")
	public String editHeadImg2(Model model,HttpSession session){
		//从session中获取userId
		int userId = (int)session.getAttribute("userId");
		User user = userService.findById(userId);
		//初始化userinfo
		Userinfo userinfo = new Userinfo();
		Userinfo userinfo2 = userService.findUserinfoById(userId);
		//如果之前userinfo表没有记录，则插入记录
				if(userinfo2==null){
					userinfo.setUserAbout("<font style='color:gray;'>（默认签名）</font>欢迎来到smile博客！"
							+ "smile博客是紧贴生活的小清新网站，近期上线的有奖科技博客更是受到了大家的热捧，"
							+ "给一些热爱写作的网友提供了一个很好的平台。");
					//用户邮箱默认为注册邮箱
					userinfo.setUserEmail(user.getEmail());
					userinfo.setUserUrl("www.smileblog.com");
					userinfo.setUserHeadImg("defaulthead.jpg");
					userinfo.setUserNickname(user.getUsername());
					userinfo.setUserId(userId);
					userService.insertUserinfo(userinfo);
				}
		model.addAttribute("userinfo", userinfo2);
		return "editHeadImg";
	}
	
	/**
	 * 上传用户头像
	 * @param headImgFile 用户上传的头像文件
	 * @param model
	 * @param session
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/uploadHeadImg", method = RequestMethod.POST, consumes = "multipart/form-data")
	public String uploadHeadImg(@RequestParam("headImgFile")MultipartFile headImgFile,Model model,HttpSession session) throws IllegalStateException, IOException{
		//从session中获取userId
		int userId = (int)session.getAttribute("userId");
		//保存数据库的路径  
	      String sqlPath = null;   
	      //定义文件保存的本地路径  
	      String localPath="E:\\Tomcat9.0\\source\\blog_cdk_img\\";  
	      //定义 文件名  
	      String filename=null;    
	      if(!headImgFile.isEmpty()){    
	          //生成uuid作为文件名称    
	          String uuid = Functions.getCode();    
	          //获得文件类型（可以判断如果不是图片，禁止上传）    
	          String contentType=headImgFile.getContentType();    
	          //获得文件后缀名   
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
	          //得到 文件名  
	          filename=uuid+"."+suffixName;   
	          System.out.println("生成的头像图片文件名为："+filename);  
	          //文件保存路径  
	          headImgFile.transferTo(new File(localPath+filename));    
	      }  
	      //把图片的相对路径保存至数据库  
	      sqlPath = filename; 
	      Userinfo userinfo = userService.findUserinfoById(userId);
	      userinfo.setUserHeadImg(sqlPath);
		  //更新数据库
	      userService.updateUserInfo(userinfo);
		model.addAttribute("userinfo", userinfo);
		return "editHeadImg";
	}
	
	/*********************后台操作start************/
	/**
	 * 分页查看所有用户
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/back/adminAllUser")
	public String adminAllUser(PageUtil pageUtil,Model model){
		
			ModelAndView modelAndView = new ModelAndView();
			//计算用户总数
			int userCount = userService.calAllUserAndAdminNum(); 
			if(pageUtil==null){
				pageUtil.setStart(0);
			}
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(8);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(8);
			//计算总页码数
			pageUtil.calPageCount(userCount, 8);
			//设置每页显示5个数据项
			pageUtil.setCount(8);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(userCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(userCount);
			System.out.println("userCount:"+userCount);
			System.out.println(pageUtil);
			List<User> users = userService.selectPageAllUser(pageUtil);
			
			model.addAttribute("users", users);
			//放入jsp路径
			modelAndView.setViewName("/back/adminAllUser");
			return "/back/adminAllUser";
	}
	
	@RequestMapping("/back/userinfo")
	public String backUserinfo(int userId, Model model){
		Userinfo userinfo = userService.findUserinfoById(userId);
		User user = userService.findById(userId);
		//如果用户还没有填写个人资料，提示没有创建个人资料
		if(userinfo==null){
			model.addAttribute("msg", "该用户尚未填写个人资料！");
		}
		else{
			//找到用户信息
			model.addAttribute("userinfo", userinfo);
		}
		model.addAttribute("user", user);
		return "/back/userinfo";
	}
	/*********************后台操作end************/
}
