package Board;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class BoardDAO {
	private BoardDAO() {
	};

	private static BoardDAO dao = new BoardDAO();

	public static BoardDAO getInstance() {
		return dao;
	}

	private BoardDTO dto = new BoardDTO();
	private BoardReply rp=new BoardReply();
	ArrayList<BoardDTO> postList = new ArrayList<>();
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");

	public ArrayList<BoardDTO> getPostList() {
		return postList;
	}
	
	public BoardDTO getPost(int num) {
		return postList.get(num);
	}
	
	public void addPostList(String Writer,String Title,String email,String pw,String postData) {
		BoardDTO temp=new BoardDTO();
		temp.addPost(postList.size(), Writer, Title, sdf.format(d), postData,pw,email);
		postList.add(temp);
	}
	
	public void editPost(int idx,String Writer,String Title,String email,String postData) {
		BoardDTO temp=postList.get(idx);
		temp.setInfo(Writer,Title,email,postData);
		postList.set(idx, temp);
	}
	
	public void clearAll() {
		postList=new ArrayList<>();
	}

	public boolean checkPw(String pw,String pw2) {
		if(pw.equals(pw2)) {return true;}
		return false;
	}
	
	public void removePost(int idx) {
		postList.remove(idx);
	}
	
	public void addReplyList(int idx,String name,String pw,String reply) {
		BoardReply temp= new BoardReply();
		temp.addReply(name, pw, reply);
		postList.get(idx).replyList.add(temp);
	}
	
	public void removePostReply(int idx,int idx2) {
		postList.get(idx).replyList.remove(idx2);
	}
	
	public void addDummyData() {
		String[] dummyTitle = { "��", "��������", "���׶�", "���ϵ�", "7������ ����", "�ϻ�", "��ȣ��", "�ؿ��", "���� ����", "�λ���", "�˻����",
				"��������", "����", "������ �׳�", "���ӽ�ĵ��", "������ǥ", "�������", "�", "ȭ���� �ް�", "���", "Ÿ¥", "����ġ" };
		String writer = "dummy";
		String dummyPostData = "���̷� ������ �Խñ��Դϴ�.";
		for (int i = 0; i < 10; i++) {
			Random ran = new Random();
			int rNum = ran.nextInt(dummyTitle.length);
			BoardDTO temp = new BoardDTO();
			temp.addPost(postList.size(), writer, dummyTitle[rNum], sdf.format(d), dummyPostData);
			postList.add(temp);
			//update();
			}
	}

}