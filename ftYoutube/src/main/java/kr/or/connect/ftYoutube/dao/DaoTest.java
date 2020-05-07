package kr.or.connect.ftYoutube.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.or.connect.ftYoutube.config.ApplicationConfig;

public class DaoTest {

	public static void main(String[] args) {
		System.out.println("hi I'm DAO TEST");
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		System.out.println("hi Im ac getBean");

		
		StudioDao studioDao = ac.getBean(StudioDao.class);



}
