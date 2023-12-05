package com.blogcdk.model;

public class Blog {
    private Integer blogId;

    private String blogTitle;
    
    private String blogDesc;

    private String article;

    private String time;

    private Integer fromUserId;

    private Integer categoryId;

    private Integer readNum;

    private String coverImage;
    
    private Integer recommend;

    public Blog() {
		super();
	}

	public Blog(Integer blogId, String blogTitle, String blogDesc, String article, String time, Integer fromUserId,
			Integer categoryId, Integer readNum, String coverImage, Integer recommend) {
		super();
		this.blogId = blogId;
		this.blogTitle = blogTitle;
		this.blogDesc = blogDesc;
		this.article = article;
		this.time = time;
		this.fromUserId = fromUserId;
		this.categoryId = categoryId;
		this.readNum = readNum;
		this.coverImage = coverImage;
		this.recommend = recommend;
	}

	public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle == null ? null : blogTitle.trim();
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article == null ? null : article.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public Integer getFromUserId() {
        return fromUserId;
    }

    public void setFromUserId(Integer fromUserId) {
        this.fromUserId = fromUserId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getReadNum() {
        return readNum;
    }

    public void setReadNum(Integer readNum) {
        this.readNum = readNum;
    }

    public String getCoverImage() {
        return coverImage;
    }

    public void setCoverImage(String coverImage) {
        this.coverImage = coverImage == null ? null : coverImage.trim();
    }

	public Integer getRecommend() {
		return recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

	public String getBlogDesc() {
		return blogDesc;
	}

	public void setBlogDesc(String blogDesc) {
		this.blogDesc = blogDesc;
	}

	@Override
	public String toString() {
		return "Blog [blogId=" + blogId + ", blogTitle=" + blogTitle + ", article=" + article + ", time=" + time
				+ ", fromUserId=" + fromUserId + ", categoryId=" + categoryId + ", readNum=" + readNum + ", coverImage="
				+ coverImage + ", recommend=" + recommend + "]";
	}
    
    
}