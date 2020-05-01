package kr.or.connect.ftYoutube.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ftYoutubeController {
	@GetMapping(path="/mainpage")
	public String mainpage() {
		return "mainpage";
	}
}
