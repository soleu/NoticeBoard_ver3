package Board;

public class BoardReply {
private String replyData;
private String nickname;//��� �� ��� �г�
private String pw;//��� �� ��� ���

public void addReply(String nickname,String pw,String replyData) {
	this.nickname=nickname;
			this.pw=pw;
	this.replyData=replyData;
}

public String getReplyInfo() {
	return replyData;
}

public String getNickname() {
	return nickname;
}

public String getPw() {
	return pw;
}

}
