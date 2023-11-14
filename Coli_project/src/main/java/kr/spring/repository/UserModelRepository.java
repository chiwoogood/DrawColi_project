package kr.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import kr.spring.entity.UserModel;

@Repository
public interface UserModelRepository extends JpaRepository<UserModel, Long>{

}
