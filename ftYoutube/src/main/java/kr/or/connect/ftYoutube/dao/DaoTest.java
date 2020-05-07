package kr.or.connect.ftYoutube.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.or.connect.ftYoutube.config.ApplicationConfig;

public class DaoTest {

	public static void main(String[] args) {
		System.out.println("hi I'm DAO TEST");
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		StudioDao studioDao = ac.getBean(StudioDao.class);
		System.out.println("hi Im ac getBean");

		for (int i = 1; i <= 168; i++) {
			if (i % 7 == 0) {
				System.out.println(i);
			} else {
				studioDao.studioDayMove(1, i, i + 1);
			}
		}
		int remove1 = studioDao.removeFirstDay(1);
		System.out.println("hi Im remove1 : " + remove1);
	}

}
