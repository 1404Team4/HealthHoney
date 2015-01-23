package mybatis;

import java.io.IOException;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

import spring.board.domain.BoardDto;


@Component
public class BoardManager {
	private static SqlSessionFactory mapper;
	private static SqlSession session;
	// 기본적으로 스태틱으로 처리(단일)
	static {
		try {
			// 설정파일 읽어들임
			Reader reader = Resources
					.getResourceAsReader("mybatis/mybatis_config.xml");
			// 해당 정보를 매퍼에 담음.
			mapper = new SqlSessionFactoryBuilder().build(reader);
			session = mapper.openSession();
		} catch (IOException err) {
			throw new RuntimeException(err);
		}

	}

	// q반드시 퍼블릭스태틱

	public static int getTotSize(BoardDto dto) {

		return session.selectOne("freeboard.getTotSize", dto);
	}

	public static List getList(BoardDto dto) {
		return session.selectList("getList", dto);// 이게 보드 매퍼의 id를 가져옴
		
	}

	public static boolean create(BoardDto dto) {
		
		int ref=session.selectOne("freeboard.curVal");
		dto.setRef(ref);
		String content = dto.getContent().replace("\n","<br/>");
	      content = "\n" + content;
	      dto.setContent(content);
		return session.insert("freeboard.create", dto) > 0;
	}

	public static BoardDto read(int no) {

		return session.selectOne("freeboard.read", no);
	}

	public static boolean addRcount(int no) {

		return session.update("freeboard.addRcount", no) > 0;
	}

	public static boolean update(BoardDto dto) {
		String content = dto.getContent().replace("<br/>", "\n");
	      content = "\n" + content;
	      dto.setContent(content);
		return session.update("freeboard.update", dto) > 0;
	}

	public static void reply(BoardDto dto) {
		// transaction 처리 필요
		// update step+1(원본글보다 큰건 다 +1)
		session.update("freeboard.addStep", dto);
		// insert
		session.insert("freeboard.reply", dto);

	}
	public static void commit(){
		session.commit();
	}

}