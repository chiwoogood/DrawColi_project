 package kr.spring.service;

 import java.io.IOException;
 import java.nio.file.Files;
 import java.nio.file.Path;
 import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;
import java.net.URISyntaxException;

 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.core.io.ClassPathResource;
 import org.springframework.core.io.Resource;
 import org.springframework.stereotype.Service;
 import org.springframework.web.multipart.MultipartFile;

 import kr.spring.entity.File;
 import kr.spring.repository.FileRepository;

 @Service
 public class FileServiceImpl implements FileService {

     @Autowired
     private FileRepository fileRepository;

     @Override
     public void saveFile(MultipartFile file, String username) throws IOException {
         // 프로젝트 내의 정적 리소스 경로를 가져옴
         Resource resource = new ClassPathResource("static/userImages/" + username);

         // 파일 경로를 절대 경로로 변환
         try {
             Path userDirectoryPath = Paths.get(resource.getURL().toURI());

             // 디렉토리가 존재하지 않으면 생성
             if (!Files.exists(userDirectoryPath)) {
                 Files.createDirectories(userDirectoryPath);
             }

             // 원본 파일 이름 가져오기
             String originalFileName = file.getOriginalFilename();

             // 저장할 파일 경로 설정
             Path filePath = userDirectoryPath.resolve(originalFileName);

             // 파일이 이미 존재하는지 확인
             if (Files.exists(filePath)) {
                 // 중복 파일이름 처리 (예: 파일명(1).확장자)
                 int count = 1;
                 String baseName = originalFileName.substring(0, originalFileName.lastIndexOf("."));
                 String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
                 while (Files.exists(filePath)) {
                     String newFileName = baseName + "(" + count + ")" + extension;
                     filePath = userDirectoryPath.resolve(newFileName);
                     count++;
                 }
             }

             // 파일 복사
             Files.copy(file.getInputStream(), filePath);

             // 파일 엔티티 생성 및 저장
             File fileEntity = new File();
             fileEntity.setFile_path(filePath.toString());
             fileEntity.setFile_size(file.getSize());
             fileEntity.setFile_ext(originalFileName.substring(originalFileName.lastIndexOf(".") + 1));
             fileRepository.save(fileEntity);
         } catch (URISyntaxException e) {
             // URISyntaxException 예외 처리
             e.printStackTrace(); // 또는 로깅을 활용하여 예외 처리 로그를 남길 수 있음
         }
     }
     
     
     @Override
     public List<String> listFilesForUser(String username) {
         // 여기에 파일 목록을 가져오는 로직 구현
         List<String> fileList = new ArrayList<>();
         Path userDirectoryPath = Paths.get("static/userImages/" + username);

         // 디렉토리 검사 및 파일 목록 생성
         if (Files.exists(userDirectoryPath)) {
             try (Stream<Path> paths = Files.walk(userDirectoryPath)) {
                 paths
                     .filter(Files::isRegularFile)
                     .forEach(path -> fileList.add(path.getFileName().toString()));
             } catch (IOException e) {
                 // 예외 처리
                 e.printStackTrace();
             }
         }

         return fileList;
     }

 }
