<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="dao.CauseDAO" %>
<%@ page import="java.util.List" %>
<%
List<model.Cause> causes = dao.CauseDAO.getActiveCausesDonor();
    request.setAttribute("causes", causes);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>AidFund+</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@700&display=swap" rel="stylesheet">
    <script src="https://unpkg.com/lucide@latest"></script>
    <style>
      body { background: #f6f8fb; font-family: 'Fredoka', Arial, sans-serif; }
      .user-topbar { width: 100%; height: 64px; background: linear-gradient(90deg, #f8fafc 0%, #e9ecef 100%); box-shadow: 0 4px 24px rgba(108,99,255,0.08); display: flex; align-items: center; justify-content: space-between; padding: 0 32px; border-radius: 0 0 20px 20px; position: sticky; top: 0; z-index: 100; }
      .user-topbar .brand { font-size: 2rem; font-weight: 700; color: #222; letter-spacing: 1px; display: flex; align-items: center; }
      .user-topbar .brand .plus { color: #a51d23; }
      .user-topbar nav { display: flex; gap: 20px; align-items: center; }
      .user-topbar nav a { display: flex; align-items: center; gap: 8px; color: #555; text-decoration: none; font-size: 1.1rem; font-weight: 600; padding: 8px 18px; border-radius: 10px; transition: background 0.2s, color 0.2s, box-shadow 0.2s, transform 0.2s; }
      .user-topbar nav a.active, .user-topbar nav a:hover { background: #ecebfc; color: #6C63FF; box-shadow: 0 2px 8px rgba(108,99,255,0.08); }
      .user-topbar nav .admin-login-btn { margin-left: 24px; background: #6C63FF; color: #fff; font-weight: 700; border-radius: 10px; box-shadow: 0 2px 8px rgba(108,99,255,0.18); }
      .user-topbar nav .admin-login-btn:hover { background: #554ee2; color: #fff; transform: scale(1.05); }
      .main-content-user { padding-top: 0; padding-bottom: 32px; }
      .causes-section { padding: 40px 0; }
      .section-title { font-size: 2.2rem; font-weight: 700; color: #222; margin-bottom: 32px; }
      .causes-scroll-wrapper {
        position: relative;
        width: 100%;
      }
      .scroll-arrow {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        z-index: 10;
        background: #fff;
        border: none;
        box-shadow: 0 2px 8px rgba(108,99,255,0.12);
        border-radius: 50%;
        width: 44px;
        height: 44px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.8rem;
        color: #6C63FF;
        cursor: pointer;
        transition: background 0.18s, color 0.18s;
        opacity: 0.85;
      }
      .scroll-arrow:hover { background: #ecebfc; color: #554ee2; }
      .scroll-arrow.left { left: -22px; }
      .scroll-arrow.right { right: -22px; }
      .causes-scroll-row {
        display: flex;
        flex-direction: row;
        gap: 28px;
        overflow-x: auto;
        scroll-snap-type: x mandatory;
        padding-bottom: 24px;
        -webkit-overflow-scrolling: touch;
        align-items: stretch;
        width: 100%;
        margin: 0 auto;
      }
      .causes-scroll-row::-webkit-scrollbar {
        display: none;
      }
      .cause-card {
        background: #fff;
        border-radius: 18px;
        box-shadow: 0 4px 24px rgba(108,99,255,0.10);
        padding: 28px 20px 24px 20px;
        display: flex;
        flex-direction: column;
        align-items: stretch;
        min-width: 360px;
        max-width: 360px;
        height: 500px;
        transition: box-shadow 0.18s;
        position: relative;
        margin: 0;
        scroll-snap-align: center;
      }
      .cause-card.active-center {
        transform: scale(1.15);
        z-index: 10;
        box-shadow: 0 8px 32px rgba(108,99,255,0.18), 0 1.5px 8px rgba(108,99,255,0.10);
      }
      .cause-card:hover {
        transform: scale(1.07);
        z-index: 2;
        box-shadow: 0 8px 32px rgba(108,99,255,0.18), 0 1.5px 8px rgba(108,99,255,0.10);
      }
      .cause-card .card-body {
        flex: 1 1 auto;
        display: flex;
        flex-direction: column;
        padding: 0;
      }
      .cause-card .card-content {
        flex: 1 1 auto;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        overflow-y: auto;
        min-height: 0;
      }
      .cause-card .btn-primary {
        margin-top: auto;
        align-self: center;
        padding: 9px 22px;
        font-size: 1.05rem;
        border-radius: 6px;
        min-width: 140px;
        max-width: 180px;
        width: 100%;
        background: #6C63FF;
        border: none;
        font-weight: 700;
        transition: background 0.18s;
        box-shadow: 0 2px 8px rgba(108,99,255,0.10);
      }
      .cause-card .btn-primary:hover {
        background: #554ee2;
      }
      .cause-card .card-img-top, .cause-card .img-placeholder {
        width: 100%;
        height: 180px;
        object-fit: cover;
        border-radius: 12px;
        margin-bottom: 18px;
        background: #f3f3f3;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.1rem;
        color: #bbb;
        overflow: hidden;
      }.modal-backdrop.fade {
  opacity: 0;
  transition: opacity 0.3s ease-in-out;
  z-index: 1040;
}

.modal-backdrop.show {
  opacity: 0.5;
}

.modal {
  z-index: 1050;
}
      .cause-card .img-placeholder { font-weight: 600; letter-spacing: 1px; }
      .cause-card .card-title { font-size: 1.3rem; font-weight: 700; color: #222; margin-bottom: 8px; word-break: break-word; overflow-wrap: anywhere; }
      .cause-card .card-text { color: #444; font-size: 1.05rem; margin-bottom: 14px; min-height: 24px; overflow: hidden; text-overflow: ellipsis; max-height: 60px; }
      .cause-card .meta { font-size: 1rem; color: #666; margin-bottom: 6px; word-break: break-word; overflow-wrap: anywhere; }
      .cause-card .meta strong { color: #222; font-weight: 700; }
      .cause-progress-bar-bg { width: 100%; height: 16px; background: #ecebfc; border-radius: 8px; margin: 16px 0 12px 0; overflow: hidden; position: relative; }
      .cause-progress-bar { height: 100%; background: linear-gradient(90deg, #6C63FF 0%, #48c6ef 100%); border-radius: 8px; transition: width 0.6s cubic-bezier(.4,2,.6,1); display: flex; align-items: center; justify-content: flex-end; font-weight: 700; color: #fff; font-size: 0.98rem; padding-right: 10px; box-shadow: 0 2px 8px rgba(108,99,255,0.10); }
      .cause-progress-label { position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); font-size: 0.98rem; font-weight: 700; color: #4b49ac; z-index: 2; pointer-events: none; }
      @media (max-width: 900px) { #causesGrid { gap: 18px; } .cause-card { min-width: 90vw; max-width: 98vw; } }
      @media (max-width: 600px) { .cause-card { padding: 16px 8px 18px 8px; } .scroll-arrow { width: 36px; height: 36px; font-size: 1.3rem; } .scroll-arrow.left { left: -12px; } .scroll-arrow.right { right: -12px; } }
    </style>
</head>
<body>

<div class="user-topbar">
  <div class="brand">AidFund<span class="plus">+</span></div>
  <nav>
    <a href="index.html"><i data-lucide="home"></i>Home</a>
    <a href="donationHistory.jsp"><i data-lucide="book-open"></i>History</a>
    <a href="causePage.jsp" class="active"><i data-lucide="heart"></i>Causes</a>
    <a href="admin-login.html" class="admin-login-btn"><i data-lucide="user-shield"></i>Login as Admin</a>
  </nav>
</div>

<script>lucide.createIcons();</script>

<div class="main-content-user">
  <div class="bradcam_area breadcam_bg overlay2 d-flex align-items-center justify-content-center">
    <div class="container">
      <div class="row">
        <div class="col-xl-12">
          <div class="bradcam_text text-center">
            <h3 style="font-family:'Fredoka',Arial,sans-serif;letter-spacing:0.18em;font-size:2.2rem;font-weight:800;color:#fff;text-shadow:0 2px 12px rgba(0,0,0,0.13);">Causes</h3>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<section class="causes-section" style="padding: 40px 0;">
  <div class="container">
    <h3 class="section-title text-center" style="font-family:'Fredoka',Arial,sans-serif;letter-spacing:0.18em;font-size:2.2rem;font-weight:800;color:#222;margin-bottom:32px;">ACTIVE CAUSES</h3>

    <c:if test="${empty causes}">
      <p class="text-center text-danger">No active campaigns available at the moment.</p>
    </c:if>

    <div class="causes-scroll-wrapper" style="margin-bottom: 40px;">
      <button class="scroll-arrow left" id="scrollLeft" aria-label="Scroll left">&#60;</button>
      <button class="scroll-arrow right" id="scrollRight" aria-label="Scroll right">&#62;</button>
      <div class="causes-scroll-row" id="causesScrollRow">
        <c:forEach var="cause" items="${causes}">
          <c:set var="progressPercent" value="${cause.targetAmount > 0 ? (cause.totalCollected * 100.0 / cause.targetAmount) : 0}" />
          <c:set var="progressPercentInt" value="${fn:substringBefore(progressPercent, '.')}" />
          <div class="cause-card">
            <c:choose>
              <c:when test="${not empty cause.thumbnail}">
                <img src="${cause.thumbnail}" class="card-img-top" alt="Cause Image" />
              </c:when>
              <c:otherwise>
                <div class="img-placeholder">No Image</div>
              </c:otherwise>
            </c:choose>
            <div class="card-body" style="padding:0;">
              <div class="card-content">
                <h5 class="card-title">${cause.title}</h5>
                <p class="card-text">${cause.description}</p>
                <div class="meta"><strong>Target:</strong> RM ${cause.targetAmount}</div>
                <div class="meta"><strong>Start Date:</strong> ${cause.startDate}</div>
                <div class="meta"><strong>End Date:</strong> ${cause.endDate}</div>
                <div class="cause-progress-bar-bg">
                  <div class="cause-progress-bar" style="width: ${progressPercentInt}%"></div>
                  <span class="cause-progress-label">${progressPercentInt}%</span>
                </div>
                <!-- DEBUG: Show collected and target values
                <div style="color: #a51d23; font-size: 0.98rem; margin-bottom: 6px;">
                  Collected: ${cause.totalCollected} / Target: ${cause.targetAmount}
                </div>
              </div>-->
              <button type="button" class="btn btn-primary open-donation-modal"
                data-title="${cause.title}" data-cause-id="${cause.causeId}">
                Donate Now
              </button>
              <!-- 📎 Copy link icon -->
              <button type="button" class="btn btn-outline-secondary open-share-modal" 
                data-cause-id="${cause.causeId}"
                data-title="${cause.title}"
        		data-description="${cause.description}">
                <i class="fa fa-link"></i>
              </button>
              <!-- debug 
              <div>${cause.causeId}</div> -->
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</section>

<!-- Donation Modal -->
<div id="donorModal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.18); z-index:9999; align-items:center; justify-content:center;">
  <div style="background:#fff; border-radius:18px; max-width:400px; width:95%; padding:32px 24px; position:relative;">
    <button id="closeDonorModal" style="position:absolute; top:16px; right:16px; background:none; border:none; font-size:1.5em;">&times;</button>
    <h3 style="text-align:center;">Donor Details</h3>
    <form id="donorForm" action="addDonation" method="post">
      <div class="form-group mb-3">
        <label>Cause</label>
        <input type="text" class="form-control" id="modalCauseTitle" readonly>
      </div>
      <input type="hidden" name="causeId" id="modalCauseId">
      <div class="form-group mb-3">
        <label>Name</label>
        <input type="text" class="form-control" name="Dname" required>
      </div>
      <div class="form-group mb-3">
        <label>Email</label>
        <input type="email" class="form-control" name="Demail" required>
      </div>
      <div class="form-group mb-3">
        <label>Phone</label>
        <input type="tel" class="form-control" name="Dphone" required>
      </div>
      <div class="form-group mb-3">
        <label>Amount (RM)</label>
        <input type="number" class="form-control" name="amount" required min="10">
      </div>
      <div class="form-group mb-3">
        <label>Payment Method</label>
        <select class="form-select" name="paymentMethod" required>
          <option value="">Select a method</option>
          <option value="Credit Card">Credit Card</option>
          <option value="Online Banking">Online Banking</option>
          <option value="eWallet">eWallet</option>
          <option value="Bank Transfer">Bank Transfer</option>
        </select>
      </div>
      <div class="form-group text-center">
        <button type="submit" class="btn btn-success">Donate</button>
      </div>
    </form>
  </div>
</div>

<!-- Thank You Modal -->
<div class="modal fade" id="thankYouModal" tabindex="-1" aria-labelledby="thankYouModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content" style="border-radius: 16px;">
      <div class="modal-header">
        <h5 class="modal-title" id="thankYouModalLabel">🎉 Thank You for Your Donation!</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="background:none; border:none; font-size:1.5rem;">&times;</button>
      </div>
       <div class="modal-body">
        <p class="text-center">${success}</p>
        <div style="padding: 10px 20px;">
          <p><strong>Donor Name:</strong> ${donorName}</p>
          <p><strong>Email:</strong> ${donorEmail}</p>
          <p><strong>Campaign:</strong> ${causeTitle}</p>
          <p><strong>Amount Donated:</strong> RM ${amount}</p>
          <p><strong>Payment Method:</strong> ${paymentMethod}</p>
          <p><strong>Reference ID:</strong> <span style="color: #6C63FF; font-weight: bold;">${refId}</span></p>
        </div>
        <p class="text-center" style="font-size: 0.9rem; color: #777;">Please save your reference ID for tracking purposes.</p>
      </div>
       <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
    </div>
  </div>
</div>
</div>

<!-- Share Campaign Modal -->
<div id="shareModal" style="display:none; position:fixed; top:0; left:0; width:100vw; height:100vh; background:rgba(0,0,0,0.18); z-index:9999; align-items:center; justify-content:center;">
  <div style="background:#fff; border-radius:18px; max-width:300px; width:90%; padding:18px 12px; position:relative;">
    <button id="closeShareModal" style="position:absolute; top:12px; right:12px; background:none; border:none; font-size:1.3em;">&times;</button>
    <h4 style="text-align:center; margin-bottom: 12px;">Share Campaign</h4>
    <div class="mb-3">
      <label><strong>Title:</strong></label>
      <p id="shareCampaignTitle" class="text-primary fw-bold"></p>
    </div>
    <div class="mb-3">
      <label><strong>Description:</strong></label>
      <p id="shareCampaignDescription" style="font-size: 0.9rem; color: #555;"></p>
    </div>
    <div class="mb-3">
      <label for="shareLink">Link</label>
      <input type="text" class="form-control" id="shareLink" readonly>
    </div>
    <div class="text-center">
      <button type="button" class="btn btn-outline-primary" id="copyLinkBtn">Copy Link</button>
    </div>
  </div>
</div>

<footer class="footer">
  <!-- Footer content as before -->
</footer>

<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script>
  $(document).ready(function(){
    $('.causes_active').owlCarousel({
      loop: false,
      margin: 30,
      nav: true,
      dots: false,
      responsive: {
        0: { items: 1 },
        600: { items: 2 },
        992: { items: 3 }
      }
    });
  });
</script>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".open-donation-modal").forEach(btn => {
      btn.addEventListener("click", function () {
        document.getElementById("modalCauseTitle").value = this.dataset.title;
        document.getElementById("modalCauseId").value = this.dataset.causeId;
        document.getElementById("donorModal").style.display = "flex";
      });
    });
    document.getElementById("closeDonorModal").addEventListener("click", function () {
      document.getElementById("donorModal").style.display = "none";
    });
  });
</script>

<c:if test="${showThankYou}">
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      const thankYouModal = new bootstrap.Modal(document.getElementById('thankYouModal'));
      thankYouModal.show();
    });
  </script>
</c:if>

<script>
  document.getElementById('scrollLeft').onclick = function() {
    const row = document.getElementById('causesScrollRow');
    const card = row.querySelector('.cause-card');
    if (card) row.scrollBy({ left: -card.offsetWidth - 28, behavior: 'smooth' });
  };
  document.getElementById('scrollRight').onclick = function() {
    const row = document.getElementById('causesScrollRow');
    const card = row.querySelector('.cause-card');
    if (card) row.scrollBy({ left: card.offsetWidth + 28, behavior: 'smooth' });
  };
</script>

<script>
document.addEventListener("DOMContentLoaded", function () {
  // Open Share Modal
  document.querySelectorAll(".open-share-modal").forEach(btn => {
    btn.addEventListener("click", function () {
      const title = this.dataset.title;
      const desc = this.dataset.description;
      const id = this.dataset.causeId;
      const link = `http://localhost:8182/AidFund/causePage.jsp`;
      document.getElementById("shareCampaignTitle").textContent = title;
      document.getElementById("shareCampaignDescription").textContent = desc;
      document.getElementById("shareLink").value = link;
      document.getElementById("shareModal").style.display = "flex";
    });
  });
  // Close modal
  document.getElementById("closeShareModal").addEventListener("click", function () {
    document.getElementById("shareModal").style.display = "none";
  });
  // Copy link to clipboard
  document.getElementById("copyLinkBtn").addEventListener("click", function () {
    const input = document.getElementById("shareLink");
    input.select();
    input.setSelectionRange(0, 99999); // mobile
    navigator.clipboard.writeText(input.value).then(() => {
      this.textContent = "Copied!";
      setTimeout(() => this.textContent = "Copy Link", 2000);
    });
  });
});
</script>

</body>
</html>
