package com.blogcdk.util;

import java.util.List;

/**
 * ��ҳ�����ࣨ��װÿҳ��Ҫ��ʾ�����ݣ�
 * @author cdk
 * @date 2018��7��27��
 */
public class PageUtil {
	//��ʼλ��
	int start=0;
	//ÿҳ����������
    int count = 5;
    //����������
    int totalCount = 0;
    //��ǰҳ��
    int pageNo = 0;
    //��ҳ����
    int pageCount = 0;
    //���ҳ��Ŀ�ʼ�����������λ��βҳ
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
        // ����������50�����ܹ���5�����ģ���ô���һҳ�Ŀ�ʼ����45
        if (0 == total % count)
            last = total - count;
        // ����������51�����ܹ���5�����ģ���ô���һҳ�Ŀ�ʼ����50
        else
            last = total - total % count;      
    }
	//���ݵ�ǰҳ�����start
	public void calStartByPageNo(int count){
		//count��Ϊÿҳ��������
		start = (pageNo-1)*count;
	}
	//����start���㵱ǰҳ��
	public void calPageNoByStart(int count){
		pageNo = start/count + 1;
	}
	//������ҳ��
	public void calPageCount(int totalCount,int count){
		pageCount = totalCount/count + 1;
	}
	@Override
	public String toString() {
		return "PageUtil [start=" + start + ", count=" + count + ", totalCount=" + totalCount + ", pageNo=" + pageNo
				+ ", pageCount=" + pageCount + ", last=" + last + "]";
	}
	
	
	
	
	
	
}
