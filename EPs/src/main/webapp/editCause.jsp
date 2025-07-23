<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Cause</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@700&display=swap" rel="stylesheet">
    <style>
        body {
            background: #f6f8fb;
            font-family: 'Fredoka', Arial, sans-serif;
        }
        .edit-form-container {
            max-width: 600px;
            margin: 60px auto;
            background: #fff;
            padding: 36px;
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(108, 99, 255, 0.13);
            border: 1.5px solid #ecebfc;
        }
        .edit-form-container h2 {
            font-weight: 700;
            font-size: 2rem;
            color: #6C63FF;
            text-align: center;
            margin-bottom: 20px;
        }
        .edit-form-container label {
            font-weight: 600;
            margin-top: 12px;
        }
        .form-control, .form-control-file, select {
            border-radius: 8px;
            padding: 8px;
        }
        .thumbnail-preview {
            margin-top: 10px;
            max-width: 100%;
            border-radius: 8px;
        }
        .btn-primary {
            background-color: #6C63FF;
            border: none;
            font-weight: bold;
            border-radius: 10px;
            padding: 12px 0;
            font-size: 1.1rem;
            margin-top: 20px;
        }
        .btn-secondary {
            background-color: #ccc;
            border: none;
            font-weight: bold;
            border-radius: 10px;
            padding: 12px 0;
            font-size: 1.1rem;
            margin-top: 12px;
        }
    </style>
</head>
<body>

<div class="edit-form-container">
    <h2>Edit Cause</h2>
    <form action="UpdateCauseController" method="post" enctype="multipart/form-data">
        <input type="hidden" name="causeId" value="${cause.causeId}" />
        <input type="hidden" name="userId" value="${cause.userId}" />

        <div class="form-group">
            <label>Campaign Name</label>
            <input type="text" name="title" class="form-control" required value="${cause.title}">
        </div>

        <div class="form-group">
            <label>Headline</label>
            <input type="text" name="headline" class="form-control" required value="${cause.headline}">
        </div>

        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" required style="min-height: 80px;">${cause.description}</textarea>
        </div>

        <div class="form-group">
            <label>Current Thumbnail</label><br>
            <img src="${cause.thumbnail}" alt="Thumbnail" class="thumbnail-preview">
        </div>

        <div class="form-group">
            <label>Change Thumbnail (optional)</label>
            <input type="file" name="thumbnail" accept="image/*" class="form-control-file">
        </div>

        <div class="form-group">
            <label>Target Amount (RM)</label>
            <input type="number" name="targetAmount" class="form-control" required value="${cause.targetAmount}">
        </div>

        <div class="form-group">
            <label>Start Date</label>
            <input type="date" name="startDate" class="form-control" required value="${cause.startDate}">
        </div>

        <div class="form-group">
            <label>End Date</label>
            <input type="date" name="endDate" class="form-control" required value="${cause.endDate}">
        </div>

        <div class="form-group">
            <label>Status</label>
            <select name="status" class="form-control">
                <option value="Active" ${cause.status == 'Active' ? 'selected' : ''}>Active</option>
                <option value="Inactive" ${cause.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Update Cause</button>
        <a href="dashboard" class="btn btn-secondary btn-block">Cancel</a>
    </form>
</div>

</body>
</html>
