package kr.or.connect.ftYoutube.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@PostMapping(path="/post/studio")
	public String write(@ModelAttribute Studio studio,
			@RequestParam(name="number", required = true) int number) {
		//select해서 해당 칸에 user_id가 존재하면 "fail"리턴.
		//user_id가 '-'라면 insert 후 "success"리턴.
		Studio selectUserId = ftYoutubeService.selectByDayHour(studio, number);
		if (selectUserId.getUserId() != "-")
			return ("fail");
		else {
			ftYoutubeService.updateByDayHour(studio, number);	
		}
		return ("success");
	}

}
