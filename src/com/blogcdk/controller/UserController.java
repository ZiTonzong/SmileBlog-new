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
		System.out.println("�û�ע�����username:"+user.getUsername()+" password:"+user.getPassword()+" email:"+user.getEmail());
		List<User> userList = userService.selectUserByUsernameOfReg(user.getUsername());
		System.out.println("userList.size():"+userList.size());
		String jsonStr = null; 
		if(userList.size()==0){
			if(user.getPassword()!=null && user.getUsername()!=null && user.getEmail()!=null){
				//����GravatarͼƬ����
				String gravatarImg = Functions.getGravatar(user.getEmail());
				//���ü�����code
				String code = Functions.getCode()+Functions.getCode();
				user.setGravatarImg(gravatarImg);
				user.setCode(code);
				user.setState(0);//Ĭ��Ϊ0,,����Ϊ1
				userService.insertUser(user);
				Functions.sendMail(user.getEmail(), code);
				model.addAttribute("msg","ע��ɹ�,�����ʼ��Ѿ����͵����������뼰ʱ����!");
			}
			
			String regStatus = "regSuccess";
			jsonStr =  "[{'regStatus':'" + regStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			return json.toString();
		}else{
			String regStatus = "hasThisUser";
			jsonStr =  "[{'regStatus':'" + regStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			model.addAttribute("msg","�û������ڣ�ע��ʧ��");
			return json.toString();
		}
	}
	
	/**
	 * �û��˺ż���
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
		    	model.addAttribute("msg","�˺ż���ɹ�!");
		    	return "registerSuccess";
		    }else{
		    	model.addAttribute("msg","�˺ż���ʧ��!");
		    	return "registerSuccess";
		    }
		}else{
			
			model.addAttribute("msg","�˺ż����벻����!");
	    	return "registerSuccess";
		}
	}
	
	@ResponseBody
	@RequestMapping("/login")
	public String login(@PathParam("username") String username,
			@PathParam("password") String password,
			Model model,
			HttpServletRequest request){
		System.out.println("�û���¼ʱ����:"+username+"--"+password);
		String jsonStr = null;
		//���û��session���½�һ��
		HttpSession session = request.getSession(true);
		//session.setAttribute("logined", 0);
		User user = userService.selectUserByUsername(username);
		//System.out.println("user.getState():"+user.getState());
		if(user!=null){
			if(user.getState()==1){
				User user2 = userService.login(username, password);
				System.out.println("user2:"+user2);
				if(user2!=null){
					//��¼��֤�ɹ�
					//���û���Ϣ�洢��session��
					session.setAttribute("user", user2);
					session.setAttribute("userId", user2.getUserId());
					//˵���û��Ѿ���¼״̬��
					session.setAttribute("logined", 1);
					String logStatus = "true";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
				else{
					//�����������
					String logStatus = "false";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
			} 
			if(user.getState()==0){
				//�˺�δ����
				String logStatus = "nonactivated";
				jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
				JSONArray json = JSONArray.fromObject(jsonStr);
				return json.toString();
				//model.addAttribute("msg", "�˺�δ����");
				//model.addAttribute("user",user);
			}
		}
		else{
			//���˻�������
			String logStatus = "false";
			jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			return json.toString();
		}
		return null;
	}
	/**
	 * ��̨��½
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
		//System.out.println("�û���¼ʱ����:"+username+"--"+password);
		String jsonStr = null;
		//���û��session���½�һ��
		HttpSession session = request.getSession(true);
		User user = userService.selectAdminByAdminName(managerName);
		if(user!=null){
			if(user.getState()==1){
				User user2 = userService.login(managerName, managerPassword);
				System.out.println("����Ա�˻�:"+user2);
				if(user2!=null){
					//��¼��֤�ɹ�
					//������Ա��Ϣ�洢��session��
					session.setAttribute("admin", user2);
					session.setAttribute("adminId", user2.getUserId());
					//˵������Ա�Ѿ���¼״̬��
					session.setAttribute("adminLogined", 1);
					String logStatus = "true";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
				else{
					//�����������
					String logStatus = "false";
					jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
					JSONArray json = JSONArray.fromObject(jsonStr);
					return json.toString();
				}
			} 
			
		}
		else{
			//���˻�������
			String logStatus = "false";
			jsonStr =  "[{'logStatus':'" + logStatus + "'}]";
			JSONArray json = JSONArray.fromObject(jsonStr);
			return json.toString();
		}
		return null;
	}
	
	/**
	 * �˳���¼
	 * @return
	 */
	@RequestMapping("/loginout")
	public String loginout(){
		SecurityUtils.getSubject().logout();
		return "redirect:index";
	}
	
	/**
	 * ����Ա�˳���¼
	 * @return
	 */
	@RequestMapping("/back/loginout")
	public String adminloginout(){
		SecurityUtils.getSubject().logout();
		return "redirect:/back/index";
	}
	
	/**
	 * ��ȡ�û���ҳ��Ϣ
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/userinfo")
	public String userinfo(Model model,HttpSession session){
		//��session�л�ȡuserId
		int userId = (int)session.getAttribute("userId");
		User user = userService.findById(userId);
		Userinfo userinfo = userService.findUserinfoById(userId);
		//����û���û����д�������ϣ��򴴽�Ĭ�ϵ��û�����
		if(userinfo==null){
			userinfo = new Userinfo();
			userinfo.setUserAbout("<font style='color:gray;'>��Ĭ��ǩ����</font>��ӭ����smile���ͣ�"
					+ "smile�����ǽ��������С������վ���������ߵ��н��Ƽ����͸����ܵ��˴�ҵ�������"
					+ "��һЩ�Ȱ�д���������ṩ��һ���ܺõ�ƽ̨��");
			//�û�����Ĭ��Ϊע������
			userinfo.setUserEmail(user.getEmail());
			//Ĭ�ϸ�����ַ
			userinfo.setUserUrl("www.smileblog.com");
			//Ĭ��ͷ��
			userinfo.setUserHeadImg("defaulthead.jpg");
			//����͵÷�Ϊ0
			userinfo.setUserAge(0);
			userinfo.setUserPoints(0);
			//Ĭ���ǳ�Ϊ��¼�˺�
			userinfo.setUserNickname(user.getUsername());
			userinfo.setUserId(userId);
			//����userinfo�����ݿ�userinfo����
			userService.insertUserinfo(userinfo);
		}
		//�ҵ��û���Ϣ
		model.addAttribute("userinfo", userinfo);
		return "personCenter";
	}
	
	/**
	 * �޸��û�����
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
		//��session�л�ȡuserId
		int userId = (int)session.getAttribute("userId");
		//��ʼ��userinfo
		Userinfo userinfo = new Userinfo();
		Userinfo userinfo2 = userService.findUserinfoById(userId);
		//���֮ǰuserinfo��û�м�¼��������¼
		if(userinfo2==null){
			userinfo = new Userinfo(userId, nickname, age, email, "cdk1997.top", about, "defaulthead.jpg", 0);
			userService.insertUserinfo(userinfo);
		}
		//�������userinfo��
		else{
			userinfo = new Userinfo(userId, nickname, age, email, userinfo2.getUserUrl(), about, userinfo2.getUserHeadImg(), userinfo2.getUserPoints());
			userService.updateUserInfo(userinfo);
		}
		model.addAttribute("userinfo", userinfo);
		return "personCenter";
	}
	
	/**
	 * ��ʾ�û�ͷ����Ϣ
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/editHeadImg2")
	public String editHeadImg2(Model model,HttpSession session){
		//��session�л�ȡuserId
		int userId = (int)session.getAttribute("userId");
		User user = userService.findById(userId);
		//��ʼ��userinfo
		Userinfo userinfo = new Userinfo();
		Userinfo userinfo2 = userService.findUserinfoById(userId);
		//���֮ǰuserinfo��û�м�¼��������¼
				if(userinfo2==null){
					userinfo.setUserAbout("<font style='color:gray;'>��Ĭ��ǩ����</font>��ӭ����smile���ͣ�"
							+ "smile�����ǽ��������С������վ���������ߵ��н��Ƽ����͸����ܵ��˴�ҵ�������"
							+ "��һЩ�Ȱ�д���������ṩ��һ���ܺõ�ƽ̨��");
					//�û�����Ĭ��Ϊע������
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
	 * �ϴ��û�ͷ��
	 * @param headImgFile �û��ϴ���ͷ���ļ�
	 * @param model
	 * @param session
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping(value="/uploadHeadImg", method = RequestMethod.POST, consumes = "multipart/form-data")
	public String uploadHeadImg(@RequestParam("headImgFile")MultipartFile headImgFile,Model model,HttpSession session) throws IllegalStateException, IOException{
		//��session�л�ȡuserId
		int userId = (int)session.getAttribute("userId");
		//�������ݿ��·��  
	      String sqlPath = null;   
	      //�����ļ�����ı���·��  
	      String localPath="E:\\Tomcat9.0\\source\\blog_cdk_img\\";  
	      //���� �ļ���  
	      String filename=null;    
	      if(!headImgFile.isEmpty()){    
	          //����uuid��Ϊ�ļ�����    
	          String uuid = Functions.getCode();    
	          //����ļ����ͣ������ж��������ͼƬ����ֹ�ϴ���    
	          String contentType=headImgFile.getContentType();    
	          //����ļ���׺��   
	          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
	          //�õ� �ļ���  
	          filename=uuid+"."+suffixName;   
	          System.out.println("���ɵ�ͷ��ͼƬ�ļ���Ϊ��"+filename);  
	          //�ļ�����·��  
	          headImgFile.transferTo(new File(localPath+filename));    
	      }  
	      //��ͼƬ�����·�����������ݿ�  
	      sqlPath = filename; 
	      Userinfo userinfo = userService.findUserinfoById(userId);
	      userinfo.setUserHeadImg(sqlPath);
		  //�������ݿ�
	      userService.updateUserInfo(userinfo);
		model.addAttribute("userinfo", userinfo);
		return "editHeadImg";
	}
	
	/*********************��̨����start************/
	/**
	 * ��ҳ�鿴�����û�
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/back/adminAllUser")
	public String adminAllUser(PageUtil pageUtil,Model model){
		
			ModelAndView modelAndView = new ModelAndView();
			//�����û�����
			int userCount = userService.calAllUserAndAdminNum(); 
			if(pageUtil==null){
				pageUtil.setStart(0);
			}
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(8);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(8);
			//������ҳ����
			pageUtil.calPageCount(userCount, 8);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(8);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(userCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(userCount);
			System.out.println("userCount:"+userCount);
			System.out.println(pageUtil);
			List<User> users = userService.selectPageAllUser(pageUtil);
			
			model.addAttribute("users", users);
			//����jsp·��
			modelAndView.setViewName("/back/adminAllUser");
			return "/back/adminAllUser";
	}
	
	@RequestMapping("/back/userinfo")
	public String backUserinfo(int userId, Model model){
		Userinfo userinfo = userService.findUserinfoById(userId);
		User user = userService.findById(userId);
		//����û���û����д�������ϣ���ʾû�д�����������
		if(userinfo==null){
			model.addAttribute("msg", "���û���δ��д�������ϣ�");
		}
		else{
			//�ҵ��û���Ϣ
			model.addAttribute("userinfo", userinfo);
		}
		model.addAttribute("user", user);
		return "/back/userinfo";
	}
	/*********************��̨����end************/
}
