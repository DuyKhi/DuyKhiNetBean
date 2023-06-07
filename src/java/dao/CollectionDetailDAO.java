/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.CollectionDetail;

/**
 *
 * @author quoct
 */
public class CollectionDetailDAO extends DBContext {

    public List<CollectionDetail> getAllCollectionDetail() {
        List<CollectionDetail> list = new ArrayList<>();

        String sql = "Select * From CollectionDetail";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById(rs.getInt(3));
                CollectionDetail cd = new CollectionDetail(rs.getInt(1), rs.getString(2), acc);
                list.add(cd);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public CollectionDetail getCollectionDetailById(int id) {

        String sql = "Select * From CollectionDetail Where CollectionDetailID = " + id;

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                AccountDAO accDAO = new AccountDAO();
                Account acc = accDAO.getAccountById(rs.getInt(3));
                CollectionDetail cd = new CollectionDetail(rs.getInt(1), rs.getString(2), acc);
                return cd;
            }
        } catch (Exception e) {
        }
        return null;
    }

}
