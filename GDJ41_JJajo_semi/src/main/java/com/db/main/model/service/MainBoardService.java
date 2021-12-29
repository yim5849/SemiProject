package com.db.main.model.service;

import static com.jj.common.JDBCTemplate.close;
import static com.jj.common.JDBCTemplate.getConnection;
import static com.jj.common.JDBCTemplate.rollback;
import static com.jj.common.JDBCTemplate.commit;

import java.sql.Connection;
import java.util.List;

import com.db.main.model.dao.MainBoardDao;
import com.db.main.model.vo.AttachedFile;
import com.db.main.model.vo.MainBoard;
import com.jj.member.model.vo.Member;

public class MainBoardService {
	private MainBoardDao dao = new MainBoardDao();
	
	public List<MainBoard> searchMainBoard(int curPosition, int numPerOnce) {
		//DB
		Connection conn = getConnection();
		List<MainBoard> mbList = dao.searchMainBoard(conn, curPosition, numPerOnce);
		close(conn);
		return mbList;
	}
	
	
	//JY
	public List<MainBoard> getUserBlog (int curPosition, int numPerOnce, String memberNo){
		Connection conn = getConnection();
		List<MainBoard> ubList = dao.getUserBlog(conn, memberNo, curPosition, numPerOnce); //member_no 필수
		close(conn);

		return ubList;
	}

	
	//JY
	public int insertBoard(MainBoard mb, String memberNo) {
		Connection conn=getConnection();
		int result=dao.insertBoard(conn, mb, memberNo);
		String boardNo=dao.getBoardNo(conn);
		
		if(result>0&&boardNo!=null) {	
			int result2=dao.insertImageFile(conn,mb,boardNo);
			if(result2>0) {
					int result3=dao.insertTag(conn, mb,boardNo);
					/* System.out.println("RESULT 3 is " + result3); */
					if(result3 >0)commit(conn);
					else rollback(conn);
			}else rollback(conn);
		}else rollback(conn);	
		
		close(conn);
		return result;		 
	}

	
	//JY
	public int ModifyMyInfo(Member m) {
		Connection conn=getConnection();
		int result=dao.ModifyMyInfo(conn,m);

		if(result>0) {
			commit(conn);
		}else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	//JY
	public String getMyInfo(int memberNo1) {
		Connection conn=getConnection();
		String result=dao.getMyInfo(conn,memberNo1);
		
		close(conn);
		return result;
	}
	
	public List<String> getTags(String tagName) {
		Connection conn=getConnection();
		List<String> result=dao.getTags(conn, tagName);
		
		close(conn);
		return result;
	}
	
	public List<String> getAllTags() {
		Connection conn=getConnection();
		List<String> result=dao.getAllTags(conn);
		
		close(conn);
		return result;
	}
	
	
	public List<AttachedFile> getImageList(String boardNo){
		Connection conn=getConnection();
		List<AttachedFile> imageList=dao.getImageList(conn,boardNo);
		
		close(conn);
		return imageList;
	}
	
	
	
	public List<String> getTagName(String boardNo){
		Connection conn=getConnection();
		List<String> tagList=dao.getTagName(conn,boardNo);
		
		close(conn);
		return tagList;
	}
	
	
	public int deletePost(String boardNo) {
		Connection conn=getConnection();
		int result=dao.deletePost(conn,boardNo);
		if(result>0) {
			commit(conn);
		}else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
}

