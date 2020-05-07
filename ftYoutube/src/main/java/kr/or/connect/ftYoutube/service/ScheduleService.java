package kr.or.connect.ftYoutube.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import kr.or.connect.ftYoutube.dao.StudioDao;

@EnableScheduling
@Configuration
public class ScheduleService {
	
	@Autowired
	StudioDao studioDao;
	
	//at 00:00:00 everyday, scheduler updates the table.
	//all the table's columns are moved to the left
	//seventhday's columns will become null
	@Scheduled(cron="00 00 00 * * ?")
	public void testMethod() 
	{

		for (int i = 1; i <= 168; i++) 
		{
			if (i % 7 == 0) 
				System.out.print("삭제한 레코드의 id : " + i+ ", ");
			else 
				studioDao.studioDayMove(1, i, i + 1);
		}
		int remove1 = studioDao.removeFirstDay(1);
		System.out.println("hi I'm remove1 count : " + remove1);
		
		for (int i = 1; i <= 168; i++) 
		{
			if (i % 7 == 0) 
				System.out.print("삭제한 레코드의 id : " + i);
			else 
				studioDao.studioDayMove(2, i, i + 1);
		}
		int remove2 = studioDao.removeFirstDay(2);
		System.out.println("hi I'm remove2 count : " + remove2);
	}
}
