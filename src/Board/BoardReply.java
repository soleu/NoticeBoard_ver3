package Board;

public class BoardReply {
private String replyData;
private String nickname;//´ñ±Û ´Ü »ç¶÷ ´Ð³Û
private String pw;//´ñ±Û ´Ü »ç¶÷ ºñ¹ø

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
