package database2;

import java.sql.*;
import java.util.*;
import database.animal;
import database.cart;

public class animal2 {
    
    private Connection con;
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public animal2(Connection con) {
        super();
        this.con = con;
    }
    
 // 
	
	
	public List<animal> getallanimal() {
        List<animal> book = new ArrayList<>();
        
        try {
            query = "select * from animal";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

	            while (rs.next()) {
	            	animal row = new animal();
	                row.setId(rs.getInt("petid"));
	                row.setName(rs.getString("petname"));
	                row.setPrice(rs.getDouble("petprice"));
	                row.setImage(rs.getString("petimg"));
	
	                book.add(row);
	            }
            } 
        	
        	catch (SQLException e) {
                e.printStackTrace();
                System.out.println(e.getMessage());
            }
        
            return book;

        }
	
	public animal getSingleAnimal(int id) {
		 animal row = null;
	        try {
	            query = "select * from animal where petid=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new animal();
	                row.setId(rs.getInt("petid"));
	                row.setName(rs.getString("petname"));
	                row.setPrice(rs.getDouble("petprice"));
	                row.setImage(rs.getString("petimg"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	
	public double getTotalCartPrice(ArrayList<cart> cartlist) {
        double sum = 0;
        try {
            if (cartlist.size() > 0) {
                for (cart item : cartlist) {
                    query = "select petprice from animal where petid=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("petprice")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	
	public List<cart> getCartProducts(ArrayList<cart> cartlist) {
        List<cart> book = new ArrayList<>();
        try {
            if (cartlist.size() > 0) {
                for (cart item : cartlist) {
                    query = "select * from animal where petid=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        cart row = new cart();
                        row.setId(rs.getInt("petid"));
                        row.setName(rs.getString("petname"));
                        row.setPrice(rs.getDouble("petprice")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

	
}