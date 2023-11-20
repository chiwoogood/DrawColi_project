package kr.spring.service;

import java.io.IOException;


import org.springframework.web.multipart.MultipartFile;



public interface FileService {
	public void saveFile(MultipartFile file,  String username) throws IOException;
	
}