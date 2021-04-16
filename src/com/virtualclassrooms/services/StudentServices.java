package com.virtualclassrooms.services;

import com.virtualclassrooms.model.Student;

public interface StudentServices {
	Student insertNewStudent(String fullname, String username, String password,String email);
	Student verifyStudent(String username, String pass);
}
