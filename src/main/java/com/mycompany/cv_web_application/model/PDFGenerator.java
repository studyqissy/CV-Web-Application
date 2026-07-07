/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.cv_web_application.model;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.OutputStream;

/**
 *
 * @author User
 */
public class PDFGenerator {
    
    public static void generateCV(CVModel cv, OutputStream out) throws Exception {
        Document document = new Document(PageSize.A4, 50, 50, 50, 50);
        PdfWriter.getInstance(document, out);
        document.open();

        if ("ats".equalsIgnoreCase(cv.getTemplateType())) {
            buildAtsTemplate(document, cv);
        } else {
            buildDesignedTemplate(document, cv);
        }

        document.close();
    }

    // ATS Friendly: Standard fonts, minimal formatting, single column, left-aligned
    private static void buildAtsTemplate(Document doc, CVModel cv) throws DocumentException {
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 22, BaseColor.BLACK);
        Font sectionFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, BaseColor.BLACK);
        Font bodyFont = FontFactory.getFont(FontFactory.HELVETICA, 11, BaseColor.BLACK);

        doc.add(new Paragraph(cv.getFullName(), titleFont));
        doc.add(new Paragraph(cv.getEmail() + " | " + cv.getPhone(), bodyFont));
        doc.add(new Paragraph("\n"));

        doc.add(new Paragraph("PROFESSIONAL SUMMARY", sectionFont));
        doc.add(new Paragraph(cv.getSummary(), bodyFont));
        doc.add(new Paragraph("\n"));

        doc.add(new Paragraph("WORK EXPERIENCE", sectionFont));
        doc.add(new Paragraph(cv.getExperience(), bodyFont));
        doc.add(new Paragraph("\n"));

        doc.add(new Paragraph("EDUCATION", sectionFont));
        doc.add(new Paragraph(cv.getEducation(), bodyFont));
    }

    // Designed Template: Bold colors, stylized sections, clear hierarchy
    private static void buildDesignedTemplate(Document doc, CVModel cv) throws DocumentException {
        BaseColor primaryColor = new BaseColor(0, 102, 204); // Vibrant Blue
        Font nameFont = FontFactory.getFont(FontFactory.TIMES_BOLD, 26, primaryColor);
        Font contactFont = FontFactory.getFont(FontFactory.TIMES_ITALIC, 11, BaseColor.DARK_GRAY);
        Font headFont = FontFactory.getFont(FontFactory.TIMES_BOLD, 16, primaryColor);
        Font textFont = FontFactory.getFont(FontFactory.TIMES, 12, BaseColor.BLACK);

        // Header Section
        Paragraph name = new Paragraph(cv.getFullName().toUpperCase(), nameFont);
        name.setAlignment(Element.ALIGN_CENTER);
        doc.add(name);

        Paragraph contact = new Paragraph(cv.getEmail() + "  •  " + cv.getPhone(), contactFont);
        contact.setAlignment(Element.ALIGN_CENTER);
        doc.add(contact);
        
        doc.add(new Paragraph("\n"));

        // Sections
        doc.add(new Paragraph("■ Executive Summary", headFont));
        doc.add(new Paragraph(cv.getSummary(), textFont));
        doc.add(new Paragraph("\n"));

        doc.add(new Paragraph("■ Professional Experience", headFont));
        doc.add(new Paragraph(cv.getExperience(), textFont));
        doc.add(new Paragraph("\n"));

        doc.add(new Paragraph("■ Academic History", headFont));
        doc.add(new Paragraph(cv.getEducation(), textFont));
    }
    
}
