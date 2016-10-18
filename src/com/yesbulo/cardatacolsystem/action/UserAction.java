package com.yesbulo.cardatacolsystem.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.mail.Flags.Flag;
import javax.servlet.http.HttpServletRequest;


import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;
import com.yesbulo.cardatacolsystem.impl.ObjectDaoImpl;
import com.yesbulo.cardatacolsystem.pojo.Users;
import com.yesbulo.cardatacolsystem.server.ObjectDao;
import com.yesbulo.cardatacolsystem.tools.MailSend;

/**
 * <p>@Title:UserAction</P>
 * <p>@Description:carDataColSystem</P>
 * <p>@Company: RongleXie </P>
 * <p>@author xieqingrong</p>
 * <p>@date 2016-9-2 下午03:07:31
 */
public class UserAction extends ActionSupport{
	
	private static ObjectDao objectDao = new ObjectDaoImpl();
	
	/** 获取Dao */
	public ObjectDao giveDao() {
		if (objectDao == null)
			objectDao = new ObjectDaoImpl();
		return objectDao;
	}	
	
	private Users user;
	private String rolename;
	
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}

	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}

	public String queryPage() throws Exception{
		//System.out.println("UserAction.queryPage()");
		HttpServletRequest request=ServletActionContext.getRequest();
		String offsetstr=request.getParameter("pager.offset");
		String pagesizestr =request.getParameter("pagesize");

		int offset=0;
		int pagesize=10;
		
		if(offsetstr!=null)
			offset=Integer.parseInt(offsetstr);
		if(pagesizestr!=null)
			pagesize=Integer.parseInt(pagesizestr);
		request.setAttribute("initsize", offset);
		List<?> some =objectDao.queryPage("Users order by insertTime DESC",offset, pagesize);
		int count =objectDao.getObjectSizeBycond("from Users");
		
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("all", some);
		
		return null;
	}
	
	public String queryOne() throws Exception{
		//System.out.println("UserAction.queryOne()");
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr=request.getParameter("id");
		if(idstr!=null && idstr!=""){
			Users user=(Users) objectDao.getObjectById(Users.class, Integer.parseInt(idstr));
			
			if(user!=null){
				//user.setClicknum(user.getClicknum()+1);
//				userDao.update(user);
			}
//			UserPo userPre=userDao.queryPre(Integer.parseInt(idstr));
//			UserPo userNex=userDao.queryNex(Integer.parseInt(idstr));
//			request.setAttribute("userPre", userPre);
//			request.setAttribute("userNex", userNex);
			request.setAttribute("user",user);
			
		}
		return null;
	}
	
	
	public String adminQueryPage() throws Exception{
		//System.out.println("UserAction.adminQueryPage()");
		HttpServletRequest request=ServletActionContext.getRequest();
		String offsetstr=request.getParameter("pager.offset");
		String pagesizestr =request.getParameter("pagesize");
		int offset=0;
		int pagesize=10;
		if(offsetstr!=null)
			offset=Integer.parseInt(offsetstr);
		if(pagesizestr!=null)
			pagesize=Integer.parseInt(pagesizestr);
		request.setAttribute("initsize", offset);
		//System.out.println("+++++"+offset+"++++"+pagesize);
		List<?> user =objectDao.queryPage("Users order by insertTime DESC",offset,pagesize);
		int count =objectDao.getObjectSizeBycond("from Users");
		//System.out.println("count:"+count);
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("user", user);
		
		return "adminUserList";
	}
	
	public String searchPage() throws Exception{
		//System.out.println("UserAction.searchPage()");
		HttpServletRequest request=ServletActionContext.getRequest();
		String offsetstr=request.getParameter("pager.offset");
		String pagesizestr =request.getParameter("pagesize");
		int offset=0;
		int pagesize=10;
		if(offsetstr!=null)
			offset=Integer.parseInt(offsetstr);
		if(pagesizestr!=null)
			pagesize=Integer.parseInt(pagesizestr);
		request.setAttribute("initsize", offset);
		//System.out.println("+++++"+offset+"++++"+pagesize);
//		byte[] jiema= rolename.getBytes("iso-8859-1") ; //解码  
//		String bianma = new String(jiema,"UTF-8");//编码 如果上面的解码不对 可能出现问题  
//		System.out.println("+++++++++++++++++++bianma:"+bianma);
		//System.out.println("rolename:" +rolename);
		List<?> user =objectDao.queryPage(offset,pagesize,"" +
				"from Users where userName like '%"+rolename+"%' " +
				"or userEmail like '%"+rolename+"%'" +
						"order by insertTime DESC");
		int count =objectDao.getObjectSizeBycond("" +
				"from Users where userName like '%"+rolename+"%' " +
						"or userEmail like '%"+rolename+"%'" +
								"order by insertTime DESC");
		//System.out.println("count:"+count);
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("user", user);
		
		return "adminUserList";
	}
	
	
	
	public String update() {
		//System.out.println("UserAction.update()");
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr = request.getParameter("id");
		if (idstr != null) {
			//user.setId(Integer.parseInt(idstr));
		}
		Users u = (Users) objectDao.getObjectById(Users.class, Integer.parseInt(idstr));
		if (null != u) {
			u.setUserName(user.getUserName());
			u.setUserPwd(user.getUserPwd());
		}
		
		//System.out.println(u.toString());
		try {
			objectDao.saveOrUpdate(u);
			//objectDao.update();
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
	}

	public String add() {
		System.out.println("UserAction.add()");
		try {
			user.setUpdateTime(new Date());
			user.setInsertTime(new Date());
			user.setTotalpoints(0.0);
			user.setValidpoints(0.0);
			user.setUserKey("0");
			user.setUserPhone("0");
			objectDao.saveOrUpdate(user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String delete() throws Exception{
		//System.out.println("UserAction.delete()");
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr=request.getParameter("id");
		if(idstr!=null){
			//objectDao.delete(user);
			objectDao.delete(Users.class, Integer.parseInt(idstr));
			return adminQueryPage();
		}else{
			return "fail";
		}
	}
}
