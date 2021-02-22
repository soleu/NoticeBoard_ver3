package Board;

import java.util.ArrayList;

public class BoardDTO {
	BoardReply reply=new BoardReply();
	
	private int no;// 번호
	private String writer;// 작성자
	private String title;// 제목
	private String date;// 작성일
	private int count;// 조회수
	private String postData;//게시글 내용
	private String pw;//비밀번호
	private String email;//이메일
	ArrayList<BoardReply> replyList=new ArrayList<>();//댓글들
	//새 게시글 쓰기 전용
	public void addPost(int no,String writer,String title,String date,String postData,String pw,String email) {
		this.no=no;
		this.writer=writer;
		this.title=title;
		this.date=date;
		this.postData=postData;
		this.pw=pw;
		this.email=email;
		this.count=0;
		this.replyList=new ArrayList<>();
	}
	
	
	//더미 전용
	public void addPost(int no,String writer,String title,String date,String postData) {
		this.no=no;
		this.writer=writer;
		this.title=title;
		this.count=0;
		this.date=date;
		this.postData=postData;
		this.pw="1111";
		this.email="dummy@naver.com";
		this.replyList=new ArrayList<>();
	}
	
	public int getNo() {
		return no;
	}

	public String getWriter() {
		return writer;
	}

	public String getTitle() {
		return title;
	}

	public String getDate() {
		return date;
	}
	
	public String getPostData() {
		return postData;
	}
	
	public String getPw() {
		return pw;
	}
	
	public String getEmail() {
		return email;
	}

	public int getCount() {
		return count;
	}
	
	public BoardReply getReply(int idx) {
		return replyList.get(idx);
	}
	
	public ArrayList getReplyList() {
		return replyList;
	}
	
	
	public void setInfo(String writer,String title,String email,String postData) {
		this.writer=writer;
		this.title=title;
		this.email=email;
		this.postData=postData;
	}
	
	public void addCount() {
		this.count++;
	}
	
	
}
