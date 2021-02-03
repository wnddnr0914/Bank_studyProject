package algo;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.annotation.ManagedBean;

import org.apache.jasper.tagplugins.jstl.core.Catch;

import java.sql.*;
public class MemberDAO {
	
	String id="wnddnr0914";
	String pass="1234";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	
	Connection con=null;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon(){
		
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = (Connection) DriverManager.getConnection(url,id,pass);
			
			
		}catch(Exception e){
			e.printStackTrace();
	
		}
	}
	
	
	public void insertMemberJoin(bean bean)   {
		getCon();
		try {
			//con.setAutoCommit(false);
		String sql="insert into PERSON values('?','?',?,?,'?');";
		
		pstmt = ((java.sql.Connection) con).prepareStatement(sql);
		
		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getName());
		pstmt.setInt(3, bean.getGender());
		pstmt.setInt(4, bean.getYear());
		pstmt.setString(5, bean.getPw1());
		
		//pstmt.executeUpdate();
		//pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
				
		
	}
	
	
	
	public Vector<u_OwnAccount> allSelectMember(String id) {
		
		Vector<u_OwnAccount> v =new Vector<>();
		try {
			getCon();
			
			String sql="select * from  OWNACCOUNT";
			
			pstmt = ((java.sql.Connection) con).prepareStatement(sql);

			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				u_OwnAccount ownAccount = new u_OwnAccount();
				ownAccount.setAcc_num(rs.getInt(1));
				ownAccount.setBalance(rs.getInt(2));
				ownAccount.setAcc_code(rs.getInt(3));
				ownAccount.setId(rs.getString(4));
				v.add(ownAccount);
			}

			con.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return v;
	}	
	
	
	

	
	public ArrayList<Integer> get_my_account(String id) {
		
		ArrayList<Integer> arr=new ArrayList<Integer>();
		
		try {
		getCon();
		
		String sql="select * from OWNACCOUNT WHERE ID="+id;
		pstmt = ((java.sql.Connection) con).prepareStatement(sql);
		
		
			rs=pstmt.executeQuery();
		
		while(rs.next()) {
			u_OwnAccount ownAccount = new u_OwnAccount();
			arr.add(rs.getInt(1));
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return arr ; 
	}
	
	public void hi (int a ,int b ,int c) {
		try {
			getCon();
				
			String sql="SELECT * FROM OWNACCOUNT WHERE ACC_NUM="+a;
			pstmt = ((java.sql.Connection) con).prepareStatement(sql);
			
			rs=pstmt.executeQuery();
				int original_give_money=rs.getInt(2);
				
				original_give_money-=b;//이부분 까지가 원래 돈에서 보낼돈 빼는 부분인데 
									   //80프로 완성되었고 메소드 만들까 고민중
				
				
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
