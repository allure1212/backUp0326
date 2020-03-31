package com.kh.member.model.vo;

import java.sql.Date;

public class Member {
	/* MEMBER_NO */
	private int memberNo;
	/* GRADE */
	private String grade;
	/* ID */
	private String id;
	/* PWD */
	private String pwd;
	/* NAME */
	private String name;
	/* BIRTH */
	private Date birth;
	/* EMAIL */
	private String email;
	/* PHONE */
	private String phone;
	/* TEL */
	private String tel;
	/* GENDER */
	private String gender;
	/* TICKET_COUNT */
	private int ticketCount;
	/* SIGNUP_DATE */
	private Date signupDate;
	/* STATUS */
	private String status;
	/* BLACK_STATUS */
	private String blackStatus;
	/* BLACK_CAUSE */
	private String blackCause;
	/* BLACK_COUNT */
	private int blackCount;

	
	public Member() {

	}
	
	/**
	 * 전체 조회용
	 * @param memberNo
	 * @param grade
	 * @param id
	 * @param pwd
	 * @param name
	 * @param birth
	 * @param email
	 * @param phone
	 * @param tel
	 * @param gender
	 * @param ticketCount
	 * @param signupDate
	 * @param status
	 * @param blackStatus
	 * @param blackCause
	 * @param blackCount
	 */
	public Member(int memberNo, String grade, String id, String pwd, String name, Date birth, String email,
			String phone, String tel, String gender, int ticketCount, Date signupDate, String status,
			String blackStatus, String blackCause, int blackCount) {
		super();
		this.memberNo = memberNo;
		this.grade = grade;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.tel = tel;
		this.gender = gender;
		this.ticketCount = ticketCount;
		this.signupDate = signupDate;
		this.status = status;
		this.blackStatus = blackStatus;
		this.blackCause = blackCause;
		this.blackCount = blackCount;
	}
	
	
	

	/**
	 * 회원가입용
	 * @param id
	 * @param pwd
	 * @param name
	 * @param email
	 * @param phone
	 * @param tel
	 * @param gender
	 */
	public Member(String id, String pwd, String name, String email, String phone, String tel,
			String gender) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.tel = tel;
		this.gender = gender;
	}

	/**
	 * 수정용
	 * @param email
	 * @param phone
	 * @param tel
	 */
	public Member(String email, String phone, String tel, String id) {
		super();
		this.email = email;
		this.phone = phone;
		this.tel = tel;
		this.id = id;
	}
	
	/** 관리자 회원 리스트
	 * @param memberNo
	 * @param id
	 * @param name
	 * @param grade
	 * @param gender
	 * @param signupDate
	 * @param status
	 */
	public Member(int memberNo, String id, String name, String grade, String gender, Date signupDate, String status) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.name = name;
		this.grade = grade;
		this.gender = gender;
		this.signupDate = signupDate;
		this.status = status;
	}

	/** 관리자 회원 상세보기
	 * @param name
	 * @param memberNo
	 * @param id
	 * @param birth
	 * @param gender
	 * @param email
	 * @param phone
	 * @param tel
	 * @param grade
	 * @param signupDate
	 * @param status
	 * @param blackStatus
	 * @param blackCause
	 */
	public Member(String name, int memberNo, String id, Date birth, String gender, String email, String phone,
			String tel, String grade, Date signupDate, String status, String blackStatus, String blackCause) {
		super();
		this.name = name;
		this.memberNo = memberNo;
		this.id = id;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.tel = tel;
		this.grade = grade;
		this.signupDate = signupDate;
		this.status = status;
		this.blackStatus = blackStatus;
		this.blackCause = blackCause;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}

	public Object getSignupDate() {
		return signupDate;
	}

	public void setSignupDate(Date signupDate) {
		this.signupDate = signupDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBlackStatus() {
		return blackStatus;
	}

	public void setBlackStatus(String blackStatus) {
		this.blackStatus = blackStatus;
	}

	public String getBlackCause() {
		return blackCause;
	}

	public void setBlackCause(String blackCause) {
		this.blackCause = blackCause;
	}

	public int getBlackCount() {
		return blackCount;
	}

	public void setBlackCount(int blackCount) {
		this.blackCount = blackCount;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", grade=" + grade + ", id=" + id + ", pwd=" + pwd + ", name=" + name
				+ ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", tel=" + tel + ", gender=" + gender
				+ ", ticketCount=" + ticketCount + ", signupDate=" + signupDate + ", status=" + status
				+ ", blackStatus=" + blackStatus + ", blackCause=" + blackCause + ", blackCount=" + blackCount + "]";
	}

}