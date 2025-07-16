package model;

import java.io.Serializable;
import java.sql.Date;

public class Donation implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String donationID;
    private double amount;
    private Date donationDate;
    private String paymentMethod;
    private String causeId;
    private int donorID;
    private Donor donor;

    // Default constructor
    public Donation() {
    }

    // Getters and Setters
   
    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }


	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getDonationID() {
		return donationID;
	}

	public void setDonationID(String donationID) {
		this.donationID = donationID;
	}

	public String getCauseId() {
		return causeId;
	}

	public void setCauseId(String causeId) {
		this.causeId = causeId;
	}

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}

	public int getDonorID() {
		return donorID;
	}

	public void setDonorID(int donorID) {
		this.donorID = donorID;
	}

	public Donor getDonor() {
		return donor;
	}

	public void setDonor(Donor donor) {
		this.donor = donor;
	}
}
