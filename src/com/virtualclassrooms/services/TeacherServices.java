package com.virtualclassrooms.services;

import com.virtualclassrooms.model.Teacher;

public interface TeacherServices {
	Teacher insertNewTeacher(String fullname, String username, String password, String email);

	Teacher verifyTeacher(String username, String password);
}
