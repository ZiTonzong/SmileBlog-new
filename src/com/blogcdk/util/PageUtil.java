package com.blogcdk.util;

import java.util.List;

/**
 * 分页工具类（封装每页需要显示的数据）
 * @author cdk
 * @date 2018年7月27日
 */
public class PageUtil {
	//开始位置
	int start=0;
	//每页的数据条数
    int count = 5;
    //总数据条数
    int totalCount = 0;
    //当前页码
    int pageNo = 0;
    //总页码数
    int pageCount = 0;
    //最后页面的开始数据项，用来定位到尾页
    int last = 0;
    public int getStart() {
        return start;
    }
    public void setStart(int start) {
        this.start = start;
    }
    public int getCount() {
        return count;
    }
    public void setCount(int count) {
        this.count = count;
    }
    public int getLast() {
        return last;
    }
    public void setLast(int last) {
        this.last = last;
    }
     
    public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public void caculateLast(int total) {
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
        if (0 == total % count)
            last = total - count;
        // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else
            last = total - total % count;      
    }
	//根据当前页码计算start
	public void calStartByPageNo(int count){
		//count即为每页数据项数
		start = (pageNo-1)*count;
	}
	//根据start计算当前页码
	public void calPageNoByStart(int count){
		pageNo = start/count + 1;
	}
	//计算总页数
	public void calPageCount(int totalCount,int count){
		pageCount = totalCount/count + 1;
	}
	@Override
	public String toString() {
		return "PageUtil [start=" + start + ", count=" + count + ", totalCount=" + totalCount + ", pageNo=" + pageNo
				+ ", pageCount=" + pageCount + ", last=" + last + "]";
	}
	
	
	
	
	
	
}
