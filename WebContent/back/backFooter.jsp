<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 公共尾部 --> 
            <div style="clear:both;"></div> 
            <div class="pb-footer"> 
                <div class="pb-footer-wp"> 
                    <div class="pb-main pb-footer-cnt pb-size-small"> 
                        <span class="pb-fl">&copy; 2018 CDK. 赣ICP备18002951号</span> 
                        <ul class="pb-fr"> 
                            <li><a href="http://www.cdk1997.top" target="_blank">关于站长</a></li> 
                            <li><a href="#">版权声明</a></li> 
                            <li><a href="#">客服中心</a></li> 
                            <li><a href="#">联系我们</a></li> 
                        </ul> 
                    </div> 
                </div> 
            </div> 
            <!-- 公共尾部 --> 
</body>
	<script type="text/javascript">
function _go() {  
        var pc = $("#pageNo").val();//获取文本框中的当前页码  
        if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验  
            alert('请输入正确的页码！');  
            return;  
        }  
        if(pc > ${pageUtil.pageCount} || pc < 1) {//判断当前页码是否大于最大页  
            alert('请输入正确的页码！');  
            return;  
        }  
        location = "?pageNo=" + pc;  
    };  

	</script> 
</html>