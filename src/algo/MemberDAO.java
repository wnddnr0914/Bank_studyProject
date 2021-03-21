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
		String sql="INSERT INTO PERSON VALUES(?,?,?,?,?,?)";
		
		pstmt =con.prepareStatement(sql);

		pstmt.setString(1, bean.getId());
		pstmt.setString(2, bean.getName());
		pstmt.setInt(3, bean.getGender());
		pstmt.setInt(4, bean.getYear());
		pstmt.setString(5, bean.getPw1());
		pstmt.setInt(6, 1);

		pstmt.executeUpdate();
	
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt!=null) {

					pstmt.close();	
				}
				if(con!=null) {

					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
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
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		
	}
	
	
	public Vector<u_OwnAccount> allSelectMember(String id) {
		Statement s =null;
		Vector<u_OwnAccount> v =new Vector<>();
		try {
			getCon();
			
			
			String sql="select * from OWNACCOUNT WHERE ID=\'"+id+"\'";
			s= con.createStatement();
		
			
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
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(s!=null) {
					s.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return v;
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
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
		return arr ; 
	}
	
	public boolean hi (int a ,int b ,int c, String id) {//입금해주는 메소드
		try {
			if (hi2(b)) {//여기 일단 임시 조치로 이렇게 홰놓음
				//받는 계좌가 존재하는 계좌인지 확인해 주는 함수
				return false;
			}
			getCon();
			//받는계좌번호 사용자가 비활성화 상태인지 확인하는코드
			String sql="select Activation from person where ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				if(rs.getInt(1)==0) {
					return false;
				}
			}
			
			System.out.println("황성화 상태 체크 완료");
			
			
	
			//계좌번호의 잔액 조회해 주는 코드+원래 있던 돈에서 나갈돈을 빼준다
			sql="SELECT * FROM OWNACCOUNT WHERE ACC_NUM=?";
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

			System.out.println("나갈돈 계산 체크 완료");
			
			
			//나갈돈을 데이터 베이스에서 빼는작업
			sql="UPDATE OWNACCOUNT SET BALANCE=? WHERE ACC_NUM=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, original_give_money);
			pstmt.setInt(2, a);
			pstmt.executeUpdate();
			
		
			System.out.println("돈 빼는 거 체크 완료");
			
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

			System.out.println("들어올돈 계산 체크");
			
			//계좌에 플러스 해준돈을 디비에 업데이트 해주는
			sql="UPDATE OWNACCOUNT SET BALANCE=? WHERE ACC_NUM=? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, original_get_money);
			pstmt.setInt(2, b);
			pstmt.executeUpdate();
			
		
			System.out.println("디비에 돈 추가해주는거 체크 완료");
			//아직 찾는중
		
			Timestamp timestamp =new Timestamp(System.currentTimeMillis());
			
			sql="INSERT INTO ACC_W_D VALUES(seq.NEXTVAL,?,?,?,?)";
		
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, c);
			pstmt.setTimestamp(2, timestamp);
		
			
		
			pstmt.setInt(3, b);
			pstmt.setInt(4, a);
			
			
		
			System.out.println("거래내역 추가 확인");
	
		
			pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				try {
					con.rollback();
				} catch (Exception e2) {
					// TODO: handle exception
				}
	
				
			}finally {
				try {
					if(rs!=null) {
						rs.close();
					}
					if(pstmt!=null) {
						pstmt.close();
					}
					if(con!=null) {
						con.close();	
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
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
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
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
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
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
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return list;
	}
	public int makeAccount(int code,String id) {
		long acc_num=System.nanoTime();
		try {
			getCon();
			
			String abc=String.valueOf(acc_num);
		
			
			
			long line=1;
			for(int i=1;i<abc.length();i++) {
				line*=10;
			}
			
		
			acc_num=0;
			for(int i = 0; i < 8; i++) {
				
				// charAt 함수로 문자열을 한글자씩 취득
				int num=abc.charAt(i)-'0';
				acc_num+=num*line;
				
				line=line/10;
			}
			acc_num/=10000000;
		
			
			
			String sql="INSERT INTO OWNACCOUNT VALUES(?,0,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, (int) acc_num);
			pstmt.setInt(2, code);
			pstmt.setString(3, id);
			pstmt.executeUpdate();
			return (int) acc_num;
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return (int) acc_num;
	}
	public boolean login (String id, String pw) {
		getCon();
		try {
			
			
			String sql="SELECT * FROM PERSON WHERE ID=? AND PASS=? AND Activation=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setInt(3, 1);
			rs=pstmt.executeQuery();
	
			while(rs.next()) {
				return true;
				
			}
			return false;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return false;
	}
	public String select_name(String id) {
		String namStr = " ";
		
		try {
			getCon();
			String sql="select name from person where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setNString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				namStr=rs.getString(1);
				return namStr;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return namStr;
	}
	public ArrayList<Integer> Goods_Ex() {
		ArrayList<Integer> goods=new ArrayList<Integer>();
		try {
			getCon();
			String sql="SELECT ACC_CODE FROM ACCOUNT";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				goods.add(rs.getInt(1));
			}
			
			} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return goods;

	}
	
	
	public ArrayList<MyAccountList> MyAccount(String uid) {
		ArrayList<MyAccountList> a=new ArrayList<MyAccountList>();
		
		try {
			getCon();
			String sql="SELECT ACC_NUM,ACC_CODE FROM OWNACCOUNT WHERE ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MyAccountList acc=new MyAccountList();
				acc.setAcc_num(rs.getInt(1));
				acc.setKind(rs.getInt(2));
				a.add(acc);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return a;
	}
	
	
	public String return_name(int num) {
		String name=null;
		try {
			getCon();
			String sql="SELECT ACC_NAME FROM ACCOUNT WHERE ACC_CODE=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				name=rs.getNString(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return name;
	}
	public bean My_info(String id) {
		bean bean=new bean();
		try {
			getCon();
			String sql="SELECT * FROM PERSON WHERE ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(1));

				bean.setId(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setGender(rs.getInt(3));
				bean.setYear(rs.getInt(4));
				bean.setPw1(rs.getString(5));
		
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return bean;
	}
	public void DisableMember(String id) {
		try {
			getCon();
			String sql="update person set Activation=0 where id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	public void UpadteMember(bean vo) {
		try {
			getCon();
			String sql="update person set NAME=?, YEAR=?, PASS=? where ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getYear());
			pstmt.setString(3, vo.getPw1());
			pstmt.setString(4, vo.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(pstmt!=null) {
					pstmt.close();
				}
				if(con!=null) {
					con.close();	
				}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
