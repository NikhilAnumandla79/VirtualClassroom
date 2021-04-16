package com.virtualclassrooms.services;

import com.virtualclassrooms.dao.StudentDao;
import com.virtualclassrooms.dao.StudentDaoImpl;
import com.virtualclassrooms.model.Student;

public class StudentServicesImpl implements StudentServices {
	public Student insertNewStudent(String fullname, String username, String password, String email) {
		
		Student student =new Student(fullname, username, password,email);
		StudentDao stdao=new StudentDaoImpl();
		return stdao.insertStudent(student);
		
	}
	public Student verifyStudent(String username , String pass) {
		return new StudentDaoImpl().verifyStudent(username, pass);
	}

}
