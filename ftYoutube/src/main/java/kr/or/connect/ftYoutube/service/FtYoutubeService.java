package kr.or.connect.ftYoutube.service;

import java.util.List;

import kr.or.connect.ftYoutube.dto.Studio;

public interface FtYoutubeService {
	
	//SELECT Every records from table studio 1(2)
	public List<Studio> getAllStudioOne();
	public List<Studio> getAllStudioTwo();
}
