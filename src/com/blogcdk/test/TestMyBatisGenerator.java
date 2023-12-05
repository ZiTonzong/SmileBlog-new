package com.blogcdk.test;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;



public class TestMyBatisGenerator {
	  public static void main(String[] args) throws Exception {
	    	
    	  //mbgִ�й����еľ�����Ϣ
    		List<String> warnings = new ArrayList<String>();
    	  //�����ɵĴ����ظ�ʱ������Դ����
    	   boolean overwrite = true;
    	  //��ȡmbg�����ļ�
//    	   File configFile = new File("./generator-config.xml");
    	   InputStream configFile= TestMyBatisGenerator.class.getClassLoader().getResource("generator-config.xml").openStream();
    	   ConfigurationParser cp = new ConfigurationParser(warnings);
    	   Configuration config = cp.parseConfiguration(configFile);
    	   DefaultShellCallback callback = new DefaultShellCallback(overwrite);
          //����mbg
    	   MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
          //ִ�����ɴ���
    	   myBatisGenerator.generate(null);
    	   System.out.println("���ɴ���ɹ���ˢ����Ŀ���鿴�ļ�,Ȼ��ִ��TestMybatis.java");
         
    }
}
