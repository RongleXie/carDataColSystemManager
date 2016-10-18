package com.yesbulo.cardatacolsystem.tools;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


/**
 * 编码过滤器
 * 
 * @author xy
 * 
 */
public class CharacterFilter implements Filter
{
	
	private String encoding;

	public void init(FilterConfig fConfig) throws ServletException
	{
		encoding = fConfig.getInitParameter("encoding");
		//System.out.println("-----------------------------"+encoding);
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
	{
		HttpServletRequest httprequest = (HttpServletRequest) request;
		if ("GET".equals(httprequest.getMethod()))
		{
			// 将httpRequest进行包装
			EncodingHttpServletRequest wrapper = new EncodingHttpServletRequest(httprequest, encoding); 
			try {
				chain.doFilter(wrapper, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else
		{
			try {
				request.setCharacterEncoding(encoding);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.setContentType("text/html;charset=" + encoding);
			try {
				chain.doFilter(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public void destroy()
	{

	}

}


/**
 * httpRequest进行包装类
 * 
 * @author xy
 * 
 */
class EncodingHttpServletRequest extends HttpServletRequestWrapper
{
	private HttpServletRequest request;
	private String encoding;

	public EncodingHttpServletRequest(HttpServletRequest request)
	{
		super(request);
		this.request = request;
	}

	public EncodingHttpServletRequest(HttpServletRequest request,String encoding)
	{
		super(request);
		this.request = request;
		this.encoding = encoding;
		
	}
	@Override
	public String getParameter(String name)
	{
		String value = request.getParameter(name);
		if (null != value)
		{
			try
			{
				// tomcat默认以ISO8859-1处理GET传来的参数。把tomcat上的值用ISO8859-1获取字节流，再转换成UTF-8字符串
				value = new String(value.getBytes("ISO8859-1"), encoding);
			}
			catch (UnsupportedEncodingException e)
			{
				e.printStackTrace();
			}
		}
		return value;
	}

}

