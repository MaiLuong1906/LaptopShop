package com.example.helloworld.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadFileService {

    private final ServletContext servletContext;

    public UploadFileService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String saveFile(String fileName, MultipartFile file) {
        if (file.isEmpty()) {
            return "";
        }
        String finalString = "";
        try {
            byte[] bytes = file.getBytes();
            String rootPath = servletContext.getRealPath("/resources/images/");

            File dir = new File(rootPath + File.separator + fileName);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            // Create the file on server
            finalString = System.currentTimeMillis() + "-"
                    + file.getOriginalFilename();
            File serverFile = new File(
                    dir.getAbsolutePath() + File.separator + finalString);

            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception, e.g., return an error page or message
        }
        return finalString;
    }
}
