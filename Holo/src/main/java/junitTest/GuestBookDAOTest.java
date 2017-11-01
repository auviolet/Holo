package junitTest;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import com.holo.dao.GuestBookDAO;
import com.holo.vo.GuestBookVO;

public class GuestBookDAOTest {

	GuestBookDAO gbDao;

	// annotation 을 이용해 Test 용임을 명시
	@Before
	public void test2() {
		gbDao = new GuestBookDAO();
		System.out.println("최초에 한번만 수행된다.");
		System.out.println("@Before 어노테이션 메서드 수행");
	}

	/*
	 * 현재 클래스에 없는 메소드이라는 것은 부모에 있는 것을 호출했다는 것 부모를 따로 지정하지 않으면 Object Class가 부모가
	 * 된다. import static org.junit.Assert.*; (org.junit.assert에 있는 모든 static
	 * 멤버변수를 가져다 쓰겠다) 다른 클래스에 있는 static 멤버변수를 클래스 명을 명시하지 않고 부를 수 있다.
	 * assert.fail 그러나, 구분이 어렵기 때문에 클래스명을 명시하고 가져다 쓰는 것이 가독성에도 좋다.
	 */
	// fail("Not yet implemented");
	@Test
	public void test() {

		ArrayList<GuestBookVO> list = (ArrayList<GuestBookVO>) gbDao.listAll();
		System.out.println(list); // VisitorVO의 toString()을 출력// toString() 메서드가
									// 없을 떄(패키지명.클래스명@참조값)
	}
/*
	@Test
	public void test1() {
		ArrayList<GuestBookVO> list = gbDao.search("안녕");
		System.out.println(list);
	}
	
	*/
}
