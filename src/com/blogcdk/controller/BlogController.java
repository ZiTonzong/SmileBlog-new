package com.blogcdk.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.blogcdk.dao.UserMapper;
import com.blogcdk.model.AccessBlog;
import com.blogcdk.model.Blog;
import com.blogcdk.model.BlogDetail;
import com.blogcdk.model.Comment;
import com.blogcdk.model.Remark;
import com.blogcdk.model.Reply;
import com.blogcdk.model.ReplyDetail;
import com.blogcdk.model.User;
import com.blogcdk.model.Userinfo;
import com.blogcdk.service.BlogService;
import com.blogcdk.service.RemarkService;
import com.blogcdk.service.RepeatAccessBlog;
import com.blogcdk.service.UserService;
import com.blogcdk.util.Functions;
import com.blogcdk.util.PageUtil;
import com.sun.jmx.snmp.Timestamp;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * ���Ϳ�����
 * @author cdk
 * @date 2018��8��19��
 */

@Controller
public class BlogController {
	@Autowired
	BlogService blogService;
	@Autowired
	RepeatAccessBlog repeatAccessBlog;
	@Autowired
	RemarkService remarkService;
	@Autowired
	UserService userService;
	
	@RequestMapping("/index")
	public String index(Model model){
		try {
			//��ʾ����ҳ�Ƽ������м���ƪ����(���������ǳ�)
			List<BlogDetail> sciBlogDetailLast = blogService.selectBlogDetailByTime(0, 3);
			//��ʾ�ڿƼ����Ҳ���Ķ�����
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(0, 7);
			//��ʾ�ڿƼ����ײ���5ƪ�Ƽ����� recommend=1�Ƽ�   0û���Ƽ�λ
			List<Blog> sciBlogsRecommend = blogService.selectRecommendBlogs(1, 5);
			
			//10���ؼ��ʵ����������
			int[] number = new int[10];
			for (int i : number) {
				number[i] = 0;
			}
			//10���ؼ���
			String[] tenKeywords = {"��Ů","����","��Ц","�Ը�","���","����","����","����","����","����"};
			//�������������10���ؼ��ʶ�Ӧ������������������ʽ�ش���ǰ̨
			for (int i=0;i<10;i++) {
				number[i] = blogService.calBlogCountByKeywords(tenKeywords[i]);
			}
			
			//��á�ÿ��һЦ����Ŀ������Ц����Ц������
			List<BlogDetail> laughLast = blogService.selectBlogDetailByTime(2, 6);
			List<Blog> laughHot = blogService.selectBlogsByReadNum(2, 6);
			
			//��á����Ѷ��䡱��Ŀ�����º���������
			List<BlogDetail> earLast = blogService.selectBlogDetailByTime(3, 2);
			List<Blog> earHot = blogService.selectBlogsByReadNum(3, 1);
			
			model.addAttribute("sciBlogsLast", sciBlogDetailLast);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			model.addAttribute("sciBlogsRecommend", sciBlogsRecommend);
			model.addAttribute("number",number);
			model.addAttribute("laughLast",laughLast);
			model.addAttribute("laughHot",laughHot);
			model.addAttribute("earLast",earLast);
			model.addAttribute("earHot",earHot);
			return "smileindex";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	/**
	 * ����Ƽ��಩��
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/science")
	public String science(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//������Ƽ��಩������
			int blogCount = blogService.calBlogCountByCategory(0); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(5);
			//������ҳ����
			pageUtil.calPageCount(blogCount, 5);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(5);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(blogCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(0, pageUtil);
			
			//��ʾ���Ҳ���Ķ�����
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(0, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//����jsp·��
			modelAndView.setViewName("science");
			return "science";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	/**
	 * ��ʾ���ͷ��ࣺ��������
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/world")
	public String world(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//������Ƽ��಩������
			int blogCount = blogService.calBlogCountByCategory(1); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(5);
			//������ҳ����
			pageUtil.calPageCount(blogCount, 5);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(5);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(blogCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(1, pageUtil);
			
			//��ʾ���Ҳ���Ķ�����
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(1, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//����jsp·��
			modelAndView.setViewName("world");
			return "world";
		} catch (Exception e) {
			System.out.println(e);
			return "world";
		}
	}
	
	/**
	 * ��ʾ���ͷ��ࣺÿ��һЦ
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/smileDay")
	public String smileDay(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//������Ƽ��಩������
			int blogCount = blogService.calBlogCountByCategory(2); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(5);
			//������ҳ����
			pageUtil.calPageCount(blogCount, 5);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(5);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(blogCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(2, pageUtil);
			
			//��ʾ���Ҳ���Ķ�����
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(2, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//����jsp·��
			modelAndView.setViewName("smileDay");
			return "smileDay";
		} catch (Exception e) {
			System.out.println(e);
			return "smileDay";
		}
	}
	
	/**
	 * ��ʾ���ͷ��ࣺ���Ѷ���
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/ear")
	public String ear(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//������Ƽ��಩������
			int blogCount = blogService.calBlogCountByCategory(3); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(5);
			//������ҳ����
			pageUtil.calPageCount(blogCount, 5);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(5);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(blogCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(3, pageUtil);
			
			//��ʾ���Ҳ���Ķ�����
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(3, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//����jsp·��
			modelAndView.setViewName("ear");
			return "ear";
		} catch (Exception e) {
			System.out.println(e);
			return "ear";
		}
	}
	
	/**
	 * ��һƪ���ͣ��鿴��ϸ����
	 * @param blogDetail
	 * @param model
	 * @return
	 */
	@RequestMapping("/articles")
	public String articles(HttpServletRequest request,HttpSession session,@RequestParam("blogId")int blogId,Model model){
		/*try {*/
			System.out.println("blogId:"+blogId);
			BlogDetail blogDetail = blogService.findById(blogId);
			//��ȡ�û�ip
			String userIp = Functions.getIpAddr(request);
			
			 /* //��ȡ��ǰʱ��  !ע�⣺sql.date ֻ��java.sql.Date��java.util.Date 
			  * ���Ĳ�ͬ����java.sql.Dateֻ��¼���ڣ���û�о�����һ���ʱ�䡣���Ծ�����˵�������ǰ��2009-12-24 23:20��
			  * �㴴��һ��java.sql.Date ��ֻ����2009-12-24�����Ϣ��������Ҫ����ʱ�����JDBC������
			  * ��ʹ��java.sql.Timestamp���档
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			java.util.Date currentDate = sdf.parse(Functions.getNowTime());
			//��util.date ת����sql.date
			Date accessDate = new java.sql.Date(currentDate.getTime());*/
			java.sql.Date accessDate = new java.sql.Date(System.currentTimeMillis());
			//�����������֮ǰ���û������¼
			repeatAccessBlog.delAccessBlogByTime(accessDate);
			//�½������¼����
			AccessBlog accessBlog = new AccessBlog(0,0,"0.0.0.0",0,accessDate);
			accessBlog.setAccessTime(accessDate);
			accessBlog.setBlogId(blogId);
			//����û��Ѿ���¼
			if(session.getAttribute("logined")!=null){
				accessBlog.setUserId(((User)session.getAttribute("user")).getUserId());
			}
			accessBlog.setIp(userIp);
			//�鿴access_blog���Ƿ��Ѿ����û�ip�����û�id���������Ѿ��������ƪ�����ˣ�
			List<AccessBlog> accessBlogs = repeatAccessBlog.selectAccessBlogIdOrIp(accessBlog.getUserId(), accessBlog.getIp(),blogId);
			
				System.out.println("accessBlogs.size():"+accessBlogs.size());
			
			//���access_blog������¼���û�ip/�û�idС��5��,�ò��ĵ��Ķ���+1����ÿ���û�/ipÿ��������Ϊһƪ���¹���5���Ķ���
			if(accessBlogs.size()<2){
				blogDetail.setReadNum(blogDetail.getReadNum()+1);
			}
			//���û������¼����access_blog����
			repeatAccessBlog.insertAccessBlog(accessBlog);
			//���²������֣�����������ɣ�ÿ����һƪ����+5  �������Ķ���/10���ӻ���  �����ĵ�������*2���ӻ��֣��Լ����Լ��Ĳ������۳��⣬���۵Ļظ�����ͳ�ƣ�
			blogDetail.setUserPoints(blogService.calBlogCountByUser(blogDetail.getFromUserId())*5 + blogDetail.getReadNum()/10 + remarkService.calRemarkAndReplyByBlogId(blogDetail.getBlogId())*2);
			//System.out.println("blogDetail:"+blogDetail);
			//�����º���Ķ��� ����д�����ݿ���
			blogService.updateBlogReadNum(blogDetail.getReadNum(), blogDetail.getBlogId());
			userService.updateUserInfoPonits(blogDetail.getUserPoints(), blogDetail.getFromUserId());
			
			//��ʾ���Ҳ���Ķ�����
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(0, 7);
			//����ϲ��
			List<Blog> sciBlogsRecommend = blogService.selectRecommendBlogs(1, 4);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			model.addAttribute("sciBlogsRecommend", sciBlogsRecommend);
			model.addAttribute("remarkCount", remarkService.calRemarkAndReplyByBlogId(blogDetail.getBlogId()));
			model.addAttribute("blogDetail", blogDetail);
			
			/**
			 * ��ʾ��������
			 * ��ҳ��ʾ�������ݣ�ÿҳ5���������ҳֻ��Ҫ������ʾ5���������ݼ��ɣ���������comment()��������ajax�������
			 */
			List<Comment> comments = new ArrayList<Comment>();
			List<Remark> remarks = remarkService.selectRemarkByBlogId(blogId);
			System.out.println("remarks:"+remarks);
			//�����ۺͻظ����ݼ��뵽comments��
			/*if(remarks.size()>0){
				for (Remark remark : remarks) {
					List<ReplyDetail> replyDetails = new ArrayList<ReplyDetail>();
					List<Reply> replies = new ArrayList<Reply>();
					replies = remarkService.selectReplyByRemarkId(remark.getRemarkId());
					if(replies.size()>0)
					for (Reply reply : replies) {
						Userinfo userinfo1 = userService.findUserinfoById(reply.getFromUserId());//��ȡ�ظ��ߵ��ǳ�
						Userinfo userinfo2 = userService.findUserinfoById(reply.getToUserId());//��ȡ���ظ��ߵ��ǳ�
						System.out.println(reply);
						System.out.println("userinfo1:"+userinfo1);
						System.out.println("userinfo2:"+userinfo2);
						ReplyDetail replyDetail = new ReplyDetail(reply, userinfo1.getUserNickname(), userinfo1.getUserHeadImg(),userinfo2.getUserNickname());
						replyDetails.add(replyDetail);
					}
					Userinfo userinfo = userService.findUserinfoById(remark.getFromUserId());
					Comment comment = new Comment(remark,replyDetails,userinfo.getUserNickname(),userinfo.getUserHeadImg());
					comments.add(comment);
				}
			}*/
			addRemarkAndReplyToComment(remarks,comments);
			if(comments.size()>0){
				System.out.println("comments:"+comments);
				model.addAttribute("comments", comments);
				//�����ҳ��Ϣ
				int commentsCount = comments.size(); //��������
				PageUtil pageUtil = new PageUtil();
					pageUtil.setStart(0);
				if(pageUtil.getPageNo()!=0){
					pageUtil.calStartByPageNo(5);
				}
				//�������ǰҳ����
				pageUtil.calPageNoByStart(5);
				//������ҳ����
				pageUtil.calPageCount(commentsCount, 5);
				//����ÿҳ��ʾ5��������
				pageUtil.setCount(5);
				//�������ݸ���д��pageUtil
				pageUtil.setTotalCount(commentsCount);
				//��������һҳ�Ŀ�ʼ������
				pageUtil.caculateLast(commentsCount);
				model.addAttribute("pageUtil", pageUtil);
			}
			
			/**
			 * ��ʾ�������ݽ���
			 */
			return "article";
	}
	
	/**
	 * ajax��ҳ��ʾ������������
	 * @param bolgId
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/pageComment")
	@ResponseBody 
	public String pageComment(int blogId,int pageNo,Model model){
		//�������ƪ�����µ�����������
		List<Remark> remarks = remarkService.selectRemarkByBlogId(blogId);
		//���������
		if(remarks.size()>0){
			PageUtil pageUtil = new PageUtil();
			List<Comment> comments = new ArrayList<Comment>();
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(remarks.size());
			if(pageNo!=0){
				pageUtil.setPageNo(pageNo);
				pageUtil.calStartByPageNo(5);
			}
			//������ҳ����
			pageUtil.calPageCount(pageUtil.getTotalCount(),5);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(5);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(pageUtil.getTotalCount());
			List<Remark> remarks2 = remarkService.selectPageRemarkByBlogId(blogId, pageUtil);
			addRemarkAndReplyToComment(remarks2,comments);
			if(comments.size()>0){
				//��pageUtil comments����json�����з��ص�ǰ̨
				//String jsonStr =  "[{'pageUtil':'" + pageUtil + "},{'comments':'"+ comments + "'}]";
				//JSONArray json = JSONArray.fromObject(pageUtil);
				// json = JSONArray.fromObject(comments);
				JSONArray json = new JSONArray();
				JSONObject jobj1 = new JSONObject();
				JSONObject jobj2 = new JSONObject();
				jobj1.put("pageUtil", pageUtil);
				jobj2.put("comments", comments);
				json.put(jobj1);
				json.put(jobj2);
				//���䵽ǰ̨
				return json.toString();
			}
			System.out.println("comments:"+comments);
		}
		return null;
	}
	
	/**
	 * �ύ�û������µ����۵����ݿ�remark����
	 * @param user
	 * @param blogId
	 * @param remarkText
	 * @param model
	 * @return
	 */
	@RequestMapping("/submitRemark")
	@ResponseBody 
	public String submitRemark(int userId,int blogId,String remarkText,Model model){
		String jsonStr = null;
		System.out.println(userId);
		Remark remark = new Remark();
		remark.setBlogId(blogId);
		remark.setContent(remarkText);
		remark.setFromUserId(userId);
		remark.setTime(Functions.getNowTime());
		remarkService.insertRemark(remark);
		
		String subStatus = "true";
		jsonStr =  "[{'subStatus':'" + subStatus + "'}]";
		JSONArray json = JSONArray.fromObject(jsonStr);
		return json.toString();
	}
	
	/**
	 *����ظ�����ͼ�꣬ �ύ�û������µ����۵Ļظ������ݿ�reply����
	 * @param user
	 * @param blogId
	 * @param remarkText
	 * @param model
	 * @return
	 */
	@RequestMapping("/submitReply1")
	@ResponseBody 
	public String submitReply1(int fromUserId,int blogId,String content,int toUserId,int remarkId,Model model){
		String jsonStr = null;
		//System.out.println(userId);
		Reply reply = new Reply();
		reply.setBlogId(blogId);
		reply.setContent(content);
		reply.setFromUserId(fromUserId);
		reply.setRemarkId(remarkId);
		reply.setTime(Functions.getNowTime());
		reply.setToUserId(toUserId);
		remarkService.insertReply(reply);
		
		String subStatus = "true";
		jsonStr =  "[{'subStatus':'" + subStatus + "'}]";
		JSONArray json = JSONArray.fromObject(jsonStr);
		return json.toString();
	}
	
	
	
	
	/**
	 * �û�д����
	 * @param blogtitle
	 * @param blogDesc
	 * @param article
	 * @param categoryId
	 * @param coverImage
	 * @param model
	 * @param session
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value="/writeBlog", method = RequestMethod.POST, consumes = "multipart/form-data")
	public String writeBlog(String blogtitle,String blogDesc,String article,int categoryId,
			@RequestParam("coverImage")MultipartFile coverImage,Model model,HttpSession session) throws IllegalStateException, IOException{
		Blog blog = new Blog();
		if(blogDesc==null){
			blogDesc = "smile������������smile������������smile������������smil..";
		}
		//��session�л�ȡuserId
				int userId = (int)session.getAttribute("userId");
				//�������ݿ��·��  
			      String sqlPath = null;   
			      //�����ļ�����ı���·��  
			      String localPath="E:\\Tomcat9.0\\source\\blog_cdk_img\\";  
			      //���� �ļ���  
			      String filename=null;    
			      if(!coverImage.isEmpty()){    
			          //����uuid��Ϊ�ļ�����    
			          String uuid = Functions.getCode();    
			          //����ļ����ͣ������ж��������ͼƬ����ֹ�ϴ���    
			          String contentType=coverImage.getContentType();    
			          //����ļ���׺��   
			          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
			          //�õ� �ļ���  
			          filename=uuid+"."+suffixName;   
			          System.out.println("���ɵ�ͷ��ͼƬ�ļ���Ϊ��"+filename);  
			          //�ļ�����·��  
			          coverImage.transferTo(new File(localPath+filename));    
			      }
			      else{
			    	  filename = "default0.jpg";
			      }
			      //��ͼƬ�����·�����������ݿ�  
			      sqlPath = filename; 
			      blog = new Blog(0, blogtitle, blogDesc, article, Functions.getNowTime(), userId, categoryId, 0, sqlPath, 0);
			     System.out.println(blog);
			      blogService.writeBlog(blog);
			      model.addAttribute("msg", "�ύ�ɹ���");
			      return "writeBlog";
	}
	
	@RequestMapping("/myBlogs")
	public String myBlogs(PageUtil pageUtil,Model model,HttpSession session){
			ModelAndView modelAndView = new ModelAndView();
			//����û���δ��¼
			if(session.getAttribute("logined")==null){
				model.addAttribute("msg", "�û�δ��¼��");
			}
			else{
				int userId = (int)session.getAttribute("userId");
				//������Ƽ��಩������
				int blogCount = blogService.calBlogCountByUser(userId); 
				if(pageUtil==null){
					pageUtil.setStart(0);
				}
				if(pageUtil.getPageNo()!=0){
					pageUtil.calStartByPageNo(8);
				}
				//�������ǰҳ����
				pageUtil.calPageNoByStart(8);
				//������ҳ����
				pageUtil.calPageCount(blogCount, 8);
				//����ÿҳ��ʾ5��������
				pageUtil.setCount(8);
				//�������ݸ���д��pageUtil
				pageUtil.setTotalCount(blogCount);
				//��������һҳ�Ŀ�ʼ������
				pageUtil.caculateLast(blogCount);
				System.out.println("blogCount:"+blogCount);
				System.out.println(pageUtil);
				List<Blog> Blogs = blogService.selectPageBlogsByUserId(userId, pageUtil);
				System.out.println(Blogs);
				model.addAttribute("Blogs", Blogs);
			}
			
			//����jsp·��
			modelAndView.setViewName("myBlogs");
			return "myBlogs";
	}
	
	
	
	/*********************��̨������ʼ************/
	 
	/**
	 * ��ҳ�鿴���в���
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/back/adminAllBlogs")
	public String adminAllBlogs(PageUtil pageUtil,Model model){
		
			ModelAndView modelAndView = new ModelAndView();
			//���㲩������
			int blogCount = blogService.calBlogsNum(); 
			if(pageUtil==null){
				pageUtil.setStart(0);
			}
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(8);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(8);
			//������ҳ����
			pageUtil.calPageCount(blogCount, 8);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(8);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(blogCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> blogDetails = blogService.selectAllBlogDetail(pageUtil);
			
			model.addAttribute("blogDetails", blogDetails);
			//����jsp·��
			modelAndView.setViewName("/back/adminAllBlogs");
			return "/back/adminAllBlogs";
	}
	
	/**
	 * ��̨��ҳ��ʾ�����û����ۣ����������µ����ۺͶ����۵Ļظ���
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/back/adminAllComments")
	public String adminAllComments(PageUtil pageUtil,Model model){
		ModelAndView modelAndView = new ModelAndView();
		//�������ƪ�����µ�����������
		List<Remark> remarks = remarkService.selectAllRemarks();
		//���������
		if(remarks.size()>0){
			List<Comment> comments = new ArrayList<Comment>();
			int remarkCount = remarks.size();
			if(pageUtil==null){
				pageUtil.setStart(0);
			}
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//�������ǰҳ����
			pageUtil.calPageNoByStart(5);
			//������ҳ����
			pageUtil.calPageCount(remarkCount, 5);
			//����ÿҳ��ʾ5��������
			pageUtil.setCount(5);
			//�������ݸ���д��pageUtil
			pageUtil.setTotalCount(remarkCount);
			//��������һҳ�Ŀ�ʼ������
			pageUtil.caculateLast(remarkCount);
			System.out.println("remarkCount:"+remarkCount);
			System.out.println(pageUtil);
			List<Remark> remarks2 = remarkService.selectPageRemarks(pageUtil);
			addRemarkAndReplyToComment(remarks2,comments);
			
			model.addAttribute("comments", comments);
			model.addAttribute("pageUtil", pageUtil);
			//����jsp·��
			modelAndView.setViewName("/back/adminAllComments");
			System.out.println("comments:"+comments);
		}
		return "/back/adminAllComments";
	}
	
	/*********************��̨����end************/
	
	
	/**
	 * ����һƪ�����µ����ۻ�ȡ���Ӧ�Ļظ�������ȫ������comments������
	 * @param remarks
	 * @param comments
	 */
	public void addRemarkAndReplyToComment(List<Remark> remarks,List<Comment> comments){
		//�����ۺͻظ����ݼ��뵽comments��
		if(remarks.size()>0){
			for (Remark remark : remarks) {
				List<ReplyDetail> replyDetails = new ArrayList<ReplyDetail>();
				List<Reply> replies = new ArrayList<Reply>();
				replies = remarkService.selectReplyByRemarkId(remark.getRemarkId());
				if(replies.size()>0)
				for (Reply reply : replies) {
					Userinfo userinfo1 = userService.findUserinfoById(reply.getFromUserId());//��ȡ�ظ��ߵ��ǳ�
					Userinfo userinfo2 = userService.findUserinfoById(reply.getToUserId());//��ȡ���ظ��ߵ��ǳ�
					//System.out.println(reply);
					//System.out.println("userinfo1:"+userinfo1);
					//System.out.println("userinfo2:"+userinfo2);
					ReplyDetail replyDetail = new ReplyDetail(reply, userinfo1.getUserNickname(), userinfo1.getUserHeadImg(),userinfo2.getUserNickname());
					replyDetails.add(replyDetail);
				}
				Userinfo userinfo = userService.findUserinfoById(remark.getFromUserId());
				Comment comment = new Comment(remark,replyDetails,userinfo.getUserNickname(),userinfo.getUserHeadImg());
				comments.add(comment);
			}
		}
	}
	
}
