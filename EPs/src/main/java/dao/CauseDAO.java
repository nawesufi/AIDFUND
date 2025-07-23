package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.ConnectionManager;
import model.Cause;


public class CauseDAO {
	private static Connection con = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	
    public static List<Cause> getAllCauses() throws SQLException {
        List<Cause> campaign = new ArrayList<>();
        try {
        String sql = "SELECT c.*, IFNULL(SUM(d.amount), 0) AS totalCollected " +
                "FROM campaign c " +
                "LEFT JOIN donation d ON c.campaignID = d.campaignID " +
                "GROUP BY c.campaignID";
        
		con = ConnectionManager.getConnection();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Cause c = new Cause();
            c.setCauseId(rs.getString("campaignID"));
            c.setTitle(rs.getString("title"));
            c.setDescription(rs.getString("description"));
            c.setHeadline(rs.getString("headline"));
            c.setTargetAmount(rs.getDouble("targetAmount"));
            c.setTotalCollected(rs.getDouble("totalCollected"));
            c.setStartDate(rs.getDate("startDate"));
            c.setEndDate(rs.getDate("endDate"));
            c.setStatus(rs.getString("status"));
            c.setThumbnail(rs.getString("thumbnail"));
            c.setUserId(rs.getInt("userID"));
            c.setTotalCollected(rs.getDouble("totalCollected")); 
            campaign.add(c);
        }
        ps.close();
    	}catch (SQLException e) {
    		e.printStackTrace();
    	}
        return campaign;
    }
    
    public static List<Cause> getActiveCausesDonor() throws Exception {
        List<Cause> activeCauses = new ArrayList<>();

        String sql = "SELECT c.*, IFNULL(SUM(d.amount), 0) AS totalCollected " +
                "FROM campaign c " +
                "LEFT JOIN donation d ON c.campaignID = d.campaignID " +
                "WHERE c.status = 'Active' " +
                "GROUP BY c.campaignID";

        try {
        	con = ConnectionManager.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
            	Cause c = new Cause();
                c.setCauseId(rs.getString("campaignID"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setHeadline(rs.getString("headline"));
                c.setTargetAmount(rs.getDouble("targetAmount"));
                c.setStartDate(rs.getDate("startDate"));
                c.setEndDate(rs.getDate("endDate"));
                c.setStatus(rs.getString("status"));
                c.setThumbnail(rs.getString("thumbnail"));
                c.setTotalCollected(rs.getDouble("totalCollected"));
                activeCauses.add(c);
            }
            System.out.println("Total active causes fetched: " + activeCauses.size());
            for (Cause c : activeCauses) {
                System.out.println("Title: " + c.getTitle());
            }

    } catch (Exception e) {
        e.printStackTrace();
    }
        return activeCauses;
    }


    public static void addCause(Cause c) throws SQLException {
    	try {
        String sql = "INSERT INTO campaign (campaignID, title, description, headline, targetAmount, startDate, endDate, status, thumbnail, userID) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?)";
    	con = ConnectionManager.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, c.getCauseId()); 
        ps.setString(2, c.getTitle());
        ps.setString(3, c.getDescription());
        ps.setString(4, c.getHeadline());
        ps.setDouble(5, c.getTargetAmount());
        ps.setDate(6, c.getStartDate());
        ps.setDate(7, c.getEndDate());
        ps.setString(8, c.getStatus());
        ps.setString(9, c.getThumbnail());
        ps.setInt(10, c.getUserId());

        System.out.print(sql);
        ps.executeUpdate();
        ps.close();
    }
    	catch (SQLException e) {
    		e.printStackTrace();
    	}
    }

    public static void updateCause(Cause c) throws SQLException {
        try {
            String sql;
            boolean updateThumbnail = c.getThumbnail() != null && !c.getThumbnail().isEmpty();
            if (updateThumbnail) {
                sql = "UPDATE campaign SET title=?, description=?, headline=?, targetAmount=?, startDate=?, endDate=?, status=?, userID=?, thumbnail=? WHERE campaignID=?";
            } else {
                sql = "UPDATE campaign SET title=?, description=?, headline=?, targetAmount=?, startDate=?, endDate=?, status=?, userID=? WHERE campaignID=?";
            }
            con = ConnectionManager.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, c.getTitle());
            ps.setString(2, c.getDescription());
            ps.setString(3, c.getHeadline());
            ps.setDouble(4, c.getTargetAmount());
            ps.setDate(5, c.getStartDate());
            ps.setDate(6, c.getEndDate());
            ps.setString(7, c.getStatus());
            ps.setInt(8, c.getUserId());
            if (updateThumbnail) {
                ps.setString(9, c.getThumbnail());
                ps.setString(10, c.getCauseId());
            } else {
                ps.setString(9, c.getCauseId());
            }
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteCause(String causeId) throws SQLException {
    	try {
        String sql = "DELETE FROM campaign WHERE campaignID=?";
		con = ConnectionManager.getConnection();
        ps = con.prepareStatement(sql);
        ps.setString(1, causeId);
        ps.executeUpdate();
        ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
    public static Cause getCauseId(String causeId) throws SQLException { //Get cause by ID
		Cause c = null;

		try {
			String sql = "SELECT * FROM campaign WHERE campaignID = ?";
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, causeId);
			rs = ps.executeQuery();

			if (rs.next()) {
				c = new Cause();
				c.setCauseId(rs.getString("campaignID"));
	            c.setTitle(rs.getString("title"));
	            c.setDescription(rs.getString("description"));
	            c.setHeadline(rs.getString("headline"));
	            c.setTargetAmount(rs.getDouble("targetAmount"));
	            c.setStartDate(rs.getDate("startDate"));
	            c.setEndDate(rs.getDate("endDate"));
	            c.setStatus(rs.getString("status"));
	            c.setThumbnail(rs.getString("thumbnail"));
	            c.setUserId(rs.getInt("userID"));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

    public void updateCauseStatus(String causeId, String status) {
        String sql = "UPDATE campaign SET status = ? WHERE campaignID = ?";
		con = ConnectionManager.getConnection();
        try {
        	ps = con.prepareStatement(sql);
        	ps.setString(1, status);
        	ps.setString(2, causeId);
        	ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean doesCauseIdExist(String causeId) {
        boolean exists = false;
        try {
            String sql = "SELECT campaignID FROM campaign WHERE campaignID = ?";
    		con = ConnectionManager.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, causeId);
            rs = ps.executeQuery();
            exists = rs.next(); // if there's a record, ID exists
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }
    
    public static int getTotalCauses() throws SQLException {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM campaign";
		con = ConnectionManager.getConnection();
        try {
        		ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getInt(1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public static int getCountActiveCauses() throws SQLException { //to display on top of admin dashboard
        int total = 0;
        String sql = "SELECT COUNT(*) FROM campaign WHERE CURDATE() BETWEEN startDate AND endDate";
		con = ConnectionManager.getConnection();
        try (
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
        }
        return total;
    }

    public static int getCountPastCauses() throws SQLException {
        int total = 0;
        String sql = "SELECT COUNT(*) FROM campaign WHERE endDate < CURDATE()";
		con = ConnectionManager.getConnection();
        try (
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                total = rs.getInt(1);
            }
        }
        return total;
    }

    public static List<Cause> getActiveCauses() {
        List<Cause> causes = new ArrayList<>();
        
        String sql = "SELECT * FROM campaign WHERE CURRENT_DATE BETWEEN startDate AND endDate";
		con = ConnectionManager.getConnection();

        try {
        	ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cause cause = new Cause();
                cause.setCauseId(rs.getString("causeId"));
                cause.setTitle(rs.getString("title"));
                cause.setDescription(rs.getString("description"));
                cause.setTargetAmount(rs.getDouble("targetAmount"));
                cause.setStartDate(rs.getDate("startDate"));
                cause.setEndDate(rs.getDate("endDate"));
                cause.setThumbnail(rs.getString("thumbnail")); 
                causes.add(cause);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return causes;
    }


    public static Cause getActiveCauseById(String causeId) {
        Cause cause = null;

        String sql = "SELECT * FROM campaign WHERE campaignID = ? AND CURRENT_DATE BETWEEN startDate AND endDate";
		con = ConnectionManager.getConnection();

        try {
        	ps = con.prepareStatement(sql);
            ps.setString(1, causeId);
            rs = ps.executeQuery();

            if (rs.next()) {
                cause = new Cause();
                cause.setCauseId(rs.getString("causeId"));
                cause.setTitle(rs.getString("title"));
                cause.setDescription(rs.getString("description"));
                cause.setTargetAmount(rs.getDouble("targetAmount"));
                cause.setStartDate(rs.getDate("startDate"));
                cause.setEndDate(rs.getDate("endDate"));
                cause.setThumbnail(rs.getString("thumbnail")); 
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cause;
    }

    public static String getCauseTitleById(String causeId) throws SQLException {
        String title = "";
        try (Connection conn = ConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement("SELECT title FROM campaign WHERE campaignID = ?")) {
            stmt.setString(1, causeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                title = rs.getString("title");
            }
        }
        return title;
    }
    
    public static Cause getCauseById(String causeId) {
        Cause cause = null;

        try {
            con = ConnectionManager.getConnection();
            String sql = "SELECT * FROM campaign WHERE campaignID = ?";
            ps = con.prepareStatement(sql);
            ps.setString(1, causeId);
            rs = ps.executeQuery();

            if (rs.next()) {
                cause = new Cause();
                cause.setCauseId(rs.getString("campaignID"));
                cause.setTitle(rs.getString("title"));
                cause.setDescription(rs.getString("description"));
                cause.setStartDate(rs.getDate("startDate"));
                cause.setEndDate(rs.getDate("endDate"));
                cause.setTargetAmount(rs.getDouble("targetAmount"));
                cause.setThumbnail(rs.getString("thumbnail"));
                cause.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }

        return cause;
    }

   }