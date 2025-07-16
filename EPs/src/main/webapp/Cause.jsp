<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
    
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Causes</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/theme-default.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@700&display=swap" rel="stylesheet">
    <style>
      body {
        background: #f6f8fb;
        font-family: 'Fredoka', Arial, sans-serif;
      }
      .sidebar {
        position: fixed;
        top: 0; left: 0; bottom: 0;
        width: 220px;
        background: #fff;
        box-shadow: 2px 0 12px rgba(0,0,0,0.06);
        padding: 30px 0 0 0;
        z-index: 100;
        border-radius: 0 20px 20px 0;
        transition: width 0.3s, opacity 0.3s;
        opacity: 1;
        overflow: hidden;
      }
      .sidebar.collapsed {
        width: 0;
        opacity: 0;
        pointer-events: none;
      }
      .sidebar .brand {
        font-size: 2rem;
        font-weight: 700;
        color: #222;
        margin-bottom: 2rem;
        text-align: center;
        letter-spacing: 1px;
        transition: opacity 0.3s, font-size 0.3s, margin-bottom 0.3s;
        opacity: 1;
      }
      .sidebar.collapsed .brand {
        opacity: 0;
      }
      .sidebar ul {
        list-style: none; padding: 0;
        transition: opacity 0.3s;
      }
      .sidebar.collapsed ul {
        opacity: 0;
        pointer-events: none;
        height: 0;
        overflow: hidden;
      }
      .sidebar ul li { margin: 18px 0; }
      .sidebar ul li a {
        color: #555;
        text-decoration: none;
        font-size: 1.1rem;
        padding: 10px 30px;
        display: block;
        border-radius: 8px 0 0 8px;
        transition: background 0.2s, color 0.2s;
      }
      .sidebar ul li a.active, .sidebar ul li a:hover {
        background: #e6e9f0;
        color: #4b49ac;
      }
      .topbar {
        margin-left: 220px;
        height: 64px;
        background: #fff;
        box-shadow: 0 2px 12px rgba(0,0,0,0.06);
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 32px;
        border-radius: 0 0 20px 20px;
        transition: margin-left 0.3s;
      }
      .sidebar.collapsed ~ .topbar {
        margin-left: 0;
      }
      .dashboard-content {
        margin-left: 240px;
        margin-top: 80px;
        padding: 32px 32px 32px 0;
        transition: margin-left 0.3s;
      }
      .sidebar.collapsed ~ .dashboard-content {
        margin-left: 18px;
      }
      .dashboard-logo-floating {
        display: none;
        position: fixed;
        top: 18px;
        left: 18px;
        z-index: 101;
        font-size: 2rem;
        font-weight: 700;
        color: #222;
        background: #fff;
        border-radius: 12px;
        padding: 8px 18px 8px 12px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        letter-spacing: 1px;
        align-items: center;
        gap: 10px;
      }
      .sidebar.collapsed ~ .dashboard-logo-floating {
        display: flex;
      }
      #sidebarToggle {
        background: none;
        border: none;
        font-size: 1.7rem;
        margin-bottom: 10px;
        cursor: pointer;
        outline: none;
        display: block;
        margin-left: auto;
        margin-right: auto;
        z-index: 102;
        position: relative;
      }
      .sidebar.collapsed ~ .dashboard-logo-floating #sidebarToggleFloating {
        display: inline-block;
      }
      #sidebarToggleFloating {
        background: none;
        border: none;
        font-size: 1.7rem;
        cursor: pointer;
        outline: none;
        margin-right: 8px;
        display: none;
      }
      @media (max-width: 700px) {
        .sidebar { width: 100vw; border-radius: 0; }
        .sidebar.collapsed { width: 0; }
        .dashboard-content { margin-left: 0; }
        .sidebar.collapsed ~ .dashboard-content { margin-left: 0; }
        .topbar { margin-left: 0; }
      }
      .dashboard-cards {
        display: flex;
        gap: 24px;
        margin-bottom: 32px;
      }
      .dashboard-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        padding: 24px 32px;
        flex: 1;
        min-width: 180px;
        text-align: center;
      }
      .dashboard-card h4 {
        font-size: 1.1rem;
        color: #888;
        margin-bottom: 8px;
      }
      .dashboard-card .count {
        font-size: 2.2rem;
        font-weight: 700;
        color: #4b49ac;
      }
      .table-area {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        padding: 24px;
      }
      .btn-primary, .btn-success, .btn-danger, .btn-warning {
        border-radius: 8px;
        font-weight: 600;
      }
      .table thead th {
        background: #f6f8fb;
        border: none;
      }
      .table tbody tr {
        border-top: 1px solid #f0f0f0;
      }
      .download-btns {
        margin-bottom: 18px;
        display: flex;
        gap: 12px;
      }
    </style>
