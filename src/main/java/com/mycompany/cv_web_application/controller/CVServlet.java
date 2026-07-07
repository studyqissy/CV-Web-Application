/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.cv_web_application.controller;

import com.mycompany.cv_web_application.model.CVModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Base64;
import java.util.stream.Collectors;

@WebServlet(urlPatterns = {"/generate", "/example"})
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class CVServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String type = request.getParameter("type");
        if (type == null) type = "normal";

        CVModel sample = new CVModel();
        sample.setFullName("John Doe");
        sample.setEmail("johndoe@example.com");
        sample.setPhone("+1 234 567 890");
        sample.setSummary("Result-driven software engineer with extensive experience designing high-performance systems.");
        sample.setExperience("Senior Software Engineer — Tech Enterprise (2022 - 2026)\n• Architected microservices optimizing operational pipeline throughput.");
        sample.setEducation("B.S. in Computer Science — State University");
        sample.setSkills("Java, SQL, Tailwind CSS");
        sample.setTemplateType(type);
        sample.setProfileImageData(""); 

        // Tag this request as an example view
        request.setAttribute("isExample", true);

        request.setAttribute("cvData", sample);
        request.getRequestDispatcher("/viewCV.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        CVModel cv = new CVModel();
        
        cv.setFullName(getValueFromPart(request.getPart("fullName")));
        cv.setEmail(getValueFromPart(request.getPart("email")));
        cv.setPhone(getValueFromPart(request.getPart("phone")));
        cv.setSummary(getValueFromPart(request.getPart("summary")));
        cv.setExperience(getValueFromPart(request.getPart("experience")));
        cv.setEducation(request.getPart("education") != null ? getValueFromPart(request.getPart("education")) : "");
        cv.setSkills(getValueFromPart(request.getPart("skills")));
        cv.setTemplateType(getValueFromPart(request.getPart("templateType")));

        Part filePart = request.getPart("profilePic");
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream inputStream = filePart.getInputStream()) {
                byte[] bytes = inputStream.readAllBytes();
                String base64Image = Base64.getEncoder().encodeToString(bytes);
                cv.setProfileImageData("data:" + filePart.getContentType() + ";base64," + base64Image);
            }
        } else {
            cv.setProfileImageData("");
        }

        // Tag this request as a real generation (not an example)
        request.setAttribute("isExample", false);

        request.setAttribute("cvData", cv);
        request.getRequestDispatcher("/viewCV.jsp").forward(request, response);
    }

    private String getValueFromPart(Part part) throws IOException {
        if (part == null) return "";
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"))) {
            return reader.lines().collect(Collectors.joining("\n")).trim();
        }
    }
}