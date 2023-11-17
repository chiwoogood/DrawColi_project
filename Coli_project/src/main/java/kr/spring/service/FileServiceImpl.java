package kr.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.spring.repository.FileRepository;
import kr.spring.entity.File;

@Service
public class FileServiceImpl implements FileService {

    @Autowired
    private FileRepository fileRepository;

    @Override
    public void save(File file) {
        // 파일 정보를 DB에 저장하는 로직 추가
        fileRepository.save(file);
    }
}