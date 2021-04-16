package com.virtualclassrooms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentStaffDaoImpl {
	public void postQuestion(String question, String fullname, int course_id) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "Insert into questions(question,questioner,course_id) values(?,?,?)";
			pstmt= con.prepareStatement(query);
			pstmt.setString(1,question);
			pstmt.setString(2,fullname);
			pstmt.setInt(3,course_id);
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

	public void postAnswer(String reply, int question_id, String responder) {
		Connection con=null;
		PreparedStatement pstmt =null;
		try {
			con = new DbConnectionImpl().getConnection();
			String query = "Insert into answers(answer,question_id,responder) values(?,?,?)";
			pstmt= con.prepareStatement(query);
			pstmt.setString(1,reply);
			pstmt.setInt(2,question_id);
			pstmt.setString(3,responder);
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
}
