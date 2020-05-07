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
	
	@GetMapping(path="/studio")
	public String studio() {
		return "studio";
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
		
		Studio selectUserId = ftYoutubeService.selectByDayHour(studio, number);
		if (selectUserId.getUserId() != null) {

			return ("redirect:reservation");
		} else {
			ftYoutubeService.updateByDayHour(studio, number);

		}
		return ("redirect:reservation");
	}
	
	@GetMapping(path="/firefox_reservation")
	public String firefox_reservation() {
		return ("redirect:studio");
	}
	
	@GetMapping(path="/testpage")
	public String test() {
		return "testpage";
	}
}
