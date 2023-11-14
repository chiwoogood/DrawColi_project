package kr.spring.entity;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString
public class UserModel {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long model_id;
    
    private String model_name;
    
    private String model_pose;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date created_at;
    
    @ManyToOne
    @JoinColumn(name = "user_id")
    private Member user_id;

    @ManyToOne
    @JoinColumn(name = "pose_id")
    private Pose pose_id;
}
