package com.yesbulo.cardatacolsystem.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.yesbulo.cardatacolsystem.pojo.Users;
import com.yesbulo.cardatacolsystem.server.HibernateSessionFactory;

public class UserImpl {
	public static Connection conn = null;
	public static PreparedStatement pst = null;
	public static ResultSet rs = null;
	public static String sql = null;
	private SessionFactory sessionFactory = HibernateSessionFactory
			.getSessionFactory();
	private Session session;
	private Transaction tran;

	public UserImpl() {
		// TODO Auto-generated constructor stub
	}

	public List<?> queryAll() {
		try {
			session = sessionFactory.openSession();
			tran = session.beginTransaction();
			String hql = "from users";
			// System.out.println(hql);
			// if (table.equals("Users")) {
			// hql += " and useIscompany<>2";
			// }
			// System.out.println("ObjectDaoImpl.getObjectListByfield()");
			Query query = session.createQuery(hql);
			// System.out.println("查询纪录条件："+field);
			// query.setParameter(0, field);
			// System.out.println("hql查询语句："+hql);
			query.setCacheable(true);// 使用二级缓存
			List<?> list = query.list();
			// System.out.println("查询纪录的条数："+list.size());
			tran.commit();
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<Object>();
		} finally {
			if (session.isOpen())
				session.close();
		}
	}

	public List<?> queryPage(int offset, int pagesize) {
		try {
			session = sessionFactory.openSession();
			tran = session.beginTransaction();
			String hql = "from Users";
			
			Query query = session.createQuery(hql);
			query.setFirstResult(offset);
			query.setMaxResults(pagesize);
			List<?> list = query.list();
			System.out.println(list.size());
			tran.commit();
			return list;
		} catch (Exception e) {
			return new ArrayList<Object>();
		} finally {
			if (session.isOpen())
				session.close();
		}
	}
	
	public List<?> queryPage(int offset, int pagesize, String cond) {
		try {
			session = sessionFactory.openSession();
			tran = session.beginTransaction();
			String hql = "from Users where userName like '%"+cond+"%' or userEmail like '%"+cond+"%'";
			
			Query query = session.createQuery(hql);
			query.setFirstResult(offset);
			query.setMaxResults(pagesize);
			List<?> list = query.list();
			System.out.println(list.size());
			tran.commit();
			return list;
		} catch (Exception e) {
			return new ArrayList<Object>();
		} finally {
			if (session.isOpen())
				session.close();
		}
	}

//	// ��ʾ��һ��
//	public UserPo queryPre(int id) {
//		conn = ConnectionDB.getConnection();
//		sql = "select * from user where id<? order by id desc,id desc limit 1";
//		UserPo user = null;
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setInt(1, id);
//			rs = pst.executeQuery();
//			if (rs.next()) {
//				user = new UserPo();
//				user.setId(rs.getInt("id"));
//				user.setName(rs.getString("name"));
//				user.setPassword(rs.getString("password"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return user;
//
//	}
//
//	// ��ʾ��һ��
//	public UserPo queryNex(int id) {
//		conn = ConnectionDB.getConnection();
//		sql = "select * from user where id>? order by id desc,id desc limit 1";
//		UserPo user = null;
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setInt(1, id);
//			rs = pst.executeQuery();
//			if (rs.next()) {
//				user = new UserPo();
//				user.setId(rs.getInt("id"));
//				user.setName(rs.getString("name"));
//				user.setPassword(rs.getString("password"));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return user;
//
//	}
//
//	public void update(UserPo user) {
//		conn = ConnectionDB.getConnection();
//		sql = "update user set name=?,password=? where id=?";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, user.getName());
//			pst.setString(2, user.getPassword());
//			pst.setInt(3, user.getId());
//			pst.executeUpdate();
//
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	public void add(UserPo user) throws Exception {
//
//		// TODO Auto-generated method stub
//		sql = "INSERT INTO user (name,password) VALUES(?,?)";
//		try {
//			ConnectionDB connDb = new ConnectionDB();
//			conn = connDb.getConnection();
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, user.getName());
//			pst.setString(2, user.getPassword());
//			pst.executeUpdate();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		conn.close();
//	}
//
//	// ��ѯһ����¼
	public Users queryOne(int id) {
		try {
			session = sessionFactory.openSession();
			tran = session.beginTransaction();
			String hql = "from Users where id=" + id;
			//System.out.println(hql);
//			if (table.equals("Users")) {
//				hql += " and useIscompany<>2";
//			}
			//System.out.println("ObjectDaoImpl.getObjectListByfield()");
			Query query = session.createQuery(hql);
			//System.out.println("查询纪录条件："+field);
			//query.setParameter(0, field);
			//System.out.println("hql查询语句："+hql);
			query.setCacheable(true);// 使用二级缓存
			List<?> list = query.list();
			//System.out.println("查询纪录的条数："+list.size());
			Users user = new Users();
			user = (Users) list.get(0);
			tran.commit();
			return user;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (session.isOpen())
				session.close();
		}
		
		
	}
//
//	// ɾ��һ����¼
//	public void delete(int id) {
//		conn = ConnectionDB.getConnection();
//		sql = "delete from user where id=?";
//		try {
//			pst = conn.prepareStatement(sql);
//			pst.setInt(1, id);
//			pst.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public int queryCount() {
//		conn = ConnectionDB.getConnection();
//		sql = "select count(id) from user";
//		int num = 0;
//		try {
//			pst = conn.prepareStatement(sql);
//			rs = pst.executeQuery();
//			if (rs.next())
//				num = rs.getInt(1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return num;
//	}
}
