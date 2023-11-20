package kr.spring.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.entity.File;  // 'File' 엔티티 클래스의 경로를 확인해주세요.
import kr.spring.repository.FileRepository;  // 'FileRepository' 인터페이스의 경로를 확인해주세요.

@Service
public class FileServiceImpl implements FileService {

    @Autowired
    private FileRepository fileRepository;
    
    @Override
    public void saveFile(MultipartFile file) throws IOException {
        String directory = "C:\\ColiFileDirectory"; // 파일 저장 경로
        Path path = Paths.get(directory);
        if (!Files.exists(path)) {
            Files.createDirectories(path);
        }

        String originalFileName = file.getOriginalFilename();
        Path filePath = path.resolve(originalFileName);
        Files.copy(file.getInputStream(), filePath);

        File fileEntity = new File();
        fileEntity.setFile_path(filePath.toString());
        fileEntity.setFile_size(file.getSize());
        fileEntity.setFile_ext(originalFileName.substring(originalFileName.lastIndexOf(".") + 1));

        fileRepository.save(fileEntity);
    }
}
