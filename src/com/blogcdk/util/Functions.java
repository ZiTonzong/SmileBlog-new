package com.blogcdk.util;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.startup.HomesUserDatabase;
import org.omg.CORBA.PUBLIC_MEMBER;

public class Functions {
	
	/**
	 * ��ȡmd5
	 * @param message
	 * @return
	 */
	public static String getMd5(String message){
		String temp = "";
		try{
			MessageDigest md5Digest = MessageDigest.getInstance("MD5");
			byte[] encodeMd5Digest = md5Digest.digest(message.getBytes());
			temp = convertByteToHexString(encodeMd5Digest);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	/**
	 * ת��md5����
	 * @param bytes
	 * @return
	 */
	public static String convertByteToHexString(byte[] bytes){
		String result = "";
		for(int i=0;i<bytes.length;i++){
			int temp = bytes[i]&0xff;
			String tempHex = Integer.toHexString(temp);
			if(tempHex.length()<2){
				result +="0"+tempHex;
			}else{
				result +=tempHex;
			}
		}
		return result;
	}
	
	/*
	 * ����email��ȡgravatarͷ��
	 */
    public static String getGravatar(String email) {
        String emailMd5 = getMd5(email);
        //����ͼƬ��С32px
        String avatar = "https://s.gravatar.com/avatar/"+emailMd5;
        return avatar;
    }
    /**
     * �����ʼ�����..
     * @param email
     * @param code
     */
    public static void sendMail(String email,String code){
		//�����˵�email
		String to = email;
		//�ʼ����͵�email
		String from = "m18888888888@163.com";
		//������
		String host = "smtp.163.com";
		//�������Ӷ������ӵ����������
		Properties properties = System.getProperties();
		//�����ʼ�������������
		properties.setProperty("mail.smtp.host", host);
		// �����ʼ�Э������
		properties.setProperty("mail.transport.protocol", "smtp");
		//���ͷ�������Ҫ������֤
		properties.put("mail.smtp.auth", "true");
		
		Session session  = Session.getDefaultInstance(properties,new  Authenticator() {
			
			public PasswordAuthentication getPasswordAuthentication()
	        {
				//�������ʼ��û���������
				return new PasswordAuthentication("m18888888888@163.com", "123456");
	        }
		});
		
		try {
			//�����ʼ�����
			MimeMessage message = new MimeMessage(session);
			//�����Զ��巢�����ǳ�  
	        String mailName="CDK";  
	        try {  
	        	mailName=javax.mail.internet.MimeUtility.encodeText("Smile���͵�Ͷ��Ա");  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
			//���÷�����
			message.setFrom(new InternetAddress(mailName+"<"+from+">"));
			//�����ռ���
			message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(to));
			//�����ʼ�����
			message.setSubject("��ӭ��ע��Smile����!");
			//�����ʼ�������
//			message.setText("This is actual message");
			message.setContent("<h1>����<a href='http://127.0.0.1/Blog_cdk/activate?code="+code+"'>������</a>�Լ����˺�</h1>", "text/html;charset=utf-8");
			//�����ʼ�
			Transport.send(message);
	        System.out.println("Sent message successfully....");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    /**
     * ��ȡuuid
     * @return
     */
    public static String getCode(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
    /**
     * ��ȡ���ڵ�ʱ��..
     * @return
     */
    public static String getNowTime(){
    	//��ȡ��ǰ����
		Date currentTime = new Date();
		//������ת��Ϊָ����ʽ
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String getNowTimeString = formatter.format(currentTime);
    	return getNowTimeString;
    }
    /**
     * ��ȡ�û�ip��ַ
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request){
    	String ipAddress = null;
    	try {
			ipAddress = request.getHeader("x-forwarded-for");
			if(ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)){
				ipAddress = request.getHeader("Proxy-Client-IP");
			}
			if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("WL-Proxy-Client-IP");
            }
			if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getRemoteAddr();
                if (ipAddress.equals("127.0.0.1")) {
                    // ��������ȡ�������õ�IP
                    InetAddress inet = null;
                    try {
                        inet = InetAddress.getLocalHost();
                    } catch (UnknownHostException e) {
                        e.printStackTrace();
                    }
                    ipAddress = inet.getHostAddress();
                }
            }
			// ����ͨ������������������һ��IPΪ�ͻ�����ʵIP,���IP����','�ָ�
            if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
                                                                // = 15
                if (ipAddress.indexOf(",") > 0) {
                    ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
                }
            }
		} catch (Exception e) {
			// TODO: handle exception
			ipAddress="";
		}
    	return ipAddress;
    }
    
    /**
     * Ϊ���ܸ��͹۵�ͳ��һƪ���ĵ��Ķ�������Ƶķ�ֹ�ظ�ˢ��ˢ�����������
     * ���涨һ��ʱ�䣬��DAY���ڣ�ͬһip��ͬһ�˺Ŷ�ͬһƪ���͵����������Ϊ1
     * ����ʵ�֣������ݿ⽨���û����ʲ��ͱ���Ҫ�в���id �û�id �û�����֮ip��ַ ����ʱ���
     * ÿ�����б�����ʱ��ɾ��DAY��֮ǰ�����ݣ�һ������Ϊ�˷�ֹ�����������ݼ������ݿ⸺������һ���������ͳ�ƣ���
     * �ٱ����������Ƿ��ظ����ַ���ip���û�id�������ַ���true��ʾip/id�ظ�  ��֮Ϊfalse
     * @param ip �û���IP��ַ
     * @param userId �û�id
     * @return
     */
    public static boolean repeatIpOrUserId(String ip,int userId){
		//����ļ������
    	final int DAY = 1;
    	return false;
    }
}