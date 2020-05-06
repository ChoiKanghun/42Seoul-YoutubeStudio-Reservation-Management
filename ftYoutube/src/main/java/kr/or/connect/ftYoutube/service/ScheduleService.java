package kr.or.connect.ftYoutube.service;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@EnableScheduling
@Configuration
public class ScheduleService {
	@Scheduled(cron="1 * 16 * * ?")
	public void testMethod() {
		System.out.println("test_scheduled");
	}
}
