package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;
import com.kh.member.model.vo.PageInfo;

public class MemberService {

	
	/** 1. 로그인 멤버 (고요한)
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);

		close(conn);
	
		return loginUser;
	}
	
	
	/** 2. 회원가입 (고요한)
	 * @param mem
	 * @param birth
	 * @return
	 */
	public int insertMember(Member mem, String birth) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, mem, birth);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	
	
	}
	
	
	/** 3. 멤버정보 조회 (고요한)
	 * @param userId
	 * @return
	 */
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member mem = new MemberDao().selectMember(conn, userId);
		
		close(conn);
		
		return mem;
	}

	
	/** 4. 멤버정보 업데이트 (고요한)
	 * @param m
	 * @return
	 */
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
		
	}
	

	/** 5. 멤버비번 업데이트 (고요한)
	 * @param id
	 * @param userPwd
	 * @param newPwd
	 * @return
	 */
	public int updatePwdMember(String id, String userPwd, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwdMember(conn, id, userPwd, newPwd);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	

	/** 6. 멤버탈퇴 고요한
	 * @param userId
	 * @param userPwd
	 * @return
	 */
	public int deleteMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	/** 7. 아이디 찾기 고요한
	 * @param name
	 * @param email
	 * @return
	 */
	public Member findId(String name, String email) {
		Connection conn = getConnection();
		
		Member findIdMem = new MemberDao().findId(conn, name, email);
		
		close(conn);
		
		return findIdMem;
		
		
		}
	

	/** 8. 비밀번호 찾기 고요한
	 * @param pId
	 * @param pName
	 * @param pPhone
	 * @return
	 */
	public Member findPwd(String pId, String pName, String pPhone) {
		
		Connection conn = getConnection();
		
		Member findPwdMem = new MemberDao().findPwd(conn, pId, pName, pPhone);
		
		close(conn);
		
		return findPwdMem;
		
		
	}
	
	/**
	 * 아이디 중복 체크
	 * @param userId
	 * @return
	 */
	public int idCheck(String userId) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}
	
	/** 관리자 회원 리스트 총 개수
	 * @return
	 */
	public int adminListCount() {
		Connection conn = getConnection();
		
		int listCount = new MemberDao().adminListCount(conn);
		
		close(conn);
		
		return listCount;
	}
	
	/** 관리자 회원 리스트
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	/** 관리자 회원 상세보기
	 * @param memberNo
	 * @return
	 */
	public Member selectAdminMember(int memberNo) {
		Connection conn = getConnection();
		
		Member m = null;
		
		m = new MemberDao().selectAdminMember(conn, memberNo);
		
		close(conn);
		
		return m;
	}
	
}