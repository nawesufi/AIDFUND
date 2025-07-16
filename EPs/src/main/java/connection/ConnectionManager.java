package connection;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
	static Connection con;

	// Define and initialize database driver
	private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

	// Define and initialize database URL
	private static final String DB_CONNECTION = "jdbc:mysql://localhost/aidfund";

	// Define and initialize database user
	private static final String DB_USER = "root";

	// Define and initialize database password
	private static final String DB_PASSWORD = "";

	public static Connection getConnection() {

		try {
			// 1. Load the driver
			Class.forName(DB_DRIVER);

			try {
				// 2. Create connection
				con = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);

				// Print DB metadata
				DatabaseMetaData dma = con.getMetaData();
				System.out.println("\n✅ Connected to " + dma.getURL());
				System.out.println("Driver       : " + dma.getDriverName());
				System.out.println("Version      : " + dma.getDriverVersion());
				System.out.println("");

			} catch (SQLException ex) {
				while (ex != null) {
					System.out.println("❌ SQLException:");
					System.out.println("  SQLState : " + ex.getSQLState());
					System.out.println("  Message  : " + ex.getMessage());
					System.out.println("  Vendor   : " + ex.getErrorCode());
					System.out.println("");
					ex = ex.getNextException();
				}
			}
		} catch (ClassNotFoundException e) {
			System.out.println("❌ JDBC Driver not found!");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("❌ Unexpected error occurred while connecting to database.");
			e.printStackTrace();
		}

		return con;
	}
}