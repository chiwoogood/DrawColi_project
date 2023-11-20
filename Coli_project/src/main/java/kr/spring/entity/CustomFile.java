package kr.spring.entity;


import java.util.Date;

public class CustomFile {
    private long file_id;
    private String file_path;
    private long file_size;
    private String file_ext;
    private Date uploaded_at;

    private CustomUser user; // 사용자 객체와의 연결을 나타내는 필드

    public CustomFile(File file) {
        this.file_id = file.getFile_id();
        this.file_path = file.getFile_path();
        this.file_size = file.getFile_size();
        this.file_ext = file.getFile_ext();
        this.uploaded_at = file.getUploaded_at();

        // CustomUser 객체 초기화
        // 여기서 사용자 정보를 가져와서 연결할 수 있음
        // 예를 들어, file.getAtc_idx().getMember()를 사용하여 사용자 정보 가져오기
        // this.user = new CustomUser(file.getAtc_idx().getMember());
    }

    public long getFile_id() {
        return file_id;
    }

    public void setFile_id(long file_id) {
        this.file_id = file_id;
    }

    public String getFile_path() {
        return file_path;
    }

    public void setFile_path(String file_path) {
        this.file_path = file_path;
    }

    public long getFile_size() {
        return file_size;
    }

    public void setFile_size(long file_size) {
        this.file_size = file_size;
    }

    public String getFile_ext() {
        return file_ext;
    }

    public void setFile_ext(String file_ext) {
        this.file_ext = file_ext;
    }

    public Date getUploaded_at() {
        return uploaded_at;
    }

    public void setUploaded_at(Date uploaded_at) {
        this.uploaded_at = uploaded_at;
    }

    public CustomUser getUser() {
        return user;
    }

    public void setUser(CustomUser user) {
        this.user = user;
    }
}
