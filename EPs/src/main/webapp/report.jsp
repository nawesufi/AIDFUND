<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
      .btn-primary, .btn-success, .btn-danger, .btn-warning, .btn-secondary {
        border-radius: 8px;
        font-weight: 600;
      }
      .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
        color: white;
      }
      .btn-secondary:hover {
        background-color: #5a6268;
        border-color: #545b62;
        color: white;
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
      .report-section-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        padding: 32px 32px 24px 32px;
        margin-bottom: 32px;
        max-width: 900px;
        margin-left: auto;
        margin-right: auto;
      }
      .report-filters {
        display: flex;
        flex-wrap: wrap;
        gap: 32px;
        margin-bottom: 24px;
      }
      .report-filter-group {
        flex: 1 1 320px;
        min-width: 260px;
        background: #f6f8fb;
        border-radius: 12px;
        padding: 18px 20px 12px 20px;
        margin-bottom: 0;
      }
      .report-filter-group label {
        font-weight: 700;
        color: #4b49ac;
        margin-bottom: 8px;
        display: block;
        font-size: 1.08rem;
      }
      .report-filter-group select, .report-filter-group input {
        border-radius: 10px;
        border: 1.5px solid #e6e9f0;
        background: #fff;
        font-size: 1.1rem;
        padding: 10px 14px;
        width: 100%;
        margin-bottom: 12px;
      }
      .report-filter-group button {
        width: 100%;
        margin-top: 8px;
        font-size: 1.08rem;
        padding: 12px 0;
      }
      .download-btns {
        margin-bottom: 24px;
        display: flex;
        gap: 16px;
        justify-content: flex-start;
      }
      .report-table-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        padding: 24px;
        margin-top: 24px;
      }
      .table thead th {
        position: sticky;
        top: 0;
        background: #f6f8fb;
        z-index: 2;
      }
      .table tbody tr:hover {
        background: #f6f8fb;
      }
      @media (max-width: 900px) {
        .report-section-card { padding: 18px 4vw 12px 4vw; }
      }
      @media (max-width: 700px) {
        .report-filters { flex-direction: column; gap: 18px; }
        .report-section-card { padding: 10px 2vw 8px 2vw; }
      }
    </style>
	</head>
	<body>
	<div class="sidebar" id="sidebar">
      <div class="brand">AidFund<span class="plus" style="color:#a32020; font-weight:700;">+</span></div>
      <button id="sidebarToggle" title="Toggle Menu">&#9776;</button>
      <ul id="sidebarMenu">
		<li><a href="dashboard"><i class="fa fa-tachometer"></i> Dashboard</a></li>
        <li><a href="Cause"><i class="fa fa-heart"></i> Causes</a></li>
        <li><a href="report"class="active"><i class="fa fa-file"></i> Reports</a></li>
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
  <h2 style="font-weight:700; color:#4b49ac; margin-bottom:18px;">Donation Report</h2>
  <div class="report-section-card">
    <div class="download-btns">
      <form method="get" action="DownloadPDF" style="display:inline;">
        <input type="hidden" name="month" value="${param.month}" />
        <input type="hidden" name="year" value="${param.year}" />
        <input type="hidden" name="causeId" value="${param.causeId}" />
        <button type="submit" class="btn btn-primary report-btn" style="margin-right: 10px;">
          <i class="fa fa-file-pdf-o"></i> Download PDF
        </button>
      </form>
    </div>
    <div class="report-filters">
      <form method="get" action="byMonthReport" class="report-filter-group">
        <label for="month"><i class="fa fa-calendar"></i> Month:</label>
        <select name="month" id="month">
          <option value="1" <c:if test="${param.month == '1'}">selected</c:if>>January</option>
          <option value="2" <c:if test="${param.month == '2'}">selected</c:if>>February</option>
          <option value="3" <c:if test="${param.month == '3'}">selected</c:if>>March</option>
          <option value="4" <c:if test="${param.month == '4'}">selected</c:if>>April</option>
          <option value="5" <c:if test="${param.month == '5'}">selected</c:if>>May</option>
          <option value="6" <c:if test="${param.month == '6'}">selected</c:if>>June</option>
          <option value="7" <c:if test="${param.month == '7'}">selected</c:if>>July</option>
          <option value="8" <c:if test="${param.month == '8'}">selected</c:if>>August</option>
          <option value="9" <c:if test="${param.month == '9'}">selected</c:if>>September</option>
          <option value="10" <c:if test="${param.month == '10'}">selected</c:if>>October</option>
          <option value="11" <c:if test="${param.month == '11'}">selected</c:if>>November</option>
          <option value="12" <c:if test="${param.month == '12'}">selected</c:if>>December</option>
        </select>
        <label for="year"><i class="fa fa-calendar"></i> Year:</label>
        <select name="year" id="year">
          <c:forEach begin="2023" end="2025" var="y">
            <option value="${y}" <c:if test="${param.year == y}">selected</c:if>>${y}</option>
          </c:forEach>
        </select>
        <button type="submit" class="btn btn-primary"><i class="fa fa-filter"></i> Filter by Month</button>
        <a href="report" class="btn btn-secondary" style="margin-top: 8px; display: block; text-align: center;"><i class="fa fa-times"></i> Clear Filter</a>
      </form>
      <form action="reportByCause" method="get" class="report-filter-group">
        <label for="causeId"><i class="fa fa-bullseye"></i> Campaign:</label>
        <select name="causeId" id="causeId">
          <c:forEach var="cause" items="${causeList}">
            <option value="${cause.causeId}" <c:if test="${param.causeId == cause.causeId}">selected</c:if>>
              ${cause.title}
            </option>
          </c:forEach>
        </select>
        <button type="submit" class="btn btn-success"><i class="fa fa-filter"></i> Filter by Campaign</button>
      </form>
    </div>
  </div>
  <div class="report-table-card">
    <c:if test="${empty donations}">
      <div class="alert alert-info text-center" style="margin: 20px 0;">
        <i class="fa fa-info-circle"></i> No donations found for the selected criteria.
        <c:if test="${not empty param.month and not empty param.year}">
          <br>Month: ${param.month}, Year: ${param.year}
        </c:if>
      </div>
    </c:if>
    <c:if test="${not empty donations}">
      <div class="alert alert-success" style="margin-bottom: 20px;">
        <i class="fa fa-check-circle"></i> Found ${donations.size()} donation(s)
        <c:if test="${not empty param.month and not empty param.year}">
          for ${param.month}/${param.year}
        </c:if>
      </div>
    </c:if>
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Reference ID</th>
          <th>Amount</th>
          <th>Date</th>
          <th>Campaign</th>
          <th>Donor ID</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="d" items="${donations}">
          <tr>
            <td>${d.donationID}</td>
            <td>RM ${d.amount}</td>
            <td>${d.donationDate}</td>
            <td>${d.causeId}</td>
            <td>${d.donorID}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
<script>
//Sidebar collapse/expand
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

// Debug form submission
document.addEventListener('DOMContentLoaded', function() {
    const monthForm = document.querySelector('form[action="byMonthReport"]');
    if (monthForm) {
        monthForm.addEventListener('submit', function(e) {
            const month = document.getElementById('month').value;
            const year = document.getElementById('year').value;
            console.log('Form submitting with month:', month, 'year:', year);
        });
    }
});
</script>
</body>
</html>