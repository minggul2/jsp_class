package memberjsp.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import memberjsp.bean.MemberDTO;
import memberjsp.bean.ZipcodeDTO;

public class MemberDAO {
public static MemberDAO instance;
	
	public static MemberDAO getInstance() {
		if(MemberDAO.instance == null) {
			synchronized(MemberDAO.class) {
				MemberDAO.instance = new MemberDAO();
			}
		}
		return MemberDAO.instance;
	}
	
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "dbdb";
	private String password = "itbank";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isExitsId(String id) {
		getConnection();
		boolean check = false;
		
		String sql = "select id from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) check = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	public ArrayList<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname){
		getConnection();
//		String sql = "";
		ArrayList<ZipcodeDTO> list = new ArrayList<>();
		/*
		if(sido.equals("세종")) {
			sql = "select * from NEWZIPCODE where sido like '세종' and roadname like ?";
		}else {
			sql = "select * from NEWZIPCODE where sido like ? and sigungu like ? and roadname like ?";
		}
		*/
		String sql = "select * from NEWZIPCODE where sido like ? and nvl(sigungu, 0) like ? and roadname like ?";
//		String sql = "select nvl(zipcode, ''),"
//				+ "nvl(sido, ''),"
//				+ "nvl(Sigungu, ''),"
//				+ "nvl(ynbmyundong, ''),"
//				+ "nvl(
		//%||?||% 도 가능함
		try {
			/*
			if(sido.equals("세종")) {
				pstmt.setString(1, "%"+roadname+"%");
			}else {
			*/
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+sido+"%");
				pstmt.setString(2, "%"+sigungu+"%");
				pstmt.setString(3, "%"+roadname+"%");
//			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipcodeDTO zipcodeDTO = new ZipcodeDTO();
				zipcodeDTO.setZipcode(rs.getString("zipcode"));
				zipcodeDTO.setSido(rs.getString("sido"));
				zipcodeDTO.setSigungu(rs.getString("sigungu") == null ? "" : rs.getString("sigungu"));
				zipcodeDTO.setYubmyundong(rs.getString("yubmyundong"));
				zipcodeDTO.setRi(rs.getString("ri") == null ? "" : rs.getString("ri"));
				zipcodeDTO.setRoadname(rs.getString("roadname"));
				zipcodeDTO.setBuildingname(rs.getString("buildingname") == null ? "" : rs.getString("buildingname"));
				list.add(zipcodeDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public MemberDTO modifiyMember(String id) {
		getConnection();
		MemberDTO memberDTO = new MemberDTO();
		String sql = "select * from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDTO.setName(rs.getString("id"));
				memberDTO.setGender(rs.getString("gender"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setAddr1(rs.getString("addr1"));
				memberDTO.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			memberDTO = null;
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDTO;
	}
	
	public String login(String id, String password) {
		getConnection();
		String name = null;
		String sql = "select * from member where id = ? and password = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println(name);
		return name;
	}
}











