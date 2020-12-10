package com.proj.cookingAndCook.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.After;
import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.proj.security.CustomNoOpPasswordEncoder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
  "file:src/main/webapp/WEB-INF/spring/root-context.xml",
  "file:src/main/webapp/WEB-INF/spring/appServlet/security-context.xml"
  })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)  // JUnit 의 실행 순서를 메소드 이름 순으로 
public class RecommendTests {

	// 자동 주입 받을 PasswordEncoder 와 DataSource 객체
	private CustomNoOpPasswordEncoder pwencoder;
	private DataSource ds;
  
	public CustomNoOpPasswordEncoder getPwencoder() {return pwencoder;}
	@Autowired
	public void setPwencoder(CustomNoOpPasswordEncoder pwencoder) {this.pwencoder = pwencoder;}
	public DataSource getDs() {return ds;}
	@Autowired
	public void setDs(DataSource ds) {this.ds = ds;}


	Connection conn = null;
	PreparedStatement pstmt = null;
	final String SQL_INSERT_R_LIKE = "INSERT INTO R_LIKE (user_id, user_rid, preference)"
			+ " VALUES(?,?,?)";
 
	@Before // org.junit.Before
	public void initialize() {
		System.out.println("RecommendTests 시작");
		try {
			conn = ds.getConnection();   // DataSource 에서 Connection 받아옴.
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	} // end initialize()
  
	@Test
	public void testA_InsertMember() {
		System.out.println("testA_InsertRecommend() 실행");
		
		if(conn == null) return;
		
		int cnt = 0;
		int arr1 [][] = new int [999][3];
 		try {
			pstmt = conn.prepareStatement(SQL_INSERT_R_LIKE);
			// 100명의 테스트용 데이터 생성
			for(int i = 0; i < 999; i++) {
				
				double random1 = Math.random();
				double random2 = Math.random();
				double random3 = Math.random();
				
				int count1 = (int)(random1*100)+1;
				int count2 = (int)(random2*200)+1;
				int count3 = (int)(random3*5)+1;
				
				if(arr1[i][0] == count1 && arr1[i][1] == count2) {
					i --;
				}else {
					arr1[i][0] = count1;
					arr1[i][1] = count2;
					arr1[i][2] = count3;
				}
				
				
				cnt = 0;
				try {
					pstmt.setInt(1, arr1[i][0]);
					pstmt.setInt(2, arr1[i][1]);
					pstmt.setInt(3, arr1[i][2]);
					
					cnt = pstmt.executeUpdate();
					
				} catch(Exception e) {
					System.out.println(e.getMessage());
				}
				
				if(cnt > 0) {
					System.out.println("INSERT_RECOMMEND 성공]");
				} else {
					System.out.println("INSERT_RECOMMEND 실패]");
				}
				
			} // end for
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
					pstmt = null;
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
    
  } // end testInsertMember()
  
 
  @Override
@After  //org.junit.After;
  public void finalize() {
	  System.out.println("RecommendTests 종료");
		try {
			if(conn != null) {
				conn.close();
				conn = null;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
  }
  
  
} // end class