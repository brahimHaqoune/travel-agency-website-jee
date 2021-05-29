package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.beans.LigneCommande;
import com.beans.Travel;
import com.beans.User;


public class DB {
	
	private String username = "root";
	private String password = "agence";
	private String url = "jdbc:mysql://localhost/projet_jee";
	private String driver = "com.mysql.jdbc.Driver";
	
	ArrayList<Travel> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	
	private Connection con;
	
	private void dbConnect() {
		try {
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, username, password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void addUser(User user) throws SQLException {
		dbConnect();
		String sql = "Insert into users(name,email,username,password) values(?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getUsername());
		st.setString(4, user.getPassword());
		
		
		st.executeUpdate();
		dbClose();
	}
	
	

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from users";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			String user = rs.getString("username");
			String email = rs.getString("email");
			String name = rs.getString("name");
			String password = rs.getString("password");
			
			User u = new User();
			u.setEmail(email);
			u.setName(name);
			u.setUsername(user);
			u.setPassword(password);
			userList.add(u);
			u=null;
				
		}
		return userList;
	}
	
	
	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from users where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, username);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		dbClose();
		if(count == 0)
			return false;
		
		return true;
	}
	
	
	
	public void deleteTravel(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from voyages where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}

	public Travel fetchTravel(String id) throws SQLException {
		dbConnect();
		String sql = "select * from voyages where id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Travel t = new Travel();
		while(rst.next()){
			
			t.setId(rst.getInt("id"));
			t.setDestination(rst.getString("destination"));
			t.setType(rst.getString("type"));
			t.setDate(rst.getString("date"));
			t.setDuree(rst.getString("duree"));
			t.setPrix(rst.getString("prix"));
			t.setTheme(rst.getString("theme"));
			t.setHeberg(rst.getString("heberg"));
		}
		dbClose();
		return t;
	}

	public void updateTravel(Travel t) throws SQLException {
		dbConnect();
		String sql = "update voyages set destination=?,type=?,date=?,duree=?,prix=?,theme=?,heberg=? where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, t.getDestination());
		st.setString(2, t.getType());
		st.setString(3, t.getDate());
		st.setString(4, t.getDuree());
		st.setString(5, t.getPrix());
		st.setString(6, t.getTheme());
		st.setString(7, t.getHeberg());
		st.setInt(8, t.getId());
		
		st.executeUpdate();
		dbClose();
	}

	public void addTravel(Travel t) throws SQLException {
		dbConnect();
		String sql = "Insert into voyages(destination,type,date,duree,prix,theme,heberg) values(?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, t.getDestination());
		st.setString(2, t.getType());
		st.setString(3, t.getDate());
		st.setString(4, t.getDuree());
		st.setString(5, t.getPrix());
		st.setString(6, t.getTheme());
		st.setString(7, t.getHeberg());
		
		
		st.executeUpdate();
		dbClose();
	}
	
	public void deleteComm(String id, String email) throws SQLException {
		
		dbConnect();
		String sql = "Delete from users_voy where id_voy=? and email=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.setString(2, email);
		st.executeUpdate();
		dbClose();
		
	}
	
	
	public ArrayList<Travel> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from voyages";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rst = st.executeQuery();
		while(rst.next()) {
			Travel t = new Travel();
			
			t.setId(rst.getInt("id"));
			t.setDestination(rst.getString("destination"));
			t.setType(rst.getString("type"));
			t.setDate(rst.getString("date"));
			t.setDuree(rst.getString("duree"));
			t.setPrix(rst.getString("prix"));
			t.setTheme(rst.getString("theme"));
			t.setHeberg(rst.getString("heberg"));
			
			list.add(t);
			t=null;
			
	}
		
		dbClose();
		return list;
	}
	public void addCart (LigneCommande lc) throws SQLException{
		dbConnect();
		
		String sql = "INSERT INTO users_voy VALUES(?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, lc.getId_voy());
		st.setString(2, lc.getEmail());
		
		st.executeUpdate();
		dbClose();
	}
	
	public void contact(String email, String msg) throws SQLException{
		dbConnect();
		String sql = "INSERT INTO contacts VALUES(?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, email);
		st.setString(2, msg);
		
		st.executeUpdate();
		dbClose();
	}
	
	public void deleteMsg(String email) throws SQLException {
		
		dbConnect();
		String sql = "Delete from contacts where email=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, email);
		st.executeUpdate();
		dbClose();	
	}
	
	public Travel search(String destination,String type,String date,String duree,String prix) throws SQLException{
		dbConnect();
		Travel t =new Travel();
		String sql = "select * from voyages where destination=? and type=? and date=? and duree=? and prix=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, destination);
		st.setString(2, type);
		st.setString(3, date);
		st.setString(4, duree);
		st.setString(5, prix);
		ResultSet rst = st.executeQuery();
		while(rst.next()){
			t.setId(rst.getInt("id"));
			t.setDestination(rst.getString("destination"));
			t.setType(rst.getString("type"));
			t.setDate(rst.getString("date"));
			t.setDuree(rst.getString("duree"));
			t.setPrix(rst.getString("prix"));
		}
		dbClose();
		
		return t;
	}
	
	public void removeCart(LigneCommande lc) throws SQLException{
		dbConnect();
		String sql = "Delete from users_voy where id_voy=? and email=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, lc.getId_voy());
		st.setString(2, lc.getEmail());
		st.executeUpdate();
		dbClose();
	}
	
	public void paiement(String email) throws SQLException{
		dbConnect();
		String sql = "Delete from users_voy where email=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, email);
		st.executeUpdate();
		dbClose();
	}


}
