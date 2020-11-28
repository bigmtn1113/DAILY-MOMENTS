package com.mycompany.webapp.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.BcommentDao;
import com.mycompany.webapp.dao.BlikeDao;
import com.mycompany.webapp.dao.BoardDao;
import com.mycompany.webapp.dao.BookmarkDao;
import com.mycompany.webapp.dao.FollowDao;
import com.mycompany.webapp.dao.MemberDao;
import com.mycompany.webapp.dao.QnaDao;
import com.mycompany.webapp.dto.Bcomment;
import com.mycompany.webapp.dto.Board;
import com.mycompany.webapp.dto.Member;
import com.mycompany.webapp.dto.Pager;
import com.mycompany.webapp.dto.Qna;

@Service
public class WebService {
	
	private static final Logger logger=LoggerFactory.getLogger(WebService.class);
	
	@Resource
	private BoardDao boardDao;
	
	@Resource
	private BookmarkDao bookmarkDao;
	
	@Resource
	private BcommentDao bcommentDao;
	
	@Resource
	private FollowDao followDao;
	
	@Resource
	private BlikeDao blikeDao;
	
	@Resource
	private MemberDao memberDao;

	public void join(Member member) {
		memberDao.insert(member);
	}
	
	public void write(Board board) {
		boardDao.write(board);
	}

	public Member getMember(String mid) {
		Member member = memberDao.getMember(mid);
		return member;
	}
	
	public int getMemberBcnt(String mid) {
		int memberBcnt = boardDao.getMemberBcnt(mid);
		return memberBcnt;
	}

	public List<String> getMemberBphotos(String mid) {
		List<String> memberBphotos = boardDao.getMemberBphotos(mid);
		return memberBphotos;
	}

	public int getFollowerCnt(String mid) {
		int followerCnt = followDao.getFollowerCnt(mid);
		return followerCnt;
	}
	
	public int getFollowingCnt(String mid) {
		int followingCnt = followDao.getFollowingCnt(mid);
		return followingCnt;
	}

	public List<Board> getBoards(String mid) {
		List<Board> boards = boardDao.getBoards(mid);
		return boards;
	}

	public Integer getLikeCnt(int bno) {
		Integer likeCnt = blikeDao.getLikeCnt(bno);
		return likeCnt;
	}

	public List<Bcomment> getBoardComments(int bno) {
		List<Bcomment> boardComments = bcommentDao.getBoardComments(bno);
		return boardComments;
	}
	
	public String getMemberPhoto(String mid) {
		String memberPhoto = memberDao.getMemberPhoto(mid);
		return memberPhoto;
	}
	
	public void memberUpdate(Member member) {
		memberDao.updateMember(member);
	}	
	
	//이부분은 준엽이가 한 부분이므로 지우지 말것 ///////////////////////////////////////
	
	@Resource
	private QnaDao qnaDao;
	
	public int getQnaTotalRows() {
		int totalRows = qnaDao.countAll();
		return totalRows;
	}

	public List<Qna> getQnaList(Pager pager) {
		List<Qna> list = qnaDao.selectByPage(pager);
		return list;
	}

	public void qnaWrite(Qna qna) {
		qnaDao.insert(qna);

	}
}
