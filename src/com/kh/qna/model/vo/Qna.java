package com.kh.qna.model.vo;

import java.sql.Date;

public class Qna {
   /* QNA_NO */
   private int qnaNo;

   /* MEMBER_NO */
   private int memberNo;

   /* TITLE */
   private String title;

   /* TYPE */
   private String type;

   /* KIND */
   private String kind;

   /* REG_DATE */
   private Date regDate;

   /* REPLY_DATE */
   private Date replyDate;

   /* SECRET_STATUS */
   private String secretStatus;

   /* SECRET_PWD */
   private String secretPwd;

   /* CONTENT */
   private String content;

   /* REPLY_CONTENT */
   private String replyContent;

   /* REPLY_STATUS */
   private String replyStatus;

   public Qna() {
	   
   }

public Qna(int qnaNo, int memberNo, String title, String type, String kind, Date regDate, Date replyDate,
		String secretStatus, String secretPwd, String content, String replyContent, String replyStatus) {
	super();
	this.qnaNo = qnaNo;
	this.memberNo = memberNo;
	this.title = title;
	this.type = type;
	this.kind = kind;
	this.regDate = regDate;
	this.replyDate = replyDate;
	this.secretStatus = secretStatus;
	this.secretPwd = secretPwd;
	this.content = content;
	this.replyContent = replyContent;
	this.replyStatus = replyStatus;
}

public Qna(int qnaNo, String type, String kind, String title, String replyStatus) {
	super();
	this.qnaNo = qnaNo;
	this.type = type;
	this.kind = kind;
	this.title = title;
	this.replyStatus = replyStatus;
}

public Qna(int qnaNo, String type, String kind, int memberNo, Date regDate, String title, String content,String replyContent, String replyStatus) {
	super();
	this.qnaNo = qnaNo;
	this.type = type;
	this.kind = kind;
	this.memberNo = memberNo;
	this.regDate = regDate;
	this.title = title;
	this.content = content;
	this.replyContent = replyContent;
	this.replyStatus = replyStatus;
}

public int getQnaNo() {
	return qnaNo;
}

public void setQnaNo(int qnaNo) {
	this.qnaNo = qnaNo;
}

public int getMemberNo() {
	return memberNo;
}

public void setMemberNo(int memberNo) {
	this.memberNo = memberNo;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public String getKind() {
	return kind;
}

public void setKind(String kind) {
	this.kind = kind;
}

public Object getRegDate() {
	return regDate;
}

public void setRegDate(Date regDate) {
	this.regDate = regDate;
}

public Object getReplyDate() {
	return replyDate;
}

public void setReplyDate(Date replyDate) {
	this.replyDate = replyDate;
}

public String getSecretStatus() {
	return secretStatus;
}

public void setSecretStatus(String secretStatus) {
	this.secretStatus = secretStatus;
}

public String getSecretPwd() {
	return secretPwd;
}

public void setSecretPwd(String secretPwd) {
	this.secretPwd = secretPwd;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getReplyContent() {
	return replyContent;
}

public void setReplyContent(String replyContent) {
	this.replyContent = replyContent;
}

public String getReplyStatus() {
	return replyStatus;
}

public void setReplyStatus(String replyStatus) {
	this.replyStatus = replyStatus;
}

@Override
public String toString() {
	return "Qna [qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", title=" + title + ", type=" + type + ", kind=" + kind
			+ ", regDate=" + regDate + ", replyDate=" + replyDate + ", secretStatus=" + secretStatus + ", secretPwd="
			+ secretPwd + ", content=" + content + ", replyContent=" + replyContent + ", replyStatus=" + replyStatus
			+ "]";
}

}
