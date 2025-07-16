<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Donation" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>AidFund+</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
      body {
        background: #f6f8fb;
        font-family: 'Fredoka', Arial, sans-serif;
      }
      .user-topbar {
        width: 100%;
        height: 64px;
        background: linear-gradient(90deg, #f8fafc 0%, #e9ecef 100%);
        box-shadow: 0 4px 24px rgba(108,99,255,0.08);
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 32px;
        border-radius: 0 0 20px 20px;
        position: sticky;
        top: 0;
        z-index: 100;
      }
      .user-topbar .brand {
        font-size: 2rem;
        font-weight: 700;
        color: #222;
        letter-spacing: 1px;
        display: flex;
        align-items: center;
      }
      .user-topbar .brand .plus { color: #a51d23; }
      .user-topbar nav {
        display: flex;
        gap: 20px;
        align-items: center;
      }
      .user-topbar nav a {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #555;
        text-decoration: none;
        font-size: 1.1rem;
        font-weight: 600;
        padding: 8px 18px;
        border-radius: 10px;
        background: transparent;
        transition: background 0.2s, color 0.2s, box-shadow 0.2s, transform 0.2s;
        box-shadow: none;
      }
      .user-topbar nav a.active, .user-topbar nav a:hover {
        background: #ecebfc;
        color: #6C63FF;
        box-shadow: 0 2px 8px rgba(108,99,255,0.08);
      }
      .user-topbar nav .admin-login-btn {
        margin-left: 24px;
        background: #6C63FF;
        color: #fff;
        font-weight: 700;
        border-radius: 10px;
        box-shadow: 0 2px 8px rgba(108,99,255,0.18);
        transition: background 0.2s, color 0.2s, box-shadow 0.2s, transform 0.2s;
        font-size: 1.1rem;
      }
      .user-topbar nav .admin-login-btn:hover {
        background: #554ee2;
        color: #fff;
        box-shadow: 0 4px 16px rgba(108,99,255,0.22);
        transform: scale(1.05);
      }
      .user-topbar nav .lucide {
        width: 20px;
        height: 20px;
      }
      .main-content-user {
        margin-top: 0 !important;
        padding-top: 0 !important;
        padding-bottom: 32px;
      }
      .card-section {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        padding: 32px;
        margin-bottom: 32px;
      }
      h1, h2, h3, h4, h5, h6 {
        font-family: 'Fredoka', Arial, sans-serif;
      }
      @media (max-width: 700px) {
        .user-topbar { flex-direction: column; height: auto; padding: 12px; }
        .user-topbar nav { gap: 10px; }
        .main-content-user { padding: 12px 0; }
      }
      .footer { background: #ecebfc !important; }
      .donation-search-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(108,99,255,0.10);
        max-width: 420px;
        margin: 36px auto 32px auto;
        padding: 32px 28px 24px 28px;
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      .donation-search-card label {
        font-weight: 700;
        color: #4b49ac;
        margin-bottom: 10px;
        font-size: 1.13rem;
        display: flex;
        align-items: center;
        gap: 8px;
      }
      .donation-search-input-group {
        display: flex;
        width: 100%;
        gap: 0;
        margin-bottom: 0;
      }
      .donation-search-input-group input[type="text"] {
        border-radius: 10px 0 0 10px;
        border: 1.5px solid #e6e9f0;
        background: #f6f8fb;
        font-size: 1.1rem;
        padding: 12px 16px;
        flex: 1;
        outline: none;
        font-family: 'Fredoka', Arial, sans-serif;
        font-weight: 600;
        color: #222;
        border-right: none;
      }
      .donation-search-input-group button {
        border-radius: 0 10px 10px 0;
        border: 1.5px solid #6C63FF;
        background: #6C63FF;
        color: #fff;
        font-weight: 700;
        font-size: 1.08rem;
        padding: 0 22px;
        transition: background 0.18s, box-shadow 0.18s, transform 0.18s;
        box-shadow: 0 1px 4px rgba(108,99,255,0.07);
        display: flex;
        align-items: center;
        gap: 6px;
        cursor: pointer;
        border-left: none;
        height: 48px;
      }
      .donation-search-input-group button:hover, .donation-search-input-group button:focus {
        background: #554ee2;
        box-shadow: 0 4px 16px rgba(108,99,255,0.13);
        transform: scale(1.04);
      }
      .donation-result-card {
        background: #f6f8fb;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(108,99,255,0.10);
        max-width: 420px;
        margin: 0 auto 32px auto;
        padding: 28px 28px 20px 28px;
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        font-size: 1.08rem;
        position: relative;
      }
      .donation-result-card .result-icon {
        color: #4b49ac;
        font-size: 2.2rem;
        position: absolute;
        top: 18px;
        right: 22px;
      }
      .donation-result-card p {
        margin-bottom: 10px;
        font-weight: 500;
      }
      .donation-result-card p b {
        color: #222;
        font-weight: 700;
      }
      .donation-error-card {
        background: #fff0f0;
        border-radius: 18px;
        box-shadow: 0 2px 12px rgba(255,0,0,0.07);
        max-width: 420px;
        margin: 0 auto 32px auto;
        padding: 24px 28px 18px 28px;
        color: #a32020;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 10px;
        font-size: 1.08rem;
      }
      @media (max-width: 600px) {
        .donation-search-card, .donation-result-card, .donation-error-card {
          max-width: 98vw;
          padding: 18px 6vw 14px 6vw;
        }
      }
    </style>
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <div class="user-topbar">
      <div class="brand">AidFund<span class="plus">+</span></div>
      <nav>
        <a href="index.html"><i data-lucide="home"></i>Home</a>
        <a href="donationHistory.html" class="active"><i data-lucide="book-open"></i>History</a>
        <a href="causePage.jsp"><i data-lucide="heart"></i>Causes</a>
        <a href="admin-login.html" class="admin-login-btn"><i data-lucide="user-shield"></i>Login as Admin</a>
      </nav>
    </div>
    <script>
      lucide.createIcons();
    </script>
    <div class="main-content-user">

    <!-- bradcam_area_start  -->
    <div class="bradcam_area breadcam_bg overlay2 d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text text-center">
                        <h3 style="letter-spacing: 0.18em; font-size:2.2rem; font-weight:800; color:#fff; text-shadow:0 2px 12px rgba(0,0,0,0.13);">DONATION HISTORY</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- bradcam_area_end  -->

    <div class="donation-search-card">
      <form action="searchDonation" method="post" style="width:100%;">
        <label for="refId"><i data-lucide="search"></i> Enter Reference ID:</label>
        <div class="donation-search-input-group">
          <input type="text" name="refId" id="refId" required placeholder="e.g. 123456" />
          <button type="submit"><i data-lucide="search"></i> Search</button>
        </div>
      </form>
    </div>

<!-- Display Result (if any) -->
<c:if test="${not empty donation}">
  <div class="donation-result-card">
    <i class="fa fa-check-circle result-icon"></i>
    <p><b>Name:</b> ${donation.donor.dname}</p>
    <p><b>Email:</b> ${donation.donor.demail}</p>
    <p><b>Phone:</b> ${donation.donor.dphone}</p>
    <p><b>Amount:</b> RM ${donation.amount}</p>
    <p><b>Date:</b> ${donation.donationDate}</p>
    <p><b>Reference ID:</b> ${donation.donationID}</p>
  </div>
</c:if>

<c:if test="${not empty error}">
    <div class="donation-error-card">
      <i class="fa fa-exclamation-triangle"></i> ${error}
    </div>
</c:if>
    
    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
   <!-- <script>
        $('.datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-calendar"></span>'
            }
        });

        $('.timepicker').timepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-clock-o"></span>'
            }
        });
    $(document).ready(function() {
    $('.js-example-basic-multiple').select2();
});
  
    </script> -->
</body>
</html>