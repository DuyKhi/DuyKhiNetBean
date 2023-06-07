/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Account;
import model.Question;

/**
 *
 * @author quoct
 */
public class QuestionDAO extends DBContext {

    public Question getQuestionById(int id) {
        String sql = "Select * From Question Where QuestionId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Question question = new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                return question;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Question> getAllQuestion() {
        ArrayList<Question> list = new ArrayList<>();
        String sql = "select * from Question";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void deleteQuestion(int id) {
        String sql = "delete from Question where QuestionID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addQuestion(String detail, String answerA, String answerB, String answerC, String answerD, String trueAnswer) {
        String sql = "INSERT INTO Question (Detail, AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer)\n"
                + "                      VALUES (?,? ,? ,? ,?,? )";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setString(2, answerA);
            ps.setString(3, answerB);
            ps.setString(4, answerC);
            ps.setString(5, answerD);
            ps.setString(6, trueAnswer);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateQuestion(String detail, String answerA, String answerB, String answerC, String answerD, String trueAnswer, int id) {
        String sql = "update Question set\n"
                + "Detail = ?,\n"
                + "AnswerA = ?,\n"
                + "AnswerB = ?,\n"
                + "AnswerC = ?,\n"
                + "AnswerD = ?,\n"
                + "TrueAnswer = ?\n"
                + "where QuestionID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setString(2, answerA);
            ps.setString(3, answerB);
            ps.setString(4, answerC);
            ps.setString(5, answerD);
            ps.setString(6, trueAnswer);
            ps.setInt(7, id);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public ArrayList<Question> searchQuestion (String search){
        ArrayList <Question> list = new ArrayList<>();
        String sql = "select * from Question where Detail like ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
          
            while(rs.next()){
                list.add(new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  list;
    }
    
    public int getTotalQuestion (){
        String sql = "select count (*) from Question ";
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
    public ArrayList<Question> pagingQuestion (int index){
        ArrayList<Question> list = new ArrayList<>();
        String sql = "select * from Question order by QuestionID offset ? Rows Fetch next 10 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,( index - 1) * 10);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
               list.add(new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        QuestionDAO q = new QuestionDAO();
        ArrayList<Question> list = q.pagingQuestion(1);
        for (Question question : list) {
            System.out.println(question.toString());
        }
    }
}
