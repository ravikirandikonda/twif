package com.example.demo.repository;



import com.example.demo.model.ImageDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageDetailsRepository extends JpaRepository<ImageDetails, Long> {
	boolean existsByImageUrl(String imageUrl);

}

