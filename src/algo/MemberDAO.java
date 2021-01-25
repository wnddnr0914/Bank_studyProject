package algo;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.annotation.ManagedBean;
import javax.management.MBeanAttributeInfo;

import com.sun.corba.se.pept.transport.Connection;
import java.sql.*;
public class MemberDAO {
	
	String id="system";
	String pass="123456";
	String url="jdbc:oracle:thin:localhost:1521:XE";
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon(){
		
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = (Connection) DriverManager.getConnection(url,id,pass);
			
			
		}catch(Exception e){
			System.out.println("여기가 막힌거애1");
		}
	}
	
	
	public void insertMemberJoin(bean bean)   {
		getCon();
		try {
		String sql="insert into PERSON values(?,?,?,?,?);";
		
		pstmt= ((java.sql.Connection) con).prepareStatement(sql);
		
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getName());
		pstmt.setInt(2, bean.getGender());
		pstmt.setInt(3, bean.getYear());
		pstmt.setString(5, bean.getPw1());
		
		
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("여기가 막힌거애1");
		}
				
		
	}
	
	
	
	public Vector<u_OwnAccount> allSelectMember() {
		
		Vector<u_OwnAccount> v =new Vector<>();
		try {
			getCon();
			
			String sql="select from * OWNACCOUNT";
			
			pstmt = ((java.sql.Connection) con).prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				u_OwnAccount ownAccount = new u_OwnAccount();
				ownAccount.setAcc_num(rs.getInt(1));
				ownAccount.setBalance(rs.getInt(2));
				ownAccount.setAcc_code(rs.getInt(3));
				ownAccount.setId(rs.getString(1));
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return v;
	}
	
	
	
}
