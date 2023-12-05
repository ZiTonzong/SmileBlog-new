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
 * 博客控制器
 * @author cdk
 * @date 2018年8月19日
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
			//显示在首页科技栏的中间三篇博文(包括作者昵称)
			List<BlogDetail> sciBlogDetailLast = blogService.selectBlogDetailByTime(0, 3);
			//显示在科技栏右侧的阅读排行
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(0, 7);
			//显示在科技栏底部的5篇推荐博文 recommend=1推荐   0没有推荐位
			List<Blog> sciBlogsRecommend = blogService.selectRecommendBlogs(1, 5);
			
			//10个关键词的搜索结果数
			int[] number = new int[10];
			for (int i : number) {
				number[i] = 0;
			}
			//10个关键词
			String[] tenKeywords = {"美女","旅行","搞笑","性感","情感","艺术","漫画","超萌","回忆","清新"};
			//倾听世界栏里的10个关键词对应的搜索结果以数组的形式回传给前台
			for (int i=0;i<10;i++) {
				number[i] = blogService.calBlogCountByKeywords(tenKeywords[i]);
			}
			
			//获得“每日一笑”栏目的最新笑话和笑话排行
			List<BlogDetail> laughLast = blogService.selectBlogDetailByTime(2, 6);
			List<Blog> laughHot = blogService.selectBlogsByReadNum(2, 6);
			
			//获得“叫醒耳朵”栏目的最新和热门文章
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
	 * 处理科技类博客
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/science")
	public String science(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//计算出科技类博客总数
			int blogCount = blogService.calBlogCountByCategory(0); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(5);
			//计算总页码数
			pageUtil.calPageCount(blogCount, 5);
			//设置每页显示5个数据项
			pageUtil.setCount(5);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(blogCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(0, pageUtil);
			
			//显示在右侧的阅读排行
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(0, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//放入jsp路径
			modelAndView.setViewName("science");
			return "science";
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	/**
	 * 显示博客分类：倾听世界
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/world")
	public String world(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//计算出科技类博客总数
			int blogCount = blogService.calBlogCountByCategory(1); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(5);
			//计算总页码数
			pageUtil.calPageCount(blogCount, 5);
			//设置每页显示5个数据项
			pageUtil.setCount(5);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(blogCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(1, pageUtil);
			
			//显示在右侧的阅读排行
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(1, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//放入jsp路径
			modelAndView.setViewName("world");
			return "world";
		} catch (Exception e) {
			System.out.println(e);
			return "world";
		}
	}
	
	/**
	 * 显示博客分类：每日一笑
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/smileDay")
	public String smileDay(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//计算出科技类博客总数
			int blogCount = blogService.calBlogCountByCategory(2); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(5);
			//计算总页码数
			pageUtil.calPageCount(blogCount, 5);
			//设置每页显示5个数据项
			pageUtil.setCount(5);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(blogCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(2, pageUtil);
			
			//显示在右侧的阅读排行
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(2, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//放入jsp路径
			modelAndView.setViewName("smileDay");
			return "smileDay";
		} catch (Exception e) {
			System.out.println(e);
			return "smileDay";
		}
	}
	
	/**
	 * 显示博客分类：叫醒耳朵
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/ear")
	public String ear(PageUtil pageUtil,Model model){
		try {
			ModelAndView modelAndView = new ModelAndView();
			//计算出科技类博客总数
			int blogCount = blogService.calBlogCountByCategory(3); 
			/*if(pageUtil==null){
				pageUtil.setStart(0);
			}*/
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(5);
			//计算总页码数
			pageUtil.calPageCount(blogCount, 5);
			//设置每页显示5个数据项
			pageUtil.setCount(5);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(blogCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> sciBlog = blogService.selectPageCategoryBlogs(3, pageUtil);
			
			//显示在右侧的阅读排行
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(3, 10);
			
			model.addAttribute("sciBlog", sciBlog);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			//放入jsp路径
			modelAndView.setViewName("ear");
			return "ear";
		} catch (Exception e) {
			System.out.println(e);
			return "ear";
		}
	}
	
	/**
	 * 打开一篇博客，查看详细内容
	 * @param blogDetail
	 * @param model
	 * @return
	 */
	@RequestMapping("/articles")
	public String articles(HttpServletRequest request,HttpSession session,@RequestParam("blogId")int blogId,Model model){
		/*try {*/
			System.out.println("blogId:"+blogId);
			BlogDetail blogDetail = blogService.findById(blogId);
			//获取用户ip
			String userIp = Functions.getIpAddr(request);
			
			 /* //获取当前时间  !注意：sql.date 只能java.sql.Date和java.util.Date 
			  * 最大的不同在于java.sql.Date只记录日期，而没有具体这一天的时间。所以举例来说，如果当前是2009-12-24 23:20，
			  * 你创建一个java.sql.Date 将只记下2009-12-24这个信息。若你需要保留时间进行JDBC操作，
			  * 请使用java.sql.Timestamp代替。
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			java.util.Date currentDate = sdf.parse(Functions.getNowTime());
			//将util.date 转化成sql.date
			Date accessDate = new java.sql.Date(currentDate.getTime());*/
			java.sql.Date accessDate = new java.sql.Date(System.currentTimeMillis());
			//首先清除当天之前的用户浏览记录
			repeatAccessBlog.delAccessBlogByTime(accessDate);
			//新建浏览记录对象
			AccessBlog accessBlog = new AccessBlog(0,0,"0.0.0.0",0,accessDate);
			accessBlog.setAccessTime(accessDate);
			accessBlog.setBlogId(blogId);
			//如果用户已经登录
			if(session.getAttribute("logined")!=null){
				accessBlog.setUserId(((User)session.getAttribute("user")).getUserId());
			}
			accessBlog.setIp(userIp);
			//查看access_blog表是否已经有用户ip或者用户id（即今天已经浏览过本篇文章了）
			List<AccessBlog> accessBlogs = repeatAccessBlog.selectAccessBlogIdOrIp(accessBlog.getUserId(), accessBlog.getIp(),blogId);
			
				System.out.println("accessBlogs.size():"+accessBlogs.size());
			
			//如果access_blog表所记录的用户ip/用户id小于5次,该博文的阅读量+1（即每个用户/ip每天最多可以为一篇文章贡献5个阅读数
			if(accessBlogs.size()<2){
				blogDetail.setReadNum(blogDetail.getReadNum()+1);
			}
			//将用户浏览记录存入access_blog表中
			repeatAccessBlog.insertAccessBlog(accessBlog);
			//更新博主积分，博主积分组成：每发表一篇博文+5  按博文阅读数/10增加积分  按博文的评论数*2增加积分（自己给自己的博文评论除外，评论的回复数不统计）
			blogDetail.setUserPoints(blogService.calBlogCountByUser(blogDetail.getFromUserId())*5 + blogDetail.getReadNum()/10 + remarkService.calRemarkAndReplyByBlogId(blogDetail.getBlogId())*2);
			//System.out.println("blogDetail:"+blogDetail);
			//将更新后的阅读数 积分写入数据库中
			blogService.updateBlogReadNum(blogDetail.getReadNum(), blogDetail.getBlogId());
			userService.updateUserInfoPonits(blogDetail.getUserPoints(), blogDetail.getFromUserId());
			
			//显示在右侧的阅读排行
			List<Blog> sciBlogsHot = blogService.selectBlogsByReadNum(0, 7);
			//猜你喜欢
			List<Blog> sciBlogsRecommend = blogService.selectRecommendBlogs(1, 4);
			model.addAttribute("sciBlogsHot", sciBlogsHot);
			model.addAttribute("sciBlogsRecommend", sciBlogsRecommend);
			model.addAttribute("remarkCount", remarkService.calRemarkAndReplyByBlogId(blogDetail.getBlogId()));
			model.addAttribute("blogDetail", blogDetail);
			
			/**
			 * 显示评论内容
			 * 分页显示评论内容，每页5个，因而首页只需要考虑显示5条评论内容即可，其他的有comment()方法采用ajax接收完成
			 */
			List<Comment> comments = new ArrayList<Comment>();
			List<Remark> remarks = remarkService.selectRemarkByBlogId(blogId);
			System.out.println("remarks:"+remarks);
			//将评论和回复内容加入到comments中
			/*if(remarks.size()>0){
				for (Remark remark : remarks) {
					List<ReplyDetail> replyDetails = new ArrayList<ReplyDetail>();
					List<Reply> replies = new ArrayList<Reply>();
					replies = remarkService.selectReplyByRemarkId(remark.getRemarkId());
					if(replies.size()>0)
					for (Reply reply : replies) {
						Userinfo userinfo1 = userService.findUserinfoById(reply.getFromUserId());//获取回复者的昵称
						Userinfo userinfo2 = userService.findUserinfoById(reply.getToUserId());//获取被回复者的昵称
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
				//加入分页信息
				int commentsCount = comments.size(); //评论条数
				PageUtil pageUtil = new PageUtil();
					pageUtil.setStart(0);
				if(pageUtil.getPageNo()!=0){
					pageUtil.calStartByPageNo(5);
				}
				//计算出当前页码数
				pageUtil.calPageNoByStart(5);
				//计算总页码数
				pageUtil.calPageCount(commentsCount, 5);
				//设置每页显示5个数据项
				pageUtil.setCount(5);
				//将总数据个数写入pageUtil
				pageUtil.setTotalCount(commentsCount);
				//计算出最后一页的开始数据项
				pageUtil.caculateLast(commentsCount);
				model.addAttribute("pageUtil", pageUtil);
			}
			
			/**
			 * 显示评论内容结束
			 */
			return "article";
	}
	
	/**
	 * ajax分页显示文章评论内容
	 * @param bolgId
	 * @param pageNo
	 * @param model
	 * @return
	 */
	@RequestMapping("/pageComment")
	@ResponseBody 
	public String pageComment(int blogId,int pageNo,Model model){
		//计算出这篇文章下的所有评论数
		List<Remark> remarks = remarkService.selectRemarkByBlogId(blogId);
		//如果有评论
		if(remarks.size()>0){
			PageUtil pageUtil = new PageUtil();
			List<Comment> comments = new ArrayList<Comment>();
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(remarks.size());
			if(pageNo!=0){
				pageUtil.setPageNo(pageNo);
				pageUtil.calStartByPageNo(5);
			}
			//计算总页码数
			pageUtil.calPageCount(pageUtil.getTotalCount(),5);
			//设置每页显示5个数据项
			pageUtil.setCount(5);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(pageUtil.getTotalCount());
			List<Remark> remarks2 = remarkService.selectPageRemarkByBlogId(blogId, pageUtil);
			addRemarkAndReplyToComment(remarks2,comments);
			if(comments.size()>0){
				//将pageUtil comments加入json数组中返回到前台
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
				//传输到前台
				return json.toString();
			}
			System.out.println("comments:"+comments);
		}
		return null;
	}
	
	/**
	 * 提交用户对文章的评论到数据库remark表中
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
	 *点击回复评论图标， 提交用户对文章的评论的回复到数据库reply表中
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
	 * 用户写博客
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
			blogDesc = "smile博客描述描述smile博客描述描述smile博客描述描述smil..";
		}
		//从session中获取userId
				int userId = (int)session.getAttribute("userId");
				//保存数据库的路径  
			      String sqlPath = null;   
			      //定义文件保存的本地路径  
			      String localPath="E:\\Tomcat9.0\\source\\blog_cdk_img\\";  
			      //定义 文件名  
			      String filename=null;    
			      if(!coverImage.isEmpty()){    
			          //生成uuid作为文件名称    
			          String uuid = Functions.getCode();    
			          //获得文件类型（可以判断如果不是图片，禁止上传）    
			          String contentType=coverImage.getContentType();    
			          //获得文件后缀名   
			          String suffixName=contentType.substring(contentType.indexOf("/")+1);  
			          //得到 文件名  
			          filename=uuid+"."+suffixName;   
			          System.out.println("生成的头像图片文件名为："+filename);  
			          //文件保存路径  
			          coverImage.transferTo(new File(localPath+filename));    
			      }
			      else{
			    	  filename = "default0.jpg";
			      }
			      //把图片的相对路径保存至数据库  
			      sqlPath = filename; 
			      blog = new Blog(0, blogtitle, blogDesc, article, Functions.getNowTime(), userId, categoryId, 0, sqlPath, 0);
			     System.out.println(blog);
			      blogService.writeBlog(blog);
			      model.addAttribute("msg", "提交成功！");
			      return "writeBlog";
	}
	
	@RequestMapping("/myBlogs")
	public String myBlogs(PageUtil pageUtil,Model model,HttpSession session){
			ModelAndView modelAndView = new ModelAndView();
			//如果用户尚未登录
			if(session.getAttribute("logined")==null){
				model.addAttribute("msg", "用户未登录！");
			}
			else{
				int userId = (int)session.getAttribute("userId");
				//计算出科技类博客总数
				int blogCount = blogService.calBlogCountByUser(userId); 
				if(pageUtil==null){
					pageUtil.setStart(0);
				}
				if(pageUtil.getPageNo()!=0){
					pageUtil.calStartByPageNo(8);
				}
				//计算出当前页码数
				pageUtil.calPageNoByStart(8);
				//计算总页码数
				pageUtil.calPageCount(blogCount, 8);
				//设置每页显示5个数据项
				pageUtil.setCount(8);
				//将总数据个数写入pageUtil
				pageUtil.setTotalCount(blogCount);
				//计算出最后一页的开始数据项
				pageUtil.caculateLast(blogCount);
				System.out.println("blogCount:"+blogCount);
				System.out.println(pageUtil);
				List<Blog> Blogs = blogService.selectPageBlogsByUserId(userId, pageUtil);
				System.out.println(Blogs);
				model.addAttribute("Blogs", Blogs);
			}
			
			//放入jsp路径
			modelAndView.setViewName("myBlogs");
			return "myBlogs";
	}
	
	
	
	/*********************后台操作开始************/
	 
	/**
	 * 分页查看所有博客
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/back/adminAllBlogs")
	public String adminAllBlogs(PageUtil pageUtil,Model model){
		
			ModelAndView modelAndView = new ModelAndView();
			//计算博客总数
			int blogCount = blogService.calBlogsNum(); 
			if(pageUtil==null){
				pageUtil.setStart(0);
			}
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(8);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(8);
			//计算总页码数
			pageUtil.calPageCount(blogCount, 8);
			//设置每页显示5个数据项
			pageUtil.setCount(8);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(blogCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(blogCount);
			System.out.println("blogCount:"+blogCount);
			System.out.println(pageUtil);
			List<BlogDetail> blogDetails = blogService.selectAllBlogDetail(pageUtil);
			
			model.addAttribute("blogDetails", blogDetails);
			//放入jsp路径
			modelAndView.setViewName("/back/adminAllBlogs");
			return "/back/adminAllBlogs";
	}
	
	/**
	 * 后台分页显示所有用户评价（包括对文章的评论和对评论的回复）
	 * @param pageUtil
	 * @param model
	 * @return
	 */
	@RequestMapping("/back/adminAllComments")
	public String adminAllComments(PageUtil pageUtil,Model model){
		ModelAndView modelAndView = new ModelAndView();
		//计算出这篇文章下的所有评论数
		List<Remark> remarks = remarkService.selectAllRemarks();
		//如果有评论
		if(remarks.size()>0){
			List<Comment> comments = new ArrayList<Comment>();
			int remarkCount = remarks.size();
			if(pageUtil==null){
				pageUtil.setStart(0);
			}
			if(pageUtil.getPageNo()!=0){
				pageUtil.calStartByPageNo(5);
			}
			//计算出当前页码数
			pageUtil.calPageNoByStart(5);
			//计算总页码数
			pageUtil.calPageCount(remarkCount, 5);
			//设置每页显示5个数据项
			pageUtil.setCount(5);
			//将总数据个数写入pageUtil
			pageUtil.setTotalCount(remarkCount);
			//计算出最后一页的开始数据项
			pageUtil.caculateLast(remarkCount);
			System.out.println("remarkCount:"+remarkCount);
			System.out.println(pageUtil);
			List<Remark> remarks2 = remarkService.selectPageRemarks(pageUtil);
			addRemarkAndReplyToComment(remarks2,comments);
			
			model.addAttribute("comments", comments);
			model.addAttribute("pageUtil", pageUtil);
			//放入jsp路径
			modelAndView.setViewName("/back/adminAllComments");
			System.out.println("comments:"+comments);
		}
		return "/back/adminAllComments";
	}
	
	/*********************后台操作end************/
	
	
	/**
	 * 根据一篇博客下的评论获取其对应的回复并将其全部加入comments对象中
	 * @param remarks
	 * @param comments
	 */
	public void addRemarkAndReplyToComment(List<Remark> remarks,List<Comment> comments){
		//将评论和回复内容加入到comments中
		if(remarks.size()>0){
			for (Remark remark : remarks) {
				List<ReplyDetail> replyDetails = new ArrayList<ReplyDetail>();
				List<Reply> replies = new ArrayList<Reply>();
				replies = remarkService.selectReplyByRemarkId(remark.getRemarkId());
				if(replies.size()>0)
				for (Reply reply : replies) {
					Userinfo userinfo1 = userService.findUserinfoById(reply.getFromUserId());//获取回复者的昵称
					Userinfo userinfo2 = userService.findUserinfoById(reply.getToUserId());//获取被回复者的昵称
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
