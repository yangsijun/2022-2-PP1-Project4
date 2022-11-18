package com.example.common;

import com.example.bean.MemberVO;
import com.example.dao.MemberDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;

public class FileUpload {
    public MemberVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024;

        String realPath = request.getServletContext().getRealPath("upload");

        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        MemberVO one = null;
        MultipartRequest multipartRequest = null;

        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");

            one = new MemberVO();
            String sid = multipartRequest.getParameter("sid");
            if (sid != null && !sid.equals(""))
                one.setSid(Integer.parseInt(sid));
            one.setName(multipartRequest.getParameter("name"));
            one.setMemberLevel(Integer.parseInt(multipartRequest.getParameter("memberLevel")));
            one.setId(multipartRequest.getParameter("id"));
            one.setPassword(multipartRequest.getParameter("password"));
            one.setEmail(multipartRequest.getParameter("email"));
            one.setPhoneNumber(multipartRequest.getParameter("phoneNumber"));
            one.setRegDate(new Date());

            if (sid != null && !sid.equals("")) {
                MemberDAO dao = new MemberDAO();
                String oldFilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if (filename != null && oldFilename != null)
                    FileUpload.deleteFile(request, oldFilename);
                else if (filename == null && oldFilename != null)
                    filename = oldFilename;
            }
            one.setFilename(filename);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if (f.exists()) {
            f.delete();
        }
    }
}
