package com.virtualclassrooms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.virtualclassrooms.model.Teacher;

public class TeacherDaoImpl implements TeacherDao{
	public Teacher insertTeacher(Teacher teacher) {
		Connection con=null;
		PreparedStatement pstmt =null;
		Statement stmt=null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "INSERT INTO teachers(teacher_fullname, teacher_username, teacher_password,teacher_email) VALUES(?,?,?,?)";
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, teacher.getFullname());
			pstmt.setString(2, teacher.getUsername());
			pstmt.setString(3, teacher.getPassword());
			pstmt.setString(4, teacher.getEmail());

			int i=  pstmt.executeUpdate();
			query="select * from teachers where teacher_username='"+teacher.getUsername()+"'";
			stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			rs.next();
			teacher.setId(rs.getInt("teacher_id"));
			if(i>0) {
				return teacher;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(stmt != null){
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public Teacher verifyStudent(String username, String password) {
		Connection con=null;
		Statement stmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "SELECT * FROM teachers WHERE teacher_username='"+username+"' AND teacher_password='"+password+"'";
			stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setFullname(rs.getString("teacher_fullname"));
				teacher.setUsername(rs.getString("teacher_username"));
				teacher.setPassword(rs.getString("teacher_password"));
				teacher.setEmail(rs.getString("teacher_email"));
				teacher.setId(rs.getInt("teacher_id"));
			
				return teacher;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(stmt != null){
					stmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void insertRequest(int courseId, int teacherId) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "INSERT INTO teacher_requests(course_id, teacher_id) VALUES(?,?)";
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, courseId);
			pstmt.setInt(2, teacherId);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void deleteStudent(int id) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "DELETE from teachers where teacher_id='"+id+"'";
			pstmt= con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void updateTeacher(int id, String username, String fullname, String password, String email) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "Update teachers set teacher_username='"+username+"', teacher_fullname='"+fullname+"',teacher_password='"+password+"', teacher_email='"+email+"' where teacher_id='"+id+"'";
			pstmt= con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public void updateStudentMarks(int studentId, int studentMarks, int courseId) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "Update student_requests set student_marks='"+studentMarks+"' where student_id='"+studentId+"' and course_id='"+courseId+"' and request_status='"+"approved"+"'";
			pstmt= con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
