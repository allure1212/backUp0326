package com.kh.lostarticle.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.lostarticle.model.service.LostarticleService;
import com.kh.lostarticle.model.vo.Lostarticle;

/**
 * Servlet implementation class LostarticleReplyServlet
 */
@WebServlet("/reply.lo")
public class LostarticleReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LostarticleReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String replyContent = request.getParameter("replyContent");
		int lostNo = Integer.parseInt(request.getParameter("lostNo"));
		
		Lostarticle l = new Lostarticle();
		l.setReplyContent(replyContent);
		l.setLostNo(lostNo);
		int result = new LostarticleService().replyLost(l);
		
		if(result > 0) {
			response.sendRedirect("adminDetail.lo");
		}else {
			request.setAttribute("msg", "분실문 문의 답변 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
