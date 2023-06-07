package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;

public class AccountDAO extends DBContext {

    public Account getAccountById(int id) {
        String sql = "Select * From Account Where AccountID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account acc = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
                return acc;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Account> getAllAccount() {
        ArrayList<Account> listAccount = new ArrayList<Account>();
        String sql = "select * from Account";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listAccount.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAccount;
    }

    public void addAccount(String firtName, String lastName, String userName, String password, String phone, String email, String dbo, int role) {
        String sql = "INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])\n"
                + "VALUES (?,? ,? ,? ,? ,? ,? , ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, firtName);
            ps.setString(2, lastName);
            ps.setString(3, userName);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, dbo);
            ps.setInt(8, role);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void deleteAccount(int id) {
        String sql = "delete from Account\n"
                + "where AccountID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateAccount(String firtName, String lastName, String userName, String password, String phone, String email, String dbo, int role,int id) {
        String sql = "update Account set	\n"
                + "FirstName = ?,\n"
                + "LastName = ?,\n"
                + "UserName= ?,\n"
                + "[Password]= ?,\n"
                + "Phone= ?,\n"
                + "Email=? ,\n"
                + "DOB= ?,\n"
                + "[Role]= ?\n"
                + "where AccountID = ?";  
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, firtName);
            ps.setString(2, lastName);
            ps.setString(3, userName);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, dbo);
            ps.setInt(8, role);
            ps.setInt(9, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Account> countAccount (String search){
        ArrayList<Account> list = new ArrayList<>();
        String sql = "select * from Account where FirstName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int getTotalAccount (){
        String sql = "select count (*) from Account ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);           
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public ArrayList<Account> pagingAccount (int index){
        ArrayList<Account> list = new ArrayList<>();
        String sql = "select * from Account order by AccountID offset ? Rows Fetch next 5 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 5);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        ArrayList<Account> list = a.countAccount("E");
        for (Account account : list) {
            System.out.println(account.toString());
        }
    }
}
