package com.example.demo.model;


import org.hibernate.annotations.CreationTimestamp;
import jakarta.persistence.Entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import java.util.Date;

@Entity
public class ImageDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    private String imageUrl;
    private String imageTitle;
    private String imageDescription;
    private String imageArticle;
    private String category;

    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date submissionDateTime;

    // Constructors, Getters, and Setters

    public ImageDetails() {
    }

    public ImageDetails(String imageUrl, String imageTitle, String imageDescription, String imageArticle, String category) {
        this.imageUrl = imageUrl;
        this.imageTitle = imageTitle;
        this.imageDescription = imageDescription;
        this.imageArticle = imageArticle;
        this.category = category;
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getImageTitle() {
        return imageTitle;
    }

    public void setImageTitle(String imageTitle) {
        this.imageTitle = imageTitle;
    }

    public String getImageDescription() {
        return imageDescription;
    }

    public void setImageDescription(String imageDescription) {
        this.imageDescription = imageDescription;
    }

    public String getImageArticle() {
        return imageArticle;
    }

    public void setImageArticle(String imageArticle) {
        this.imageArticle = imageArticle;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getSubmissionDateTime() {
        return submissionDateTime;
    }

    public void setSubmissionDateTime(Date submissionDateTime) {
        this.submissionDateTime = submissionDateTime;
    }
}

