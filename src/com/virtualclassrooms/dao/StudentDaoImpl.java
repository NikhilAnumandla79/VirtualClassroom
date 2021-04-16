package com.virtualclassrooms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.virtualclassrooms.model.Student;

public class StudentDaoImpl implements StudentDao {
	public Student insertStudent(Student student) {
		Connection con=null;
		PreparedStatement pstmt =null;
		Statement stmt=null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "INSERT INTO students(student_fullname, student_username, student_password, student_email) VALUES(?,?,?,?)";
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, student.getFullname());
			pstmt.setString(2, student.getUsername());
			pstmt.setString(3, student.getPassword());
			pstmt.setString(4, student.getEmail());
			int i=pstmt.executeUpdate();
			query="select * from students where student_username='"+student.getUsername()+"'";
			stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(query);
			rs.next();
			
			student.setId(rs.getInt("student_id"));
			
			if(i>0) {
				return student;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(stmt != null){
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public Student verifyStudent(String username, String pass) {
		Connection con=null;
		Statement stmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "SELECT * FROM students WHERE student_username='"+username+"' AND student_password='"+pass+"'";
			stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				Student student = new Student();
				student.setFullname(rs.getString("student_fullname"));
				student.setUsername(rs.getString("student_username"));
				student.setPassword(rs.getString("student_password"));
				student.setEmail(rs.getString("student_email"));
				student.setId(rs.getInt("student_id"));
			
				return student;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				if(stmt != null){
					stmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}

	public void insertRequest(int course_id, int student_id) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "INSERT INTO student_requests(course_id, student_id) VALUES(?,?)";
			pstmt= con.prepareStatement(query);
			pstmt.setInt(1, course_id);
			pstmt.setInt(2, student_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return;
		
	}

	public void deleteStudent(int id) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "DELETE from students where student_id='"+id+"'";
			pstmt= con.prepareStatement(query);
			pstmt.executeUpdate();
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return;
		
		
	}

	public void updateStudent(int id, String username, String fullname, String password, String email) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "Update students set student_username='"+username+"', student_fullname='"+fullname+"',student_password='"+password+"', student_email='"+email+"' where student_id='"+id+"'";
			pstmt= con.prepareStatement(query);
			pstmt.executeUpdate();
			System.out.println("updated successfully");
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if(con !=null) {
					con.close();
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			try {
				if(pstmt != null){
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return;
		
	}

	
}
