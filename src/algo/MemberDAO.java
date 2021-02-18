package algo;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Vector;

import javax.annotation.ManagedBean;

import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.apache.jasper.tagplugins.jstl.core.Out;

import java.math.BigDecimal;
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
			
			con =  DriverManager.getConnection(url,id,pass);
			
			
		}catch(Exception e){
			e.printStackTrace();
	
		}
	}
	
	
	public void insertMemberJoin(bean bean)   {
		getCon();
		try {
			//con.setAutoCommit(false);
		String sql="INSERT INTO PERSON VALUES(?,?,?,?,?)";
		
		pstmt =con.prepareStatement(sql);

		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getName());
		pstmt.setInt(3, bean.getGender());
		pstmt.setInt(4, bean.getYear());
		pstmt.setString(5, bean.getPw1());

		pstmt.executeUpdate();
	
		//pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		
		}
				
		
	}
	
	public boolean check_id (String id) {
		getCon();
		try {
			String sql="SELECT ID FROM PERSON";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			int i=0;
			String abc;
			System.out.println("신중욱1");
			
			while(rs.next()) {
				abc=rs.getNString(1);
				if (id.equals(abc)) {
					i=1;
					break;
				}
			}
		if (i==1) {
			return false;
		}
		return true;
		
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		
		
		
	}
	
	
	public Vector<u_OwnAccount> allSelectMember(String id) {
		
		Vector<u_OwnAccount> v =new Vector<>();
		try {
			getCon();
			
			
			String sql="select * from OWNACCOUNT WHERE ID=\'"+id+"\'";
			Statement s = con.createStatement();
		
			
			rs=s.executeQuery(sql);
			
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
	
	public String Transform_name (int acc_code) {
		String acc_name=null;
		try {
			getCon();
			String sql="SELECT ACC_NAME FROM ACCOUNT WHERE ACC_CODE=\'"+acc_code+"\'";
			Statement s=con.createStatement();
			rs=s.executeQuery(sql);
			rs=pstmt.executeQuery();
			acc_name=rs.getNString("ACC_NAME");
			return acc_name;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return acc_name;
	
	}
	
	

	
	public ArrayList<Integer> get_my_account(String ids) {//계좌 리스트 보여주는 메소드
		
		ArrayList<Integer> arr=new ArrayList<Integer>();
		
		try {
		getCon();
		
		String sql="select * from OWNACCOUNT WHERE ID=\'"+ids+"\'";
		Statement s = con.createStatement();
		rs = s.executeQuery(sql);
		while(rs.next()) {
			u_OwnAccount ownAccount = new u_OwnAccount();
			arr.add(rs.getInt("ACC_NUM"));
		}
		con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return arr ; 
	}
	
	public boolean hi (int a ,int b ,int c) {//입금해주는 메소드
		try {
			getCon();
			if (hi2(b)) {//여기 일단 임시 조치로 이렇게 홰놓음
				return false;
			}
			System.out.println("연결은 되었습니다");
			//계좌번호의 잔액 조회해 주는 코드+원래 있던 돈에서 나갈돈을 빼준다
			String sql="SELECT * FROM OWNACCOUNT WHERE ACC_NUM=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, a);
			rs=pstmt.executeQuery();
			int original_give_money=0;
			if (rs.next()) {
				
				original_give_money=rs.getInt("BALANCE");
				
				if (c>original_give_money) {
					return false;
				}
				original_give_money-=c;
			
			}
			
			
			//나갈돈을 데이터 베이스에서 빼는작업
			sql="UPDATE OWNACCOUNT SET BALANCE=? WHERE ACC_NUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, original_give_money);
			pstmt.setInt(2, a);
			pstmt.executeUpdate();

			//계좌번호의 잔액 조회해주고 들어올돈 플러스 해주는 코드
			sql="SELECT * FROM OWNACCOUNT WHERE ACC_NUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b);
			rs=pstmt.executeQuery();
			int original_get_money=0;
			if(rs.next()) {//이거 꼭 해줘야 하는 이유? 물어보기
				original_get_money=rs.getInt("BALANCE");
				original_get_money+=c;
					
			}
			
			//계좌에 플러스 해준돈을 디비에 업데이트 해주는
			sql="UPDATE OWNACCOUNT SET BALANCE=? WHERE ACC_NUM=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, original_get_money);
			pstmt.setInt(2, b);
			pstmt.executeUpdate();
			
			
			//아직 찾는중
		
			Timestamp timestamp =new Timestamp(System.currentTimeMillis());
			
			sql="INSERT INTO ACC_W_D VALUES(seq.NEXTVAL,?,?,?,?)";
			System.out.println("1111");
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c);
			pstmt.setTimestamp(2, timestamp);
			System.out.println("11111111111");
			
			//jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
			pstmt.setInt(3, b);
			pstmt.setInt(4, a);
			System.out.println("1111111111111111111111");
			System.out.println("끝났다잉");
			pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
	
				
			}
		return true;
	}
	
	public boolean hi2(int b) {
		try {
			getCon();
			String sql="SELECT * FROM OWNACCOUNT WHERE ACC_NUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, b);
			rs=pstmt.executeQuery();
			int original_get_money=0;
			if(rs.next()) {//이거 꼭 해줘야 하는 이유? 물어보기
				return false;
					
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return true;
	}
	
	public Vector<acc_w_d> acc_record(int acc_num) {
		try {
			getCon();
			Vector<acc_w_d> a=new Vector<acc_w_d>();
			String sql="SELECT * FROM ACC_W_D WHERE GET_ACC=? OR GIVE_ACC=? ORDER BY TRA_TIME DESC";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, acc_num);
			pstmt.setInt(2, acc_num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				acc_w_d acc=new acc_w_d();
				acc.setKey(rs.getInt(1));
				acc.setMoney(rs.getInt(2));
				acc.setTra_time(rs.getTimestamp(3));
				acc.setGet_acc(rs.getInt(4));
				acc.setGive_acc(rs.getInt(5));
				a.add(acc);
				
			}
			return a;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null; 
	}
	public ArrayList<String> get_AccountKinds() {
		ArrayList<String> list=new ArrayList<String>();
		try {
			getCon();
			String acc_name;
			
			
			String sql="SELECT ACC_NAME FROM ACCOUNT";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				acc_name=rs.getString(1);
				list.add(acc_name);
			}
			return list;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public int makeAccount(int code,String id) {
		long acc_num=System.nanoTime();
		try {
			getCon();
			
			String abc=String.valueOf(acc_num);
		
			System.out.println(abc);
			
			long line=1;
			for(int i=1;i<abc.length();i++) {
				line*=10;
			}
			
			System.out.println(line);
			acc_num=0;
			for(int i = 0; i < 8; i++) {
				
				// charAt 함수로 문자열을 한글자씩 취득
				int num=abc.charAt(i)-'0';
				acc_num+=num*line;
				System.out.println(acc_num);
				line=line/10;
			}
			acc_num/=10000000;
			System.out.println(acc_num);
			
			
			String sql="INSERT INTO OWNACCOUNT VALUES(?,0,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, (int) acc_num);
			pstmt.setInt(2, code);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			return (int) acc_num;
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return (int) acc_num;
		
		
	}
	
	
	
}
