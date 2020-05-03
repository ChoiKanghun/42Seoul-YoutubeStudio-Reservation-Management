package kr.or.connect.ftYoutube.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FtYoutubeController {
	@GetMapping(path="/studio1")
	public String studio1() {
		return "studio1";
	}
	
	@GetMapping(path="/studio/reservation")
	public String reservation()
	{
		return "studioReservation";
	}
}
