package com.yesbulo.cardatacolsystem.test;

import java.util.List;

import com.yesbulo.cardatacolsystem.impl.ObjectDaoImpl;

/**
 * <p>@Title:Test</P>
 * <p>@Description:carDataColSystemManager</P>
 * <p>@Company: RongleXie </P>
 * <p>@author xieqingrong</p>
 * <p>@date 2016-10-13 下午07:55:37</p>
 */
public class Test {
	public static void main(String[] args) {
//		int objectSizeBycond = new ObjectDaoImpl().getObjectSizeBycond("from Users");
//		System.out.println("COUNT:"+objectSizeBycond);
		
		List<?> list = new ObjectDaoImpl().getObjectListBycond("from Users where userName like '%a%'");
		System.out.println(list.get(0).toString());
		
	}
}
