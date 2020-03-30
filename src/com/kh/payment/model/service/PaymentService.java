package com.kh.payment.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.kh.payment.model.dao.PaymentDao;
import com.kh.payment.model.dao.PaymentDto;
import com.kh.payment.model.vo.Payment;
import com.kh.reserved.model.dao.ListOfReserved;
import com.kh.reserved.model.vo.PageRequest;

public class PaymentService {

	/** 1. 예매번호로 결제번호 조회하기
	 * @param reservedNo 예매번호
	 * @return
	 */
	public Payment paymentInfo(int paymentNo) {
		Connection conn = getConnection();
		
		Payment paymentInfo = new PaymentDao().paymentInfo(conn, paymentNo);
		
		close(conn);
		return paymentInfo;
	}

	/** 2. 예매번호로 결제취소하기
	 * @param reservedNo
	 * @return
	 */
	public int cancelPayment(String reservedNo) {
		Connection conn = getConnection();
		
		int resultCancel = new PaymentDao().cancelPayment(conn, reservedNo);
		int resultDownCount = new PaymentDao().downCount(conn, reservedNo);
		
		if(resultCancel*resultDownCount>0) {
			commit(conn);
		}else {
			rollback(conn);
			return 0;
		}
		
		return 1;
	}
	
	/** 3. 회원번호로 결제완료(이미본) 영화 리스트 가져오기(myPage홈화면)
	 * @param userNo
	 * @return
	 */
	public List<PaymentDto> watchedMovie(int userNo){
		Connection conn = getConnection();
		List<PaymentDto> pd = new PaymentDao().watchedMovie(conn, userNo);
		close(conn);
		return pd;
	}

	/** 4. 회원번호로 결제완료 총갯수 가져오기
	 * @param userNo
	 * @return
	 */
	public int countPaymentByUserNo(Integer userNo) {
		Connection conn = getConnection();
		int countPayment = new PaymentDao().countPaymentByUserNo(conn, userNo);
		close(conn);
		return countPayment;
	}

	/** 5. 회원정보+페이징 갯수에 맞춰 결제완료 정보 가져오기
	 * @param userNo
	 * @param pageRequest
	 * @return
	 */
	public List<ListOfReserved> ListOfOnePayment(Integer userNo, PageRequest pageRequest) {
		Connection conn = getConnection();
		List<ListOfReserved> lop = new PaymentDao().ListOfOnePayment(conn, userNo, pageRequest);
		close(conn);
		return lop;
	}

}
