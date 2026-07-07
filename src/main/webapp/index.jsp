<%-- 
    Document   : index
    Created on : 3 Jul 2026, 7:53:12 pm
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dynamic CV Workspace</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-slate-900 font-sans min-h-screen p-4 md:p-12 flex flex-col items-center justify-center">

    <div class="max-w-2xl w-full mb-4 flex flex-wrap gap-2 justify-between items-center px-2">
        <span class="text-xs font-mono tracking-widest text-slate-500 uppercase">Tailwind Engine v2.0</span>
        <div class="flex space-x-2">
            <a href="example?type=ats" target="_blank" class="bg-slate-800 hover:bg-slate-700 text-emerald-400 text-xs font-bold py-2 px-3 rounded-lg border border-slate-700 transition shadow-sm">
                📄 ATS Example
            </a>
            <a href="example?type=normal" target="_blank" class="bg-slate-800 hover:bg-slate-700 text-blue-400 text-xs font-bold py-2 px-3 rounded-lg border border-slate-700 transition shadow-sm">
                🎴 Normal Example
            </a>
        </div>
    </div>

    <div class="max-w-2xl w-full bg-slate-800 rounded-2xl shadow-2xl p-6 md:p-8 border border-slate-700 text-slate-100">
        <div class="mb-6">
            <h2 class="text-2xl font-black text-white tracking-tight">Create Your Profile</h2>
            <p class="text-xs text-slate-400 mt-1">Fill fields below to generate your layout canvas print template</p>
        </div>

        <form action="generate" method="POST" enctype="multipart/form-data" class="space-y-4">
            <div>
                <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Profile Photo</label>
                <input type="file" name="profilePic" accept="image/*"
                       class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2 text-sm text-slate-300 file:mr-4 file:py-1 file:px-3 file:rounded-md file:border-0 file:text-xs file:font-semibold file:bg-blue-600 file:text-white hover:file:bg-blue-500 focus:outline-none">
            </div>

            <div>
                <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Full Name</label>
                <input type="text" name="fullName" required placeholder="John Doe" 
                       class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Email Address</label>
                    <input type="email" name="email" required placeholder="name@example.com"
                           class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>
                <div>
                    <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Phone Number</label>
                    <input type="text" name="phone" required placeholder="+1 234 567 890"
                           class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
                </div>
            </div>

            <div>
                <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Profile Summary</label>
                <textarea name="summary" required rows="3" placeholder="Brief professional overview..."
                          class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition resize-none"></textarea>
            </div>

            <div>
                <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Work Experience</label>
                <textarea name="experience" required rows="4" placeholder="Job Title - Company&#10;• Responsibilities and achievements..."
                          class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-slate-300 focus:outline-none focus:ring-2 focus:ring-blue-500 transition"></textarea>
            </div>

            <div>
                <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Education History</label>
                <textarea name="education" required rows="2" placeholder="Degree Details..."
                          class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition"></textarea>
            </div>

            <div>
                <label class="block text-xs font-bold uppercase tracking-wider text-slate-400 mb-1">Skills (Comma Separated)</label>
                <input type="text" name="skills" required placeholder="Java, SQL, Tailwind"
                       class="w-full bg-slate-900 border border-slate-700 rounded-xl px-4 py-2.5 text-sm text-white focus:outline-none focus:ring-2 focus:ring-blue-500 transition">
            </div>

            <div class="bg-slate-900 p-4 rounded-xl border border-slate-700 space-y-2">
                <span class="block text-xs font-bold uppercase tracking-wider text-slate-400">Layout Selection Engine:</span>
                <label class="flex items-center cursor-pointer group">
                    <input type="radio" name="templateType" value="ats" checked class="h-4 w-4 text-blue-500">
                    <span class="ml-2.5 text-xs font-medium text-slate-300 group-hover:text-white transition">ATS-Friendly (Single-Column, Plain Minimalist)</span>
                </label>
                <label class="flex items-center cursor-pointer group">
                    <input type="radio" name="templateType" value="normal" class="h-4 w-4 text-blue-500">
                    <span class="ml-2.5 text-xs font-medium text-slate-300 group-hover:text-white transition">Normal Layout (Modern Split-Column, Dark Sidebar Profile)</span>
                </label>
            </div>

            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-500 text-white font-bold py-3 px-4 rounded-xl text-sm tracking-wide shadow-xl transition">
                Generate View Canvas
            </button>
        </form>
    </div>

</body>
</html>