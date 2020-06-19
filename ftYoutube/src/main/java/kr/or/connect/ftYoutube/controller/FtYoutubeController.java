package kr.or.connect.ftYoutube.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.connect.ftYoutube.dto.Studio;
import kr.or.connect.ftYoutube.service.FtYoutubeService;

@CrossOrigin(origins="*")
@Controller
public class FtYoutubeController {
	
	@Autowired
	FtYoutubeService ftYoutubeService; 
	
	@GetMapping(path="/")
	public String index(
			RedirectAttributes redirectAttr,
			@RequestParam (name="code", required=false) String code) {
			redirectAttr.addFlashAttribute("code", code);
			return "redirect:studio";
	}
	
	@GetMapping(path="/studio")
	public String studio(
			@RequestParam(name="login", required=false)String login,
			@SessionAttribute(name="intraId", required=false) String intraId,
			@RequestParam(name="code", required=false) String code,
			HttpSession session,
			HttpServletRequest request, 
			HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		response.setHeader("Access-Control-Allow-Origin", "*");
		
	if (code != null) {
		request.setAttribute("code", code);
	} else {
		request.setAttribute("code", null);
	}
	if (login != null) {
		session.setAttribute("intraId", login);
		request.setAttribute("login", login);
	} else if (intraId != null) {
		request.setAttribute("login", intraId);
	} else
		request.setAttribute("login", "로그인하기");
	return "studio";
	}
	
	@GetMapping(path="/reservation")
	public String reservation() {
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
	
	@GetMapping(path="/getTokenPage")
	public String getTokenPage(RedirectAttributes redirectAttr,
			@RequestParam(name="code")String code,
			HttpServletRequest request, 
			HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		response.setHeader("Access-Control-Allow-Origin", "*");
  		request.setAttribute("code", code);
  		System.out.println("code :" + code);
		return "getTokenPage";
	}
}
