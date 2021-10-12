package com.gg.itbook;

import org.springframework.beans.BeansException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

@SpringBootApplication
public class ItbookApplication implements ApplicationContextAware {

	public static void main(String[] args) {
		SpringApplication.run(ItbookApplication.class, args);
	}

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		System.out.println("profile:"+applicationContext.getEnvironment().getProperty("profile.name"));
		System.out.println("wechat mini appid:"+applicationContext.getEnvironment().getProperty("wechat.mini.appid"));
		System.out.println("wechat mini secret:"+applicationContext.getEnvironment().getProperty("wechat.mini.secret"));
	}
}
