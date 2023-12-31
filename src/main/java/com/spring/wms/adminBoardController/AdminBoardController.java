package com.spring.wms.adminBoardController;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.wms.adminBoardDto.AdminBoardDto;
import com.spring.wms.adminBoardService.AdminBoardService;
import com.spring.wms.boardService.BoardService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private BoardService boardService;
	//private static final String CURR_IMAGE_REPO_PATH = "C:\\file_repo";
	//String seperatorPath = "\\";	// window

	private static final String CURR_IMAGE_REPO_PATH = "/var/lib/tomcat8/file_repo";
	String seperatorPath = "/";		// linux
	
	@RequestMapping(value="/addBoard", method=RequestMethod.GET)
	public ModelAndView addboard() {
		return new ModelAndView("/admin/board/addBoard");
	}
	
	@RequestMapping(value="/addBoard" , method = RequestMethod.POST)
	public ResponseEntity<String> addBoard(MultipartHttpServletRequest multipartRequest , HttpServletResponse response) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");

		AdminBoardDto adminBoardDto = new AdminBoardDto();
		adminBoardDto.setBoardTitle(multipartRequest.getParameter("boardTitle"));
		adminBoardDto.setBoardGenre(multipartRequest.getParameter("boardGenre"));
		int boardEpisode = Integer.parseInt(multipartRequest.getParameter("boardEpisode"));
		adminBoardDto.setBoardEpisode(boardEpisode);
		adminBoardDto.setBoardDate(fm.parse(multipartRequest.getParameter("boardDate")));
		adminBoardDto.setBoardIntro(multipartRequest.getParameter("boardIntro"));
		adminBoardDto.setBoardCasting(multipartRequest.getParameter("boardCasting"));
		adminBoardDto.setBoardDirector(multipartRequest.getParameter("boardDirector"));
		adminBoardDto.setBoardCountry(multipartRequest.getParameter("boardCountry"));

		
		Iterator<String> file = multipartRequest.getFileNames();
		String originalFileName = "";
		if (file.hasNext()) {
			
			MultipartFile uploadFile = multipartRequest.getFile(file.next()); 	
			
			if(!uploadFile.getOriginalFilename().isEmpty()) {
			
				File f = new File(CURR_IMAGE_REPO_PATH + seperatorPath + uploadFile.getOriginalFilename());	
				uploadFile.transferTo(f); 
				adminBoardDto.setBoardFileName(uploadFile.getOriginalFilename());
			}
		
		}
		
		adminBoardService.addNewBoard(adminBoardDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message= "<script>";
			   message += " alert('성공적으로 등록되었습니다.');";
			   message +=" location.href='" + multipartRequest.getContextPath() + "';";
			   message +="</script>";
		
		return new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		
	}

	@RequestMapping(value="/adminBoardMain", method=RequestMethod.GET)
	public ModelAndView adminBoardMain() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/board/adminBoardMain");
		
		mv.addObject("newBoardList", adminBoardService.listBoard());
		
		return mv;
	}
	
	
	@RequestMapping(value="/deleteBoard" , method = RequestMethod.GET)
	public @ResponseBody String deleteBoard(@RequestParam("boardId") int boardId, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		String htmlBody = "";
		
		adminBoardService.deleteBoard(boardId);
		htmlBody += "<script>";
		htmlBody += "alert('삭제되었습니다.');";
		htmlBody += "location.href='"+ request.getContextPath()+ "/admin/board/adminBoardMain'";
		htmlBody += "</script>";
		
		return htmlBody;
		
	}
	
	
}
