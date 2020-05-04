package kr.or.connect.ftYoutube.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.connect.ftYoutube.dao.StudioDao;
import kr.or.connect.ftYoutube.dto.Studio;
import kr.or.connect.ftYoutube.service.FtYoutubeService;

@Service
public class FtYoutubeServiceImpl implements FtYoutubeService {
	
	@Autowired
	StudioDao studioDao;
	
/* ---- StudioDao ---- */
	
	//SELECT Every records from table studio 1(2)
	@Override
	@Transactional
	public List<Studio> getAllStudioOne(){
		return studioDao.getAllStudioOne();
	}
	
	public List<Studio> getAllStudioTwo(){
		return studioDao.getAllStudioTwo();
	}
	
	public int updateByDayHour(Studio studio, Integer snum) {
		return studioDao.updateByDayHour(studio, snum);
	}
	
	public Studio selectByDayHour(Studio studio, Integer snum) {
		return studioDao.selectByDayHour(studio, snum);
	}

	public Studio checkDeletable(Studio studio, Integer snum) {
		return studioDao.checkDeletable(studio, snum);
	}
	
	public int deleteStudio(Studio studio, Integer snum) {
		return studioDao.deleteStudio(studio, snum);
	}

}
