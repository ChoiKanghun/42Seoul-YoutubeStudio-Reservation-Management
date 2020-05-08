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
		int temp = 0;
		
		for (int i = 1; i <= 168; i++) 
		{
			if (i % 7 == 0) 
				temp++;
			else 
				studioDao.studioDayMove(1, i, i + 1);
		}
		studioDao.removeFirstDay(1);
		
		for (int i = 1; i <= 168; i++) 
		{
			if (i % 7 == 0) 
				temp++;
			else 
				studioDao.studioDayMove(2, i, i + 1);
		}
		studioDao.removeFirstDay(2);
	}
}
