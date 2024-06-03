package com.example.demo.controller;

import com.example.demo.model.ImageDetails;
import com.example.demo.repository.ImageDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/imagedetails")
public class ImageDetailsController {

    @Autowired
    private ImageDetailsRepository imageDetailsRepository;

    @PostMapping("/submit")
    public ResponseEntity<String> submitImageDetails(@RequestBody ImageDetails imageDetails) {
        // Check if the image URL already exists
        if (imageDetailsRepository.existsByImageUrl(imageDetails.getImageUrl())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("This data is already uploaded");
        }

        // Save the data to the database
        imageDetailsRepository.save(imageDetails);

        // Return success response
        return ResponseEntity.ok("Image details submitted successfully");
    }

}
