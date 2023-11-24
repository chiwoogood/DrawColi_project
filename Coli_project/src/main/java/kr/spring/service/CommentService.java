package kr.spring.service;

public interface CommentService {
	
	public void saveComment(long atc_id, String comment_content, String username);
}
