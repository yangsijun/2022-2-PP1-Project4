package com.example.dao;

import com.example.bean.MemberVO;
import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String MEMBER_INSERT = "insert into Member (name, memberLevel, id, password, email, phoneNumber, regDate, filename) values (?,?,?,?,?,?,?,?)";
    private final String MEMBER_UPDATE = "update Member set name=?, memberLevel=?, id=?, password=?, email=?, phoneNumber=?, regDate=?, filename=? where sid=?";
    private final String MEMBER_DELETE = "delete from Member where sid=?";
    private final String MEMBER_GET = "select * from Member  where sid=?";
    private final String MEMBER_LIST = "select * from Member order by sid asc";

    public int insertMember(MemberVO vo) {
        System.out.println("===> JDBC로 insertMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_INSERT);
//			stmt.setInt(1, vo.getSid());
//			stmt.setString(2, vo.getName());
//			stmt.setInt(3, vo.getMemberLevel());
//			stmt.setString(4, vo.getId());
//			stmt.setString(5, vo.getPassword());
//			stmt.setString(6, vo.getEmail());
//			stmt.setString(7, vo.getPhoneNumber());
//			stmt.setDate(8, new Date(vo.getRegDate().getTime()));

            stmt.setString(1, vo.getName());
            stmt.setInt(2, vo.getMemberLevel());
            stmt.setString(3, vo.getId());
            stmt.setString(4, vo.getPassword());
            stmt.setString(5, vo.getEmail());
            stmt.setString(6, vo.getPhoneNumber());
            stmt.setDate(7, new Date(vo.getRegDate().getTime()));
            stmt.setString(8, vo.getFilename());

            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 멤버 삭제
    public void deleteMember(int sid) {
        System.out.println("===> JDBC로 deleteMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_DELETE);
            stmt.setInt(1, sid);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int updateMember(MemberVO vo) {
        System.out.println("===> JDBC로 updateMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_UPDATE);
            stmt.setString(1, vo.getName());
            stmt.setInt(2, vo.getMemberLevel());
            stmt.setString(3, vo.getId());
            stmt.setString(4, vo.getPassword());
            stmt.setString(5, vo.getEmail());
            stmt.setString(6, vo.getPhoneNumber());
            stmt.setDate(7, new Date(vo.getRegDate().getTime()));
            stmt.setString(8, vo.getFilename());
            stmt.setInt(9, vo.getSid());


            System.out.println(vo.getSid() + "-" + vo.getName() + "-" + vo.getMemberLevel() + "-" + vo.getId() + "-" + vo.getPassword() + "-" + vo.getEmail() + "-" + vo.getPhoneNumber() + "-" + vo.getRegDate());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public MemberVO getMember(int sid) {
        MemberVO one = new MemberVO();
        System.out.println("===> JDBC로 getMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_GET);
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if (rs.next()) {
                one.setName(rs.getString("name"));
                one.setMemberLevel(rs.getInt("memberLevel"));
                one.setId(rs.getString("id"));
                one.setPassword(rs.getString("password"));
                one.setEmail(rs.getString("email"));
                one.setPhoneNumber(rs.getString("phoneNumber"));
                one.setRegDate(rs.getDate("regDate"));
                one.setFilename(rs.getString("filename"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<MemberVO> getMemberList() {
        List<MemberVO> list = new ArrayList<MemberVO>();
        System.out.println("===> JDBC로 getMemberList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_LIST);
            rs = stmt.executeQuery();
            while (rs.next()) {
                MemberVO one = new MemberVO();
                one.setSid(rs.getInt("sid"));
                one.setName(rs.getString("name"));
                one.setMemberLevel(rs.getInt("memberLevel"));
                one.setId(rs.getString("id"));
                one.setPassword(rs.getString("password"));
                one.setEmail(rs.getString("email"));
                one.setPhoneNumber(rs.getString("phoneNumber"));
                one.setRegDate(rs.getDate("regDate"));
                one.setFilename(rs.getString("filename"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int sid) {
        String filename = "";
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement("select filename from member where sid=?");
            stmt.setInt(1, sid);
            rs = stmt.executeQuery();
            if (rs.next()) {
                filename = rs.getString("photo");
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
        return filename;
    }
}
