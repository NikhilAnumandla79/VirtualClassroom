package com.virtualclassrooms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDaoImpl {
	public int insertCourse(String course) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="INSERT INTO courses(course_name) VALUES(?)";
			
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, course);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return 0;
	}

	public void deleteCourse(int courseId) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="Delete from courses where course_id='"+courseId+"'";
			
			pstmt=con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	public void approveStudent(int courseId, int studentId) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="Update student_requests set request_status='approved' where course_id='"+courseId+"' and student_id='"+studentId+"'";
			
			pstmt=con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	public void approveTeacher(int courseId, int teacherId) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="Update teacher_requests set request_status='approved' where course_id='"+courseId+"' and teacher_id='"+teacherId+"'";
			
			pstmt=con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	public void deleteTeacherRequest(int courseId, int teacherId) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="delete from teacher_requests where course_id='"+courseId+"' and teacher_id='"+teacherId+"'";
			
			pstmt=con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	public void deleteStudentRequest(int courseId, int studentId) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="delete from student_requests where course_id='"+courseId+"' and student_id='"+studentId+"'";
			
			pstmt=con.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	public void addVideo(int courseId, String filepath, String user, String title) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="INSERT INTO videos(course_id,video_filepath,uploader,video_title) VALUES(?,?,?,?)";
			
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, courseId);
			pstmt.setString(2, filepath);
			pstmt.setString(3, user);
			pstmt.setString(4,title);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	public void approveVideo(int videoId, String operation) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="Update videos set video_status=? where video_id='"+videoId+"'";
			
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, operation);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

	}

	public void deleteVideo(int videoId) {
		PreparedStatement pstmt = null ;
		try(Connection con =new DbConnectionImpl().getConnection()){
			String query="Delete from videos where video_id='"+videoId+"'";
			
			pstmt=con.prepareStatement(query);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
	}

	
}
