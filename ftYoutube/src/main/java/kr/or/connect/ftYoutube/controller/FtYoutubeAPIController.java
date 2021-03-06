package kr.or.connect.ftYoutube.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.or.connect.ftYoutube.dto.Studio;
import kr.or.connect.ftYoutube.service.FtYoutubeService;

@CrossOrigin(origins="*")
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
	public String postStudio(@ModelAttribute Studio studio,
			@RequestParam(name="number", required = true) int number) {
		//select해서 해당 칸에 user_id가 존재하면 "fail"리턴.
		//user_id가 '-'라면 insert 후 "success"리턴.
		Studio selectUserId = ftYoutubeService.selectByDayHour(studio, number);

		if (selectUserId.getUserId() != null) {
			return ("fail");	
		}
		else {
			ftYoutubeService.updateByDayHour(studio, number);	
		}
		return ("redirect:reservation");
	}
	
	@GetMapping(path="/get/studio")
	public String getStudio(@ModelAttribute Studio studio,
			@RequestParam(name="number") int number,
			@RequestParam(name="intraId", required = false)String intraId) {
		//select해서 해당 칸에 user_id가 존재하면 "fail"리턴.
		//user_id가 '-'라면 insert 후 "success"리턴.
		Studio selectUserId = ftYoutubeService.selectByDayHour(studio, number);
		if (selectUserId.getUserId() != null && intraId == null) {
			return ("fail");	
		} else if (selectUserId.getUserId() != null && selectUserId.getUserId().equals(intraId)) {
			studio.setUserId(intraId);
			studio.setUserPw("bookedWithOAuth");
			ftYoutubeService.updateByDayHour(studio, number);
		} else if (selectUserId.getUserId() != null && !selectUserId.getUserId().equals(intraId)) {
			return ("fail");
		} else if (selectUserId.getUserId() == null && intraId == null) {
			ftYoutubeService.updateByDayHour(studio, number);
		} else if (selectUserId.getUserId() == null && intraId.equals("로그인하기")) {
			return ("fail");
		} else if (selectUserId.getUserId() == null && intraId != null) {
			studio.setUserId(intraId);
			studio.setUserPw("bookedWithOAuth");
			ftYoutubeService.updateByDayHour(studio, number);
		}
		return "redirect:mainpage";
	}

	@GetMapping(path="/get/reservation", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getReservation(@ModelAttribute Studio studio,
			@RequestParam(name="number", required = true) int number)
	{
		Map<String, Object> map = new HashMap<>();
		Studio selectUserId = ftYoutubeService.selectByDayHour(studio, number);
		if (selectUserId.getUserId() != null) {
			map.put("availability", "negative");
		} else {
			map.put("availability", "positive");
		}
		return map;
	}
	
	@GetMapping(path="/check/cancellation", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> checkCancellation(
			@ModelAttribute Studio studio,
			@RequestParam(name="number", required = true) int number)
	{
		Map<String, Object> map = new HashMap<>();
		try {
			Studio checkStudio = ftYoutubeService.checkDeletable(studio, number);
			if (checkStudio.getId() != null) {
				map.put("availability", "positive");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("availability", "negative");
		}
		return map;
	}
	
	
	@PostMapping(path="/delete/cancellation", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> deleteReservationByPost(
			@ModelAttribute Studio studio,
			@RequestParam (name="number", required=true) int number)
	{
		Map<String, Object> map = new HashMap<>();
		int deleteCount = 0;
		try {
			deleteCount = ftYoutubeService.deleteStudio(studio, number);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("deleteCount", deleteCount);
		
		return map;
	}
	
	@GetMapping(path="/delete/cancellation", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> deleteReservationByGet(
			@ModelAttribute Studio studio,
			@RequestParam (name="number", required=true) int number,
			@RequestParam(name="intraId", required = false)String intraId)
	{
		Map<String, Object> map = new HashMap<>();
		int deleteCount = 0;
		studio.setUserId(intraId);
		studio.setUserPw("bookedWithOAuth");
		try {
			deleteCount = ftYoutubeService.deleteStudio(studio, number);
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("deleteCount", deleteCount);
		
		return map;
	}
}
