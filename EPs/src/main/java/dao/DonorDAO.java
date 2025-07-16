package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionManager;
import model.Donor;


public class DonorDAO {
	private static Connection conn = null;
	
	public static List<Donor> getAllDonor() throws SQLException {
        List<Donor> donor = new ArrayList<>();

        try {
        String query = "SELECT * FROM donation";
		conn = ConnectionManager.getConnection();
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Donor dn = new Donor();
            dn.setDonorID(rs.getInt("donorID"));
            dn.setDname(rs.getString("Dname"));
            dn.setDemail(rs.getString("Demail"));
            dn.setDphone(rs.getString("Dphone"));
            donor.add(dn);
        }
        stmt.close();
    	}catch (SQLException e) {
    		e.printStackTrace();
    	}
        return donor;
    }
	
	  public static int addDonor(Donor donors) throws SQLException {
		  int generatedDonorID = -1;
	      try {
	          String query = "INSERT INTO donor(Dname, Demail, Dphone) VALUES (?, ?, ?)";
	          
	          conn = ConnectionManager.getConnection();
	          PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
	         
	          stmt.setString(1, donors.getDname());
	          stmt.setString(2, donors.getDemail());
	          stmt.setString(3, donors.getDphone());
	     
	         
	          int affectedRows = stmt.executeUpdate();
	          if (affectedRows == 0) {
	              throw new SQLException("Creating donor failed, no rows affected.");
	          }
	          try (ResultSet rs = stmt.getGeneratedKeys()) {
	                  if (rs.next()) {
	                      generatedDonorID = rs.getInt(1); // assuming donorID is the first column
	                  } else {
	                throw new SQLException("Creating donor failed, no ID obtained.");
	              }
	          }
	 
	         } catch (SQLException e) {
	            e.printStackTrace();
	            throw new RuntimeException("Failed to add donor", e);
	         }
	      return generatedDonorID;
	  }
	 
	  
	  
	  public static Donor getDonorById(String donorID) throws SQLException {
			Donor dn = null;

			try {
				String sql = "SELECT * FROM donor WHERE donorID = ?";
				conn = ConnectionManager.getConnection();
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, donorID);
				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					dn = new Donor();
					dn.setDonorID(rs.getInt("donorID"));
		            dn.setDname(rs.getString("Dname"));
		            dn.setDphone(rs.getString("Dphone"));
		          
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return dn;
		}


}
