package model1.board;

import jakarta.servlet.ServletContext;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount= 0;
		
		String query = "SELECT count(*) FROM board";
		if(map.get("searchWord") != null) {
			query += " WHERE"+map.get("searchField")+""+"LIKE'%"+map.get("serchWord")+"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
			
		} catch(Exception e) {
			
			System.out.println("게시물 수를 구하는 중 예외발생");
			e.printStackTrace();
		}
	return totalCount;
	}
	public List<BoardDTO> selectList(Map<String,Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		String query = "SELECT num,title,content,b.id, m.name ,postdate,visitcount "
				 + "FROM board b "
				 + "JOIN member m on b.id = m.id ";; 
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " +
		             " LIKE '%" + map.get("searchWord")+"%' ";
		}			
		query += " ORDER BY num DESC ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while (rs.next()) {
			BoardDTO dto = new BoardDTO();
			dto.setNum(rs.getString("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setPostdate(rs.getDate("postdate"));
			dto.setId(rs.getString("id"));
			dto.setVisitcount(rs.getString("visitcount"));
			dto.setName(rs.getString("name"));
			bbs.add(dto);		
			}
		} catch(Exception e) {
			System.out.println("게시판 목록을 읽어오다가 에러발생");
			e.printStackTrace();			
		}		
		return bbs;
	
	}
	public int insertWrite(BoardDTO dto) {
    	int result = 0;
    	
    	try {
    		String query = "INSERT INTO board (num,title,content,id,visitcount)"
    				+"values(seq_board_num.nextval,?,?,?,0)";
    				
    		psmt = con.prepareStatement(query);
    		psmt.setString(1, dto.getTitle());
    		psmt.setString(2, dto.getContent());
    		psmt.setString(3, dto.getId());
    		
    		result= psmt.executeUpdate();
    				
    	} catch (Exception e) {
    		System.out.println("게시글 작성중 오류 발생");
    		e.printStackTrace();
    	}
    	
    	
    	return result;
    }
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		
		String query = "SELECT b.*, M.name FROM member M INNER JOIN board b"+
				" ON M.id=B.id "+" WHERE num=?";
		
		try { 
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
				
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기중 예외 발생");
			e.printStackTrace();
		}
		
		
		
		return dto;
	}
	
	public void updateVisitCount(String num) {
		String query = "UPDATE board SET"
				+" visitcount=visitcount+1"+" WHERE num = ?";
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
						
		} catch (Exception e) {
			System.out.println("게시물 증가 중 예외 발생");
			e.printStackTrace();
			
		}
	}
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "update board set title=?, content=? where num";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result=psmt.executeUpdate();
		
		} catch(Exception e){
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();			
		}
		
		return result;
	}
	
}

