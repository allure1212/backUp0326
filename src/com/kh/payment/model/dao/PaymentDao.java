package com.kh.payment.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.payment.model.vo.Payment;
import com.kh.reserved.model.dao.ListOfReserved;
import com.kh.reserved.model.vo.PageRequest;

public class PaymentDao {

	Properties prop = new Properties();
	public PaymentDao(){ //기본생성자
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 1. 예매번호로 결제번호 조회하기
	 * @param conn
	 * @param paymentNo
	 * @return
	 */
	public Payment paymentInfo(Connection conn, int paymentNo) {
		Payment paymentInfo = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("paymentInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, paymentNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				paymentInfo = new Payment(rset.getInt("PAYMENT_NO"), rset.getDate("DATE"),
						rset.getString("TYPE"), rset.getInt("AMOUNT"), rset.getString("REFUND_STATUS"),
						rset.getDate("REFUND_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return paymentInfo;
	}

	/** 2. 예매번호로 결제취소하기
	 * @param conn
	 * @param reservedNo
	 * @return
	 */
	public int cancelPayment(Connection conn, String reservedNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("cancelPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservedNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	/** 2_2. 결제 취소시 회원의 예매횟수 -1
	 * @param conn
	 * @param reservedNo
	 * @return
	 */
	public int downCount(Connection conn, String reservedNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("downCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservedNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	/** 3. 회원번호로 결제완료(이미본) 영화 리스트 가져오기(myPage홈화면)
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public List<PaymentDto> watchedMovie(Connection conn, int userNo) {
		List<PaymentDto> pd = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("myPageMainPayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pd.add(new PaymentDto(rset.getString("TITLE"),
						rset.getInt("AGE_LIMIT"), rset.getTimestamp("SCREEN_DATE"),
						rset.getString("MODIFY_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return pd;
	}

	/** 4. 회원번호로 결제완료된 영화 총갯수 구하기
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int countPaymentByUserNo(Connection conn, Integer userNo) {
		int countPayment = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("countPaymentByUserNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			countPayment = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return countPayment;
	}

	/** 5. 회원정보+페이징 갯수에 맞춰 결제완료 정보 가져오기
	 * @param conn
	 * @param userNo
	 * @param pageRequest
	 * @return
	 */
	public List<ListOfReserved> ListOfOnePayment(Connection conn, Integer userNo, PageRequest pageRequest) {
		List<ListOfReserved> lop = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("onePayment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, pageRequest.getOffset());
			pstmt.setInt(3, pageRequest.getLimit());
			rset = pstmt.executeQuery();
			while(rset.next()) {
				lop.add(new ListOfReserved(rset.getInt("RESERVED_NO"), rset.getTimestamp("PAYMETN_DATE"),
						rset.getString("T_NAME"), rset.getString("R_NAME"), rset.getString("TITLE"), 
						rset.getInt("AGE_LIMIT"), rset.getTimestamp("SCREEN_DATE"), rset.getInt("PAYMENT_NO"),
						rset.getInt("AMOUNT"), rset.getString("TYPE"),
						rset.getInt("MEMBER_NO"), rset.getString("ID"), rset.getString("MODIFY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return lop;
	}

}
