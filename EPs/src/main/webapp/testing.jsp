<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>AidFund+</title>
    <meta name="description" content="">
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
        /* Copy-pasted style from your provided code */
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
        .main-content-user {
            margin-top: 32px;
            padding: 0 32px 32px;
        }
        .card-section {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
            padding: 32px;
        }
        .campaign-image img {
            max-width: 100%;
            height: auto;
            border-radius: 12px;
            margin-bottom: 24px;
        }
        .progress-bar {
            background: #ddd;
            border-radius: 10px;
            overflow: hidden;
            height: 20px;
            margin: 16px 0;
        }
        .progress-fill {
            background: #6C63FF;
            height: 100%;
        }
    </style>
</head>
<body>

<!-- Top Bar -->
<div class="user-topbar">
    <div class="brand">
        AidFund<span class="plus">+</span>
    </div>
</div>

<!-- Main Content -->
<div class="main-content-user">
    <div class="card-section">
        <c:if test="${not empty cause}">
            <div class="campaign-image">
                <c:choose>
                    <c:when test="${not empty cause.thumbnail}">
                        <img src="${cause.thumbnail}" alt="Campaign Image">
                    </c:when>
                    <c:otherwise>
                        <div style="color:#aaa;">No Image Available</div>
                    </c:otherwise>
                </c:choose>
            </div>

            <h2>${cause.title}</h2>
            <p><strong>Description:</strong> ${cause.description}</p>

            <p><strong>Goal:</strong> RM <fmt:formatNumber value="${cause.goalAmount}" type="currency" currencySymbol=""/></p>
            <p><strong>Collected:</strong> RM <fmt:formatNumber value="${cause.collectedAmount}" type="currency" currencySymbol=""/></p>

            <div class="progress-bar">
                <div class="progress-fill" style="width: 
                    <c:out value='${cause.collectedAmount / cause.goalAmount * 100}'/>%;"></div>
            </div>

            <p><strong>Duration:</strong>
                <fmt:formatDate value="${cause.startDate}" pattern="dd MMM yyyy"/> -
                <fmt:formatDate value="${cause.endDate}" pattern="dd MMM yyyy"/>
            </p>
        </c:if>

        <c:if test="${empty cause}">
            <p style="color: red;">Campaign not found or is inactive.</p>
        </c:if>
    </div>
</div>

</body>
</html>
