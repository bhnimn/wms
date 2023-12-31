package com.spring.wms.memberController;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.wms.memberDto.MemberDto;
import com.spring.wms.memberService.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

@Autowired
private MemberService memberService;

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("/member/login");
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap, HttpServletRequest request) throws Exception {
			
		ModelAndView mv = new ModelAndView();
		
		MemberDto memberDto = memberService.loginMember(loginMap);		
		
		if (memberDto != null) { 	
			HttpSession session = request.getSession();		
			session.setAttribute("isLogOn" , true);			
			session.setAttribute("memberInfo" , memberDto.getMemberId());
			session.setMaxInactiveInterval(60 * 30);
			mv.setViewName("redirect:/");	
		}
		else { 
			mv.addObject("invalidMember", true);
			mv.setViewName("/member/login");
		}
		return mv;
		
	}
	
	@RequestMapping(value="/logout" , method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		
		session.setAttribute("isLogOn", false);
		session.invalidate(); 
		
		mv.setViewName("redirect:/");
		
		return mv;
	
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView join() {
		return new ModelAndView("/member/join");
	}
	
	@RequestMapping(value="/join" , method=RequestMethod.POST)
	public @ResponseBody String join(MemberDto memberDto , HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		if (memberDto.getEmailstsYn() == null) memberDto.setEmailstsYn("n");
		else								   memberDto.setEmailstsYn("y");
		
		if (memberDto.getSmsstsYn() == null)   memberDto.setSmsstsYn("n");
		else								   memberDto.setSmsstsYn("y");
		
		memberService.joinMember(memberDto);
		
		String htmlBody = "<script>";
			   htmlBody += "alert('회원가입 되었습니다.');";
			   htmlBody += "location.href='"+ request.getContextPath()+"/member/login'";
			   htmlBody += "</script>";
			   
		return htmlBody;
	}
	
	@RequestMapping(value="/overlapped" , method=RequestMethod.POST)
	public ResponseEntity<Object> overlapped(@RequestParam("id") String id) throws Exception{
		return new ResponseEntity<Object>(memberService.overlapped(id), HttpStatus.OK);
	}
	
	@RequestMapping(value="/overlappedNickname" , method=RequestMethod.POST)
	public ResponseEntity<Object> overlappedNickname(@RequestParam("nickname") String nickname) throws Exception{
		return new ResponseEntity<Object>(memberService.overlappedNickname(nickname), HttpStatus.OK);
	}
}
