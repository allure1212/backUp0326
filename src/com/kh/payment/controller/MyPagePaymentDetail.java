package com.kh.payment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.vo.Member;
import com.kh.payment.model.service.PaymentService;
import com.kh.reserved.model.dao.ListOfReserved;
import com.kh.reserved.model.vo.PageInfo;
import com.kh.reserved.model.vo.PageRequest;

/**
 * Servlet implementation class MyPagePaymentDetail
 */
@WebServlet("/paymentDetail.do")
public class MyPagePaymentDetail extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPage = request.getParameter("currentPage");
		String countPerPage = "6";
		PageRequest pageRequest = new PageRequest(currentPage, countPerPage);
		
		HttpSession session = request.getSession();
		Integer userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 1명의 총 예매갯수(현재시간이후의)
		int totalCount = new PaymentService().countPaymentByUserNo(userNo);
		// 하단 페이지 표시 정보
		PageInfo pageInfo = new PageInfo(totalCount, pageRequest);
		
		List<ListOfReserved> lop = new PaymentService().ListOfOnePayment(userNo, pageRequest);
		
		request.setAttribute("lop", lop);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("views/payment/myPagePaymentDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
