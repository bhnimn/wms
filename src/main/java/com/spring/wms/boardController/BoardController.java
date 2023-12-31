package com.spring.wms.boardController;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.spring.wms.boardService.BoardService;
import com.spring.wms.commentDto.CommentDto;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@RequestMapping(value="/genreall", method=RequestMethod.GET)
	public ModelAndView genreall() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/genreall");
		
		List<AdminBoardDto> all = boardService.allBoard();
		
		mv.addObject("all", all);
		
		return mv;
	}
	@RequestMapping(value="/genreaction", method=RequestMethod.GET)
	public ModelAndView genreaction() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/genreaction");
		
		List<AdminBoardDto> action = boardService.listBoard("action");
		
		mv.addObject("action", action);
		
		return mv;	
}
	@RequestMapping(value="/genredrama", method=RequestMethod.GET)
	public ModelAndView genredrama() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/genredrama");
		
		List<AdminBoardDto> drama = boardService.listBoard("drama");
		
		mv.addObject("drama", drama);
		
		return mv;
}
	@RequestMapping(value="/genreseries", method=RequestMethod.GET)
	public ModelAndView genreseries() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/genreseries");
		
		List<AdminBoardDto> series = boardService.listBoard("series");
		
		mv.addObject("series", series);
		
		return mv;	
}
	@RequestMapping(value="/genresf", method=RequestMethod.GET)
	public ModelAndView genresf() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/genresf");
		
		List<AdminBoardDto> sf = boardService.listBoard("sf");
		
		mv.addObject("sf", sf);
		
		return mv;
}
	@RequestMapping(value="/boardDetail" , method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("boardId") int boardId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/boardDetail");
		mv.addObject("board", boardService.boardDetail(boardId));
		mv.addObject("review", boardService.allComment(boardId));
		return mv;
		
	}
	
	@RequestMapping(value="/boardLike" , method = RequestMethod.GET)
	public ModelAndView boardLike(@RequestParam("memberId") String memberId) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/boardLike");
		mv.addObject("myLike", boardService.boardLike(memberId));
		return mv;
		
	}
	
	@RequestMapping(value="/writeComment" , method = RequestMethod.POST)
	public ResponseEntity<String> writeComment(MultipartHttpServletRequest multipartRequest , HttpServletResponse response) throws Exception {
		
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");


		CommentDto commentDto = new CommentDto();
		int boardId = Integer.parseInt(multipartRequest.getParameter("boardId"));
		commentDto.setBoardId(boardId);
		commentDto.setMemberId(multipartRequest.getParameter("memberInfo"));
		commentDto.setReviewComment(multipartRequest.getParameter("reviewComment"));
		
		boardService.writeComment(commentDto);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String message= "<script>";
			   message +="location.href='" + multipartRequest.getContextPath() + "/board/boardDetail?boardId=" + boardId + "'";
			   message +="</script>";
		
		return new ResponseEntity<String>(message, responseHeaders, HttpStatus.OK);
		
	}
	
	@RequestMapping(value="/heart" , method = RequestMethod.GET)
	public ResponseEntity<String> heart(@RequestParam("boardId") int boardId, @RequestParam("memberId") String memberId, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		Map<String, Object> heartMap = new HashMap<String, Object>();
		heartMap.put("boardId", boardId); 
		heartMap.put("memberId", memberId);
		
		String htmlBody = "";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		if(boardService.heartExist(heartMap) == "false") {
			boardService.heartAdd(heartMap);
			htmlBody += "<script>";
			htmlBody += "alert('좋아요 목록에 추가되었습니다.');";
			htmlBody += "location.href='"+ request.getContextPath()+ "/board/boardDetail?boardId=" + boardId + "'";
			htmlBody += "</script>";

		}
		else {
			boardService.heartErase(heartMap);
			htmlBody += "<script>";
			htmlBody += "alert('좋아요 목록에서 삭제되었습니다.');";
			htmlBody += "location.href='"+ request.getContextPath()+ "/board/boardDetail?boardId=" + boardId + "'";
			htmlBody += "</script>";
		}
		
		return new ResponseEntity<String>(htmlBody, responseHeaders, HttpStatus.OK);
	}
	
	
}
