package kr.or.connect.ftYoutube.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.connect.ftYoutube.dto.Studio;
import kr.or.connect.ftYoutube.service.FtYoutubeService;

@RestController
public class FtYoutubeAPIController {

	@Autowired
	FtYoutubeService ftYoutubeService;

	@GetMapping(path="/get/studio{number}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> studioInfo(
			@PathVariable(name="number") int number){
		Map<String, Object> map = new HashMap<>();
		
		if (number == 1) {
			List<Studio> studios = ftYoutubeService.getAllStudioOne();
			map.put("studios", studios);
		} else {
			List<Studio> studios = ftYoutubeService.getAllStudioTwo();
			map.put("studios", studios);
		}
		
		return map;
	}

}
