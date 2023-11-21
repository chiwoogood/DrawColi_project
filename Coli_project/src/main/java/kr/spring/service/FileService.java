package kr.spring.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
	public void saveFile(MultipartFile file,  String username) throws IOException;
	
	public List<String> listFilesForUser(String username);
}