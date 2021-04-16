package com.virtualclassrooms.services;

import com.virtualclassrooms.dao.AdminDaoImpl;

public class AdminServicesImpl {
	public int insertNewCourse(String course) {
		return new AdminDaoImpl().insertCourse(course);
	}
}
