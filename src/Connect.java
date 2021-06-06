import java.sql.*;
import java.util.logging.*;
public class Connect {
	Connection con = null;
	public Connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	public boolean Ins_Upd_Del(String str) {
		try {
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/leave?user=root&password=root");
			Statement st = con.createStatement();
			st.executeUpdate(str);
			st.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(Connect.class.getName()).log(Level.SEVERE, null, ex);
			return false;
		}

	}
}