</head>
<body>
    <div class="sidebar" id="sidebar">
      <div class="brand">AidFund<span class="plus" style="color:#a32020; font-weight:700;">+</span></div>
      <button id="sidebarToggle" title="Toggle Menu">&#9776;</button>
      <ul id="sidebarMenu">
		<li><a href="dashboard"><i class="fa fa-tachometer"></i> Dashboard</a></li>
        <li><a href="Cause"class="active"><i class="fa fa-heart"></i> Causes</a></li>
        <li><a href="report.jsp"><i class="fa fa-file"></i> Reports</a></li>
		<li><a href="LogoutController"><i class="fa fa-sign-out"></i> Logout</a></li>
      </ul>
    </div>
    <div class="dashboard-logo-floating" id="dashboardLogoFloating">
      <button id="sidebarToggleFloating" title="Show Menu">&#9776;</button>
      <span style="font-weight:700; font-size:2rem; color:#222; font-family:'Fredoka',Arial,sans-serif;">AidFund<span class="plus" style="color:#a32020; font-weight:700;">+</span></span>
    </div>
    <div class="topbar">
      <div><b>Welcome, Admin</b></div>
      <div class="profile">
        <i class="fa fa-bell" style="font-size: 1.3rem; color: #4b49ac;"></i>
      </div>
    </div>
    <div class="dashboard-content">
      <div class="table-area" id="causes">
        <div class="d-flex justify-content-between align-items-center mb-3">
          <button class="btn btn-success" onclick="openCauseModal()">+ Create Cause</button>
        </div>
        <div class="table-responsive">
          <table class="table" id="causesTable">
            <thead>
              <tr>
                <th>Title</th>
                <th>Headline</th>
                <th>Description</th>
                <th>Thumbnail</th>
                <th>Target Amount</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Total Collected</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="cause" items="${causes}">
                <tr>
                  <td>${cause.title}</td>
                  <td>${cause.headline}</td>
                  <td>${cause.description}</td>
                  <td>
                  <img src="${cause.thumbnail}" alt="${cause.title} Thumbnail" style="width: 100px; height: auto; border-radius: 8px;" />
                  </td>
                  <td>RM ${cause.targetAmount}</td>
                  <td>${cause.startDate}</td>
                  <td>${cause.endDate}</td>
                  <td>RM ${cause.totalCollected}</td>
                  <td>${cause.status}</td>
                  <td>
                    <form action="EditCauseController" method="get" style="display:inline;">
                      <input type="hidden" name="causeId" value="${cause.causeId}" />
                      <button type="submit" class="btn btn-sm btn-warning"><i class="fa fa-pencil"></i></button>
                    </form>
                    <form action="DeleteCauseController" method="post" style="display:inline;">
                      <input type="hidden" name="causeId" value="${cause.causeId}" />
                      <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Delete this cause?');"><i class="fa fa-trash"></i></button>
                    </form>
                    <form action="UpdateCauseStatusController" method="post" style="display:inline;">
                            <input type="hidden" name="causeId" value="${cause.causeId}" />
                            <input type="hidden" name="status" value="${cause.status == 'Active' ? 'Inactive' : 'Active'}" />
                            <button type="submit" class="btn btn-sm btn-info"><i class="fa fa-power-off"></i></button>
                        </form>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Create Cause Modal -->
    <div id="causeModalBg" style="display:none;position:fixed;top:0;left:0;width:100vw;height:100vh;background:rgba(30,40,60,0.18);z-index:9999;align-items:center;justify-content:center;">
      <div id="causeModal" style="
        background:#fff;
        border-radius:18px;
        box-shadow:0 8px 32px rgba(108,99,255,0.13);
        padding:24px 36px 18px 36px;
        min-width:340px;
        max-width:98vw;
        width:520px;
        max-height:90vh;
        overflow-y:auto;
        position:relative;
        display:flex;
        flex-direction:column;
        align-items:center;
        border:1.5px solid #ecebfc;
      ">
        <button onclick="closeCauseModal()" style="position:absolute;top:12px;right:18px;background:none;border:none;font-size:2rem;color:#aaa;cursor:pointer;">&times;</button>
        <h3 id="causeModalTitle" style="font-family:'Fredoka',Arial,sans-serif;font-weight:700;color:#6C63FF;text-align:center;margin-bottom:12px;">Create Cause</h3>
        <form action="AddCauseController?fix=1" method="post" style="width:100%;display:flex;flex-direction:column;gap:10px;" enctype="multipart/form-data">
       
          <input type="hidden" name="userId" value="1" />
		  <input type="hidden" name="status" value="Active" />
          
          <div class="form-group">
            <label style="font-weight:600;">Campaign ID</label>
            <input type="text" name="causeId" class="form-control" required placeholder="Enter unique Cause ID" style="width:100%;border-radius:8px;padding:8px;">
          </div>
          
          <div class="form-group">
            <label style="font-weight:600;">Campaign Name</label>
            <input type="text" name="title" class="form-control" required style="width:100%;border-radius:8px;padding:8px;">
          </div>
          
          <div class="form-group">
            <label style="font-weight:600;">Thumbnail Image</label>
            <input type="file" name="thumbnail" accept="image/*" class="form-control" required style="width:100%;border-radius:8px;padding:8px;">
            <img id="thumbPreview" style="display:none;margin-top:8px;max-width:100%;border-radius:8px;" />
          </div>
          
          <div class="form-group">
            <label style="font-weight:600;">Headline</label>
            <input type="text" name="headline" class="form-control" required style="width:100%;border-radius:8px;padding:8px;">
          </div>
          
          <div class="form-group">
            <label style="font-weight:600;">Description</label>
            <textarea name="description" class="form-control" required style="width:100%;border-radius:8px;padding:8px;min-height:60px;"></textarea>
          </div>
          
          <div class="form-group" style="display:grid;grid-template-columns:1fr 1fr 1fr;gap:8px;">
            <div>
              <label style="font-weight:600;">Target Amount</label>
              <input type="number" name="targetAmount" class="form-control" required style="width:100%;border-radius:8px;padding:8px;">
            </div>
            
            <div>
              <label style="font-weight:600;">Start Date</label>
              <input type="date" name="startDate" class="form-control" required style="width:100%;border-radius:8px;padding:8px;">
            </div>
            
            <div>
              <label style="font-weight:600;">End Date</label>
              <input type="date" name="endDate" class="form-control" required style="width:100%;border-radius:8px;padding:8px;">
            </div>
            
          </div>
          
          <button type="submit" id="causeFormSubmitBtn" class="btn btn-primary" style="width:100%;background:#6C63FF;border:none;border-radius:10px;font-weight:700;font-size:1.1rem;padding:12px 0;margin-top:8px;">Create</button>
        </form>
      </div>
    </div>

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
      function openCauseModal() {
        document.getElementById('causeModalBg').style.display = 'flex';
      }

      function closeCauseModal() {
        document.getElementById('causeModalBg').style.display = 'none';
      }

      // Sidebar collapse/expand
      function toggleSidebar() {
  var sidebar = document.getElementById('sidebar');
  var floatingLogo = document.getElementById('dashboardLogoFloating');
  sidebar.classList.toggle('collapsed');
  if (sidebar.classList.contains('collapsed')) {
    floatingLogo.style.display = 'flex';
  } else {
    floatingLogo.style.display = 'none';
  }
}

document.getElementById('sidebarToggle').onclick = toggleSidebar;
document.getElementById('sidebarToggleFloating').onclick = toggleSidebar;

//Highlight active link in sidebar
window.addEventListener('DOMContentLoaded', function () {
  var currentPath = window.location.pathname.split('/').pop(); // Get filename only
  var sidebarLinks = document.querySelectorAll('#sidebarMenu a');

  sidebarLinks.forEach(function (link) {
    var linkPath = link.getAttribute('href');
    if (linkPath === currentPath) {
      link.classList.add('active');
    } else {
      link.classList.remove('active');
    }
  });
});
      /*// Thumbnail preview
      document.querySelector('#causeForm input[name="thumbnail"]').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
          const reader = new FileReader();
          reader.onload = function(evt) {
            document.getElementById('thumbPreview').src = evt.target.result;
            document.getElementById('thumbPreview').style.display = 'block';
          };
          reader.readAsDataURL(file);
        }
      });*/
    </script>
</body>
</html>