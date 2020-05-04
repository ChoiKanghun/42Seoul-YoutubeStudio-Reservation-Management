package kr.or.connect.ftYoutube.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.connect.ftYoutube.dto.Studio;
import kr.or.connect.ftYoutube.service.FtYoutubeService;

@Controller
public class FtYoutubeController {
	
	@Autowired
	FtYoutubeService ftYoutubeService; 
	
	@GetMapping(path="/studio1")
	public String studio1() {
		return "studio1";
	}
	
	@GetMapping(path="/reservation")
	public String reservation()
	{
		return "studioReservation";
	}
	
	@GetMapping(path="/cancellation")
	public String delete() {
		return "studioCancellation";
	}
	
	@PostMapping(path="/reservation")
	public String postReservation() {
		return "studioReservation";
	}
	
	@PostMapping(path="/cancellation")
	public String postCancellation() {
		return "studioCancellation";
	}
	
	@PostMapping(path="/post_reservation")
	public String reservationPost(@ModelAttribute Studio studio,
			@RequestParam(name="number", required = true) int number) {
		//select해서 해당 칸에 user_id가 존재하면 "fail"리턴.
		//user_id가 '-'라면 insert 후 "success"리턴.
		Studio selectUserId = ftYoutubeService.selectByDayHour(studio, number);
		if (selectUserId.getUserId() != null) {

			return ("redirect:reservation");
		} else {
			ftYoutubeService.updateByDayHour(studio, number);

		}
		return ("redirect:reservation");
	}
}
