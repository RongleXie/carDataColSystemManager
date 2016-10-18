package com.yesbulo.cardatacolsystem.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import net.sf.json.JSONArray;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.yesbulo.cardatacolsystem.pojo.Cardata;
import com.yesbulo.cardatacolsystem.pojo.Points;
import com.yesbulo.cardatacolsystem.pojo.PointsRule;
import com.yesbulo.cardatacolsystem.pojo.Users;
import com.yesbulo.cardatacolsystem.impl.ObjectDaoImpl;
import com.yesbulo.cardatacolsystem.server.HibernateSessionFactory;
import com.yesbulo.cardatacolsystem.server.ObjectDao;
import com.yesbulo.cardatacolsystem.tools.GetLocation;

/**
 * <p>@Title:CardataAction</P>
 * <p>@Description:carDataColSystem</P>
 * <p>@Company: RongleXie</P>
 * <p>@author xieqingrong</p>
 * <p>@date 2016-9-4 下午01:30:18</p>
 */
public class CardataAction {

	private static ObjectDao objectDao = new ObjectDaoImpl();
	
	/** 获取Dao */
	public ObjectDao giveDao() {
		if (objectDao == null)
			objectDao = new ObjectDaoImpl();
		return objectDao;
	}	
	
	private Cardata cardata;
	private String rolename;
	
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public Cardata getCardata() {
		return cardata;
	}
	public void setCardata(Cardata cardata) {
		this.cardata = cardata;
	}
	
	public String queryPage() throws Exception{
		System.out.println("CardataAction.queryPage()");
		HttpServletRequest request=ServletActionContext.getRequest();
		String offsetstr=request.getParameter("pager.offset");
		String pagesizestr =request.getParameter("pagesize");

		int offset=0;
		int pagesize=10;
		
		if(offsetstr!=null)
			offset=Integer.parseInt(offsetstr);
		if(pagesizestr!=null)
			pagesize=Integer.parseInt(pagesizestr);
		List<?> some =objectDao.queryPage("Cardata",offset, pagesize);
		int count =objectDao.getObjectSizeBycond("from Cardata");
		
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("all", some);
		
		return null;
	}
	
	public String queryOne() throws Exception{
		System.out.println("UserAction.queryOne()");
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr=request.getParameter("id");
		if(idstr!=null && idstr!=""){
			Cardata cardata=(Cardata) objectDao.getObjectById(Cardata.class, Integer.parseInt(idstr));
			
			if(cardata!=null){
				//user.setClicknum(user.getClicknum()+1);
//				userDao.update(user);
			}
//			UserPo userPre=userDao.queryPre(Integer.parseInt(idstr));
//			UserPo userNex=userDao.queryNex(Integer.parseInt(idstr));
//			request.setAttribute("userPre", userPre);
//			request.setAttribute("userNex", userNex);
			request.setAttribute("cardata",cardata);
			
		}
		return null;
	}
	
	
	public String adminQueryPage() throws Exception{
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
		System.out.println("+++++"+offset+"++++"+pagesize);
		List<?> cardata =objectDao.queryPage("Cardata order by cardataTime DESC",offset,pagesize);
		int count =objectDao.getObjectSizeBycond("from Cardata");
		System.out.println("count:"+count);
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("cardata", cardata);
		
		return "adminCarDataList";
	}
	
	public String searchPage() throws Exception{
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
		request.setAttribute("rolename", rolename);
		System.out.println("+++++"+offset+"++++"+pagesize);
//		byte[] jiema= rolename.getBytes("iso-8859-1") ; //解码  
//		String bianma = new String(jiema,"UTF-8");//编码 如果上面的解码不对 可能出现问题  
//		System.out.println("+++++++++++++++++++bianma:"+bianma);
		System.out.println("rolename:" +rolename);
		List<?> cardata =objectDao.queryPage(offset,pagesize,"" +
				"from Cardata where " +
				"	userEmail like '%"+rolename+"%' " +
				"or cardataSpeed like '%"+rolename+"%'" +
				"or cardataAcceleration like '%"+rolename+"%'"+
				"or cardataLongitude like '%"+rolename+"%'"+
				"or cardataLatitude like '%"+rolename+"%'"+
				"or cardataAltitude like '%"+rolename+"%'"+
				"or cardataSlope like '%"+rolename+"%'"+
				"order by cardataTime DESC");
		int count =objectDao.getObjectSizeBycond("" +
				"from Cardata where " +
				"	userEmail like '%"+rolename+"%' " +
				"or cardataSpeed like '%"+rolename+"%'" +
				"or cardataAcceleration like '%"+rolename+"%'"+
				"or cardataLongitude like '%"+rolename+"%'"+
				"or cardataLatitude like '%"+rolename+"%'"+
				"or cardataAltitude like '%"+rolename+"%'"+
				"or cardataSlope like '%"+rolename+"%'"+
				"order by cardataTime DESC");
		System.out.println("count:"+count);
		request.setAttribute("count", Integer.valueOf(count));
		request.setAttribute("cardata", cardata);
		
		return "adminCarDataList";
	}
	
	
	
	public String update() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr = request.getParameter("id");
		if (idstr != null) {
			//user.setId(Integer.parseInt(idstr));
		}
		Cardata u = (Cardata) objectDao.getObjectById(Cardata.class, Integer.parseInt(idstr));
		if (null != u) {
			//u.setUserName(cardata.getUserName());
			//u.setUserPwd(cardata.getUserPwd());
		}
		
		System.out.println(u.toString());
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
		try {
			cardata.setUpdateTime(new Date());
			cardata.setInsertTime(new Date());
			
			objectDao.saveOrUpdate(cardata);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	public String delete() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String idstr=request.getParameter("id");
		if(idstr!=null){
			//objectDao.delete(user);
			objectDao.delete(Cardata.class, Integer.parseInt(idstr));
			return adminQueryPage();
		}else{
			return "fail";
		}
	}
}
