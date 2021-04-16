package com.virtualclassrooms.services;

import com.virtualclassrooms.dao.TeacherDao;
import com.virtualclassrooms.dao.TeacherDaoImpl;
import com.virtualclassrooms.model.Teacher;

public class TeacherServicesImpl implements TeacherServices {
public Teacher insertNewTeacher(String fullname, String username, String password,String email) {
		
		Teacher teacher =new Teacher(fullname, username, password, email);
		TeacherDao stdao=new TeacherDaoImpl();
		return stdao.insertTeacher(teacher);
		
	}

@Override
public Teacher verifyTeacher(String username, String password) {
	return new TeacherDaoImpl().verifyStudent(username, password);
}

}