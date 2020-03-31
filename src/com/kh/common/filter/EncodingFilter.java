package com.kh.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 */

/*
 * Filter : 어떤 서블릿이 실행되기 전 공통적으로 처리해야할 내용이 있을 경우 필터를 거쳐가게끔 할 수 있음
 * 
 * * Filter 클래스 라이프 사이클
 * 1) init() : Filter 클래스 생성
 * 2) doFilter() : 필터가 실행될 내용(서블릿 전 후에 공통적으로 실행할 구문 작성하면됨)
 * 3) destroy() : 소멸
 * 
 * * 만들어지 Filter클래스를 등록시키는 방법 2가지 (둘 중에 하나 쓰면 됨)
 * 1) 어노테이션 방법
 *    > 해당 이 필터 클래스 위에 @WebFilter 어노테이션을 활용해서
 *      어떤 서블릿이 실행되기 전에 이 필터를 거쳐갈건지 지정하는 방법
 * 
 * 2) web.xml에 등록하는 방법
 *    > web.xml에 이 필터클래스를 등록하고 어떤 서블릿이 실행되기 전에 이필터를 거쳐갈건지 지정하는 방법
 * 
 */
//@WebFilter(filterName="encodingFilter", urlPatterns="/*")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// chain : 그 다음 목적지 (ex. 이 필터가 첫번째 필터일 경우 chain은 그다음필터/ 
		//					   ex. 이 필터가 마지막 필터일 경우 chain은 서블릿이 됨)
		
		// chain.doFilter() 코드 이전 영역 : 서블릿 실행 전에 공통적으로 실행되는 부분
		//System.out.println("=== 인코딩 필터 동작함 ===");
		
		// 요청방식이 post 또는 POST일 경우 인코딩 작업하게끔
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")) {
			request.setCharacterEncoding("utf-8");
		}
		
		chain.doFilter(request, response);
		
		
		// chain.doFilter() 코드 이후 영역 : 서블릿 실행 후 공통적으로 실행되는 구문
		//System.out.println("=== 서블릿 이후 출력 ===");
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
