package com.kh.reserved.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.payment.model.service.PaymentService;
import com.kh.reserved.model.dao.ListOfMemTypeDto;
import com.kh.reserved.model.dao.ListOfReserved;
import com.kh.reserved.model.dao.ReserveDao;
import com.kh.reserved.model.vo.PageRequest;
import com.kh.reserved.model.vo.Reserved;

public class ReserveService {

	/** 1. 결제/예매/예매좌석/예매멤버타입 입력
	 * @param payMethod
	 * @param totalCost
	 * @param userNo
	 * @param screenNo
	 * @param seatNo
	 * @param count
	 * @return
	 */
	public Integer reserveMovie(String payMethod, Integer totalCost, Integer userNo, String screenNo, String[] seatNo,
			Map<String, String> count) {

		Connection conn = getConnection();
		Integer result = 0;
		
		//결제 : 결제번호, 결제날짜sysdate, 결제방식, 결제금액, 환불여부(n), 환불날짜
		//예매 : 예매번호, 결제번호, 결제자번호, screenNo
		//예매된좌석 : 예매번호, 좌석번호
		//예매인원 : 예매번호, 분류, 숫자
		//예매회원 예매횟수 카운트 +1 : 결제자번호
		
		Integer resultPayment = new ReserveDao().reservePayment(conn, payMethod, totalCost);
		Integer resultReserve = new ReserveDao().reserveMovie(conn, userNo, screenNo);
		Integer resultRsvSeat = new ReserveDao().reserveSeat(conn, seatNo);
		Integer resultRsvMem = new ReserveDao().reserveMem(conn, count);
		Integer resultRsvMemUpdate = new ReserveDao().reserveMemUpdate(conn, userNo);
		
		result = resultPayment*resultReserve*resultRsvSeat*resultRsvMem*resultRsvMemUpdate;
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	/** 2. 예약 정보 조회
	 * @param userNo 사용자
	 * @return
	 */
	public Reserved reserveInfo(Integer userNo) {
		Connection conn = getConnection();
		
		Reserved reserveInfo = new ReserveDao().reserveInfo(conn, userNo);
		
		close(conn);
		
		return reserveInfo;
	}

	/** 3. 스크린의 이미 예약된 좌석 정보 조회
	 * @param screenNo
	 * @return
	 */
	public List<Integer> reservedSeats(String screenNo) {
		Connection conn = getConnection();
		
		List<Integer> seats = new ReserveDao().reservedSeats(conn, screenNo);
		
		close(conn);
		
		return seats;
	}

	/** 4. 모든 회원의 모든 예약정보 가져오기 (단, 지난예약 정보 제외)
	 * @return
	 */
	public List<ListOfReserved> ListOfAllReserved(PageRequest pageRequest) {
		Connection conn = getConnection();
		
		// 페이지 첫번호/마지막 번호에 맞는 예약정보 조회
		List<ListOfReserved> lor = new ReserveDao().ListOfAllReserved(conn, pageRequest);
		// 각 예약정보의 예약멤버 예약좌석 정보 조회
		List<ListOfMemTypeDto> rsvMemType = new ArrayList<>();
		List<Integer> seatNo = new ArrayList<>();
		
		for(ListOfReserved r : lor) {
			
			rsvMemType = new ReserveDao().reservedMem(conn, r.getReservedNo());
			seatNo = new ReserveDao().reservedSeats(conn, r.getReservedNo());
			
			r.setRsvMemType(rsvMemType);
			r.setSeatNo(seatNo);
		}
		
		close(conn);
		return lor;
	}
	
	/** 5. 전체 예매(상영전) 총갯수받기
	 * @return
	 */
	public int countReserved() {
		Connection conn = getConnection();
		
		int result = new ReserveDao().countReserved(conn);
		
		close(conn);
		return result;
	}


	/** 6. 예매번호에 따른 예매정보 싹 불러오기 (+좌석,멤버 포함)
	 * @param reservedInfoId 예매번호
	 * @return
	 */
	public ListOfReserved findReservedInfo(Integer reservedInfoId) {
		Connection conn = getConnection();
		ListOfReserved reservedInfo = new ReserveDao().findReservedInfo(conn, reservedInfoId);
		
		List<ListOfMemTypeDto> rsvMemType = new ReserveDao().reservedMem(conn, reservedInfo.getReservedNo());
		List<Integer> seatNo = new ReserveDao().reservedSeats(conn, reservedInfo.getReservedNo());
		
		reservedInfo.setRsvMemType(rsvMemType);
		reservedInfo.setSeatNo(seatNo);
		
		close(conn);
		return reservedInfo;
	}

	/** 7. LoginUser No의 모든 예매정보 불러오기
	 * @param userNo
	 * @return
	 */
	public List<ListOfReserved> findServedInfoByUserNo(Integer userNo){
		Connection conn = getConnection();
		
		List<ListOfReserved> lors = new ReserveDao().findServedInfoByUserNo(conn, userNo);
		
		close(conn);
		
		return lors;
	}

	/** 8. LoginUser No로 예매한 총갯수 가져오기
	 * @param userNo
	 * @return
	 */
	public int countReserved(Integer userNo) {
		Connection conn = getConnection();
		
		int result = new ReserveDao().countReserved(conn, userNo);
		
		close(conn);
		return result;
	}

	/** 9. LoginUser No + 페이징 = 예매 정보 불러오기
	 * @param userNo
	 * @param pageRequest
	 * @return
	 */
	public List<ListOfReserved> ListOfOneReserved(Integer userNo, PageRequest pageRequest) {
		Connection conn = getConnection();
		
		List<ListOfReserved> lor = new ReserveDao().ListOfOneReserved(conn, userNo, pageRequest);
		List<ListOfMemTypeDto> rsvMemType = new ArrayList<>();
		List<Integer> seatNo = new ArrayList<>();
		
		for(ListOfReserved r : lor) {
			
			rsvMemType = new ReserveDao().reservedMem(conn, r.getReservedNo());
			seatNo = new ReserveDao().reservedSeats(conn, r.getReservedNo());
			
			r.setRsvMemType(rsvMemType);
			r.setSeatNo(seatNo);
		}
		
		close(conn);
		return lor;
	}


	
}
