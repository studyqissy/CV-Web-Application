<%-- 
    Document   : viewCV
    Created on : 3 Jul 2026, 9:20:00 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.cv_web_application.model.CVModel" %>
<%
    CVModel cv = (CVModel) request.getAttribute("cvData");
    boolean isAts = (cv != null && "ats".equalsIgnoreCase(cv.getTemplateType()));
    
    // Check if this is an example view
    Boolean isExampleObj = (Boolean) request.getAttribute("isExample");
    boolean isExample = (isExampleObj != null && isExampleObj);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= (cv != null) ? cv.getFullName() : "Curriculum Vitae" %></title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @media print {
            @page { margin: 15mm; }
            .no-print { display: none !important; }
            body { background: white !important; padding: 0 !important; }
        }
    </style>
</head>
<body class="<%= isAts ? "bg-white md:py-10 px-6 font-serif text-black" : "bg-slate-100 md:py-12 px-4 font-sans text-slate-800" %>">

    <% if (!isExample) { %>
        <div class="no-print max-w-3xl mx-auto mb-6 bg-slate-900 text-white p-4 rounded-xl flex justify-between items-center shadow-md">
            <a href="index.jsp" class="text-xs font-bold text-slate-400 hover:text-white transition">← Return to Form</a>
            <div class="flex items-center space-x-3">
                <span class="text-xs bg-slate-800 text-slate-400 px-2.5 py-1 rounded-md font-mono border border-slate-700">
                    Mode: <%= isAts ? "ATS Monochrome" : "Executive Split" %>
                </span>
                <button onclick="window.print()" class="bg-blue-600 hover:bg-blue-500 font-bold text-xs px-4 py-2 rounded-lg shadow-md transition">
                    💾 Save as PDF Document
                </button>
            </div>
        </div>
    <% } %>

    <% if (isAts) { %>
        <div class="max-w-3xl mx-auto space-y-6 <%= isExample ? "mt-6" : "" %>">
            <div class="text-center border-b-2 border-black pb-4">
                <h1 class="text-3xl font-bold uppercase tracking-wide"><%= cv.getFullName() %></h1>
                <p class="text-sm mt-1">Email: <%= cv.getEmail() %> | Phone: <%= cv.getPhone() %></p>
            </div>

            <div>
                <h2 class="text-base font-bold uppercase tracking-wider border-b border-black mb-2">Profile Summary</h2>
                <p class="text-sm leading-relaxed"><%= cv.getSummary() %></p>
            </div>

            <div>
                <h2 class="text-base font-bold uppercase tracking-wider border-b border-black mb-2">Work Experience</h2>
                <p class="text-sm leading-relaxed whitespace-pre-line"><%= cv.getExperience() %></p>
            </div>

            <div>
                <h2 class="text-base font-bold uppercase tracking-wider border-b border-black mb-2">Education</h2>
                <p class="text-sm leading-relaxed whitespace-pre-line"><%= cv.getEducation() %></p>
            </div>

            <div>
                <h2 class="text-base font-bold uppercase tracking-wider border-b border-black mb-2">Core Skills</h2>
                <p class="text-sm leading-relaxed"><%= cv.getSkills() %></p>
            </div>
        </div>

    <% } else { %>
        <div class="max-w-4xl mx-auto bg-white shadow-2xl rounded-2xl overflow-hidden grid grid-cols-1 md:grid-cols-12 min-h-[750px] border border-slate-200 print:shadow-none print:border-none">
            
            <div class="md:col-span-4 bg-slate-800 p-8 text-white flex flex-col items-center space-y-6">
                
                <% if (cv != null && cv.getProfileImageData() != null && !cv.getProfileImageData().isEmpty()) { %>
                    <img src="<%= cv.getProfileImageData() %>" alt="Profile" 
                         class="w-32 h-32 rounded-full object-cover border-4 border-slate-600 shadow-xl">
                <% } else { %>
                    <div class="w-32 h-32 bg-slate-700 rounded-full border-4 border-slate-600 flex items-center justify-center font-bold text-slate-400 shadow-xl text-3xl">
                        👤
                    </div>
                <% } %>
                
                <div class="text-center w-full">
                    <h2 class="text-2xl font-black tracking-tight text-white"><%= (cv != null) ? cv.getFullName() : "" %></h2>
                    <p class="text-xs text-blue-400 font-mono tracking-widest uppercase mt-1">Candidate Profile</p>
                </div>

                <div class="w-full border-t border-slate-700 pt-5 space-y-4">
                    <div>
                        <h3 class="text-xs font-bold uppercase tracking-widest text-slate-400 mb-2">Contact Details</h3>
                        <div class="space-y-2 text-xs text-slate-300">
                            <p>✉ <%= (cv != null) ? cv.getEmail() : "" %></p>
                            <p>📞 <%= (cv != null) ? cv.getPhone() : "" %></p>
                        </div>
                    </div>

                    <div>
                        <h3 class="text-xs font-bold uppercase tracking-widest text-slate-400 mb-2">Core Skills</h3>
                        <div class="flex flex-wrap gap-1.5">
                            <% if (cv != null && cv.getSkills() != null) {
                                for (String skill : cv.getSkills().split(",")) { %>
                                    <span class="bg-slate-700 text-slate-200 text-[10px] font-bold px-2.5 py-1 rounded-md border border-slate-600/50">
                                        <%= skill.trim() %>
                                    </span>
                            <% } } %>
                        </div>
                    </div>
                </div>
            </div>

            <div class="md:col-span-8 p-8 md:p-12 space-y-8">
                <div>
                    <h3 class="text-xs font-extrabold uppercase tracking-widest text-blue-600 border-b border-slate-100 pb-1 mb-2.5">Profile Summary</h3>
                    <p class="text-sm leading-relaxed text-slate-600 font-medium"><%= (cv != null) ? cv.getSummary() : "" %></p>
                </div>

                <div>
                    <h3 class="text-xs font-extrabold uppercase tracking-widest text-blue-600 border-b border-slate-100 pb-1 mb-2.5">Work Experience</h3>
                    <div class="text-sm leading-relaxed text-slate-600 whitespace-pre-line font-medium"><%= (cv != null) ? cv.getExperience() : "" %></div>
                </div>

                <div>
                    <h3 class="text-xs font-extrabold uppercase tracking-widest text-blue-600 border-b border-slate-100 pb-1 mb-2.5">Education History</h3>
                    <div class="text-sm leading-relaxed text-slate-600 whitespace-pre-line font-medium"><%= (cv != null) ? cv.getEducation() : "" %></div>
                </div>
            </div>
        </div>
    <% } %>

</body>
</html>