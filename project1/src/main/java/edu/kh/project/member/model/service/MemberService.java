package edu.kh.project.member.model.service;

import static edu.kh.project.common.JDBCTemplate.*;

import java.sql.Connection;

import edu.kh.project.member.model.dao.MemberDAO;
import edu.kh.project.member.model.vo.Member;

/**
 * 회원 전용 기능 제공 서비스
 * 
 * @author 내 이메일
 *
 */
public class MemberService {
	private MemberDAO dao = new MemberDAO();

	/**
	 * 로그인 service
	 * 
	 * @param member
	 * @return loginMember
	 * @throws Exception
	 */
	public Member login(Member member) throws Exception {

		Connection conn = getConnection();
		Member loginMember = dao.login(conn, member);
		close(conn);

		return loginMember;
	}

	/**
	 * 회원 가입 서비스
	 * 
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int signUp(Member member) throws Exception {
		// 1. Connection 생성
		Connection conn = getConnection();

		// 2. DAO 메서드 호출 후 결과 반환 받기
		int result = dao.signUp(conn, member);

		// 3. 트랜잭션 제어 처리
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		// 4. Connection 반환
		close(conn);

		// 5. 삽입 결과 반환
		return result;
	}

	/**회원 정보 수정 서비스
	 * @param member
	 * @return result
	 * @throws Exception
	 */
	public int updateMember(Member member) throws Exception {
		// 1. Connection 생성
		Connection conn = getConnection();

		// 2. DAO 메서드 호출 후 결과 반환 받기
		int result = dao.updateMember(conn, member);

		// 3. 트랜잭션 제어 처리
		if (result > 0)
			commit(conn);
		else
			rollback(conn);

		// 4. Connection 반환
		close(conn);

		// 5. 삽입 결과 반환
		return result;
	}
}
