package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionManager;
import model.Donation;
import model.Donor;

public class DonationDAO {
	private static Connection conn = null;
	
	public static List<Donation> getAllDonations() throws SQLException {
        List<Donation> donation = new ArrayList<>();

        try {
        String query = "SELECT * FROM donation";
		conn = ConnectionManager.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Donation d = new Donation();
            d.setDonationID(rs.getString("donationID"));
            d.setAmount(rs.getDouble("amount"));
            d.setDonationDate(rs.getDate("donationDate"));
            d.setPaymentMethod(rs.getString("paymentMethod"));
            d.setCauseId(rs.getString("campaignID"));
            d.setDonorID(rs.getInt("donorID"));
            donation.add(d);
        }
        stmt.close();
    	}catch (SQLException e) {
    		e.printStackTrace();
    	}
        return donation;
    }
	
	  public static void addDonation(Donation donations) throws SQLException {
	      try {
	          String query = "INSERT INTO donation(donationID, amount, donationDate, paymentMethod, campaignID, donorID) VALUES (?, ?, ?, ?, ?, ?)";
	          
	          conn = ConnectionManager.getConnection();
	          PreparedStatement stmt = conn.prepareStatement(query);
	         
	          stmt.setString(1, donations.getDonationID());
	          stmt.setDouble(2, donations.getAmount());
	          stmt.setDate(3, donations.getDonationDate());
	          stmt.setString(4, donations.getPaymentMethod());
	          stmt.setString(5, donations.getCauseId());
	          stmt.setInt(6, donations.getDonorID());
	     
	          
	          stmt.executeUpdate();
	          stmt.close();
	          } catch (SQLException e) {
	            e.printStackTrace();
	            throw new SQLException("Failed to insert donation", e);
	          }
	            
	  }
	  
	  public static Donation getDonationById(String donationID) throws SQLException {
			Donation d = null;

			try {
				String sql = "SELECT dn.*, dr.Dname, dr.Demail, dr.Dphone " +
	                     "FROM donation dn JOIN donor dr ON dn.donorID = dr.donorID " +
	                     "WHERE dn.donationID = ?";
				conn = ConnectionManager.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, donationID);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					d = new Donation();
					d.setDonationID(rs.getString("donationID"));
		            d.setAmount(rs.getDouble("amount"));
		            d.setDonationDate(rs.getDate("donationDate"));
		            d.setPaymentMethod(rs.getString("paymentMethod"));
		            d.setCauseId(rs.getString("campaignID"));
		            d.setDonorID(rs.getInt("donorId"));
		         
		         // Create Donor object
		            Donor donor = new Donor();
		            donor.setDonorID(rs.getInt("donorId"));
		            donor.setDname(rs.getString("Dname"));
		            donor.setDemail(rs.getString("Demail"));
		            donor.setDphone(rs.getString("Dphone"));

		            // Set into Donation
		            d.setDonor(donor);
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return d;
		}
	  
	  public static double getTotalDonations() throws SQLException {
		    double total = 0.0;
		    String sql = "SELECT SUM(amount) FROM donation";
		    try (Connection conn = ConnectionManager.getConnection();
		         PreparedStatement stmt = conn.prepareStatement(sql);
		         ResultSet rs = stmt.executeQuery()) {
		        if (rs.next()) {
		            total = rs.getDouble(1);
		        }
		    }
		    return total;
		}

	  public static List<Donation> getDonationsByMonth(int month, int year) throws SQLException {
		    List<Donation> list = new ArrayList<>();
		    String sql = "SELECT * FROM donation WHERE MONTH(donationDate) = ? AND YEAR(donationDate) = ?";

		    try (Connection conn = ConnectionManager.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        ps.setInt(1, month);
		        ps.setInt(2, year);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            Donation d = new Donation();
		            d.setDonationID(rs.getString("donationID"));
		            d.setAmount(rs.getDouble("amount"));
		            d.setDonationDate(rs.getDate("donationDate"));
		            d.setPaymentMethod(rs.getString("paymentMethod"));
		            d.setCauseId(rs.getString("campaignID"));
		            d.setDonorID(rs.getInt("donorID"));
		            list.add(d);
		        }
		    }
		    return list;
		}

	  public static List<Donation> getDonationsByCampaign(String causeId) throws SQLException {
		    List<Donation> list = new ArrayList<>();
		    String sql = "SELECT * FROM donation WHERE campaignID = ?";

		    try (Connection conn = ConnectionManager.getConnection();
		         PreparedStatement ps = conn.prepareStatement(sql)) {
		        ps.setString(1, causeId);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            Donation d = new Donation();
		            d.setDonationID(rs.getString("donationID"));
		            d.setAmount(rs.getDouble("amount"));
		            d.setDonationDate(rs.getDate("donationDate"));
		            d.setPaymentMethod(rs.getString("paymentMethod"));
		            d.setCauseId(rs.getString("campaignID"));
		            d.setDonorID(rs.getInt("donorID"));
		            list.add(d);
		        }
		    }
		    return list;
		}

	  

}