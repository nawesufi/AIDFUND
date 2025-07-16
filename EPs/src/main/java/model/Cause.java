package model;

import java.io.Serializable;
import java.sql.Date;

public class Cause implements Serializable {
	
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
private String causeId;
 private String title;
 private String description;
 private String headline;
 private double targetAmount;
 private Date startDate;
 private Date endDate;
 private String status;
 private String thumbnail;
 private int userId;
 private double totalCollected;


 // Default constructor
 public Cause() {}

 // Getters and Setters
 public String getCauseId() {
     return causeId;
 }

 public void setCauseId(String causeId) {
     this.causeId = causeId;
 }

 public String getTitle() {
     return title;
 }

 public void setTitle(String title) {
     this.title = title;
 }

 public String getDescription() {
     return description;
 }

 public void setDescription(String description) {
     this.description = description;
 }

 public double getTargetAmount() {
     return targetAmount;
 }

 public void setTargetAmount(double targetAmount) {
     this.targetAmount = targetAmount;
 }

 public Date getStartDate() {
     return startDate;
 }

 public void setStartDate(Date startDate) {
     this.startDate = startDate;
 }

 public Date getEndDate() {
     return endDate;
 }

 public void setEndDate(Date endDate) {
     this.endDate = endDate;
 }

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public int getUserId() {
	return userId;
}

public void setUserId(int userId) {
	this.userId = userId;
}

public String getHeadline() {
	return headline;
}

public void setHeadline(String headline) {
	this.headline = headline;
}

public String getThumbnail() {
	return thumbnail;
}

public void setThumbnail(String thumbnail) {
	this.thumbnail = thumbnail;
}

public double getTotalCollected() {
	return totalCollected;
}

public void setTotalCollected(double totalCollected) {
	this.totalCollected = totalCollected;
}
}
