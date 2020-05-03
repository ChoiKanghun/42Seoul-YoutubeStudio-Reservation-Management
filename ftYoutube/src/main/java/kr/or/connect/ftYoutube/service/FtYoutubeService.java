package kr.or.connect.ftYoutube.service;

import java.util.List;

import kr.or.connect.ftYoutube.dto.Studio;

public interface FtYoutubeService {
	
	//SELECT Every records from table studio 1(2)
	public List<Studio> getAllStudioOne();
	public List<Studio> getAllStudioTwo();
	
	//UPDATE user_id, userPw Depending on Hour and day condition
	public int updateByDayHour(Studio studio, Integer snum);
	
	//SELECT a record's user_id Depending on Hour and day condition
	public Studio selectByDayHour(Studio studio, Integer snum);
	
	//DELETE FROM studio table
	//condition : hour, day, userId, userPw
	public int deleteStudio(Studio studio, Integer snum);
}
