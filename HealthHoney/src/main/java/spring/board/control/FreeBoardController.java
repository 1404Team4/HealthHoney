package spring.board.control;

import java.util.List;

import mybatis.BoardManager;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.board.domain.BoardDto;

@Controller
@Component
@RequestMapping("/free")
public class FreeBoardController {

	@RequestMapping("/list.board")
	public String list(@ModelAttribute("item") BoardDto dto, ModelMap map) {

		int page = 1; // 현재 페이지
		int pageSize = 7; // 페이지당 글 개수
		int firstRow = 0; // 보여질 첫번째 글순서
		int lastRow = 0; // 보여질 마지막 글순서
		int totSize = 0; // 전체 글 개수
		int totPage = 0; // 전체 페이지수

		String strPage = dto.getPage();
		// null 처리 : /bd/list 로 호출시 page 에는 null 이 들어옴
		if (strPage != null && !"".equals(strPage))
			page = Integer.parseInt(strPage);

		lastRow = page * pageSize;
		firstRow = lastRow - (pageSize - 1);
		// firstRow = (page-1) * pageSize + 1;

		dto.setFirstRow(firstRow);
		dto.setLastRow(lastRow);

		totSize = BoardManager.getTotSize(dto);
		totPage = (totSize - 1) / pageSize + 1;

		List<BoardDto> list = BoardManager.getList(dto);

		map.addAttribute("list", list);
		map.addAttribute("page", page);
		map.addAttribute("totPage", totPage);

		return "/board/free/list.jsp";

	}

	@RequestMapping(value = "/write.board", method = RequestMethod.GET)
	public String precreate() {
		System.out.println("create 호출");
		return "/board/free/update.jsp";
	}

	// create 를 POST 방식으로 받게끔
	// public String create(ReboardDto dto) 해서 dao.create 하세요
	@RequestMapping(value = "/write.board", method = RequestMethod.POST)
	public String create(BoardDto dto) {
		if (BoardManager.create(dto))
			System.out.println("삽입완료");
		BoardManager.commit();
		return "redirect:/free/list.board";

	}

	// 주소로 모든 자원에 접근할 수 있게끔 해주는 방식 : RESTful 방식
	@RequestMapping(value = "/{no}/read.board", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String read(@PathVariable int no, ModelMap map) {
		if (BoardManager.addRcount(no)) {
			BoardDto dto = BoardManager.read(no);
			map.addAttribute("item", dto);
		}
		BoardManager.commit();
		return "/board/free/read.jsp";
	}

	@RequestMapping(value = "/{no}/update.board", method = RequestMethod.GET)
	public String preupdate(@PathVariable int no, ModelMap map) {
		map.addAttribute("item", BoardManager.read(no));
		BoardManager.commit();
		return "/board/free/update.jsp";
	}

	@RequestMapping(value = "/update.board", method = RequestMethod.POST)
	public String update(BoardDto dto) {
		if (BoardManager.update(dto)) {
			System.out.println("수정완료");
			BoardManager.commit();
		}
		return "redirect:/free/list.board";
	}

	@RequestMapping(value = "/{no}/reply.board", method = RequestMethod.GET)
	public String prereply(@PathVariable int no, ModelMap map) {
		BoardDto dto = BoardManager.read(no);
		// 수정과 차별하기 위해서 writer(혹은 no)를 없앤다.
		dto.setWriter("");
		dto.setTitle("RE: " + dto.getTitle());
		dto.setContent("-----원본글 내용-----\n" + dto.getContent()
				+ "\n-----원본글 끝-----\n");
		map.addAttribute("item", dto);
		BoardManager.commit();
		return "/board/free/update.jsp";
	}

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(BoardDto dto) {
		BoardManager.reply(dto);
		BoardManager.commit();
		return "redirect:/free/list.board";
	}

}
