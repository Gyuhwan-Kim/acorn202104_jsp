package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DBConnect;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;
	
	// 외부에서 객체를 생성하지 못하도록
	private MemberDao() {
		
	}
	
	// 자신의 참조값을 return해주는 공개 method
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
		}
		return dao;
	}
	// 회원 목록을 return하는 method
	public List<MemberDto> getList(){
		// 회원 목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<MemberDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//conn=new DBConnect().getConn();
			// 실행할 sql 문 작성
			String sql="select num, name, addr"
					+ " from member"
					+ " order by num asc";
			// PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			// ? 에 binding할 내용이 있으면 여기서 binding
			
			// select 문 수행하고 결과를 ResultSet으로 받아옥
			rs=pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서
			// 원하는 Data type으로 포장하기
			while(rs.next()) {
				// MemberDto 객체를 생성해서
				MemberDto dto=new MemberDto();
				// 현재 cursor가 위치한 곳의 num, name, addr column에 있는 data를 읽어와서 담기
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				// 회원 한 명의 정보가 담긴 MemberDto 객체의 참조값을 List에 누적하기
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	         try {
	             if(rs!=null)rs.close();
	             if(pstmt!=null)pstmt.close();
	             // close() 하면 자동으로 Connection pool에 반납된다.
	             if(conn!=null)conn.close();
	          }catch(Exception e) {}
		}
		// 회원 목록을 return 해주기
		return list;
	}
	
	// 회원 정보를 DB에 저장하는 method
	public boolean insert(MemberDto dto) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql="insert into member"
					+ " (num, name, addr)"
					+ " values(member_seq.nextval, ?, ?)";
			pstmt=conn.prepareStatement(sql);
			// ? 에 binding 할 내용이 있으면 여기서 binding
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			
			// insert or update or delete 문 수행하고
			// 변화된 row의 개수 return 받기
			flag=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "delete from member"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 binding 할 내용이 있으면 여기서 binding
			pstmt.setInt(1, num);
			// insert or update or delete 문 수행하고
			// 변화된 row의 개수 return 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 회원 한 명의 정보를 return하는 method
	public MemberDto getData(int num) {
		// return해줄 객체의 참조값을 담을 지역변수 만들기
		MemberDto dto=null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "select *"
					+ " from member"
					+ " where num=?";
			// PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 binding할 내용이 있으면 여기서 binding
			pstmt.setInt(1, num);
			
			// select 문 수행하고 결과를 ResultSet으로 받아옥
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서
			// 원하는 Data type으로 포장하기 이지만 여기서는
			// 만일 select된 row가 있다면 Result 객체에 있는 것 추출
			if(rs.next()) {
				dto=new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		// dto를 return해줘야 함
		return dto;
	}
	
	// 회원 한 명의 정보를 수정하는 method
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "update member"
					+ " set name=?, addr=?"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			// ? 에 binding 할 내용이 있으면 여기서 binding
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			
			// insert or update or delete 문 수행하고
			// 변화된 row의 개수 return 받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) {
			return true;
		} else {
			return false;
		}
	}
	
	// 원하는 페이지의 회원 목록을 return하는 method
	public List<MemberDto> getList(MemberDto dto){
		// 회원 목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<MemberDto>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			// Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//conn=new DBConnect().getConn();
			// 실행할 sql 문 작성
			String sql="select *" + 
					" from" + 
					"	(select result1.*, rownum as rnum" + 
					"	from" + 
					"		(select *" + 
					"		from member" + 
					"		order by num desc) result1)" + 
					" where rnum>=? and rnum<=?";
			// PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			// ? 에 binding할 내용이 있으면 여기서 binding
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			// select 문 수행하고 결과를 ResultSet으로 받아옥
			rs=pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서
			// 원하는 Data type으로 포장하기
			while(rs.next()) {
				// MemberDto 객체를 생성해서
				MemberDto tmp=new MemberDto();
				// 현재 cursor가 위치한 곳의 num, name, addr column에 있는 data를 읽어와서 담기
				tmp.setNum(rs.getInt("num"));
				tmp.setName(rs.getString("name"));
				tmp.setAddr(rs.getString("addr"));
				// 회원 한 명의 정보가 담긴 MemberDto 객체의 참조값을 List에 누적하기
				list.add(tmp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
	         try {
	             if(rs!=null)rs.close();
	             if(pstmt!=null)pstmt.close();
	             // close() 하면 자동으로 Connection pool에 반납된다.
	             if(conn!=null)conn.close();
	          }catch(Exception e) {}
		}
		// 회원 목록을 return 해주기
		return list;
	}
	
	// 전체 row의 개수를 return해주는 method
	public int getCount() {
		// 전체 row의 개수를 담을 variable 만들기
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			// 실행할 sql 문 작성
			String sql = "select max(rownum) as num"
					+ " from member";
			// PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			// ? 에 binding할 내용이 있으면 여기서 binding

			// select 문 수행하고 결과를 ResultSet으로 받아옥
			rs = pstmt.executeQuery();
			// 반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서
			// 원하는 Data type으로 포장하기
			if(rs.next()) {
				count=rs.getInt("num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return count;
	}
	
}
