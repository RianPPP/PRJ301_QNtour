<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.User" %>  <!-- Import your User model -->
<%@ page import="java.util.*" %>  <!-- Import additional required packages -->
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>${product.getTitle()}</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <!-- Custom CSS for enhanced design -->
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f8f9fa;
            }

            .breadcrumb {
                background-color: #e9ecef;
                border-radius: 0.5rem;
                padding: 10px 20px;
            }

            .breadcrumb-item a {
                color: #007bff;
            }

            .breadcrumb-item a:hover {
                color: #0056b3;
            }

            .product-img img, .feedback-item img, .carousel-item img {
                object-fit: cover;
                width: 100%;
                height: 300px;
                border-radius: 0.5rem;
            }

            .feedback-item img {
                height: 120px;
            }

            .product-item img {
                transition: transform .2s;
                border-radius: 0.5rem;
            }

            .product-item img:hover {
                transform: scale(1.1);
            }

            .product-details h1 {
                font-size: 2.5rem;
                color: #343a40;
            }

            .product-price {
                font-size: 1.5rem;
                color: #dc3545;
                margin-bottom: 20px;
            }

            .product-price del {
                font-size: 1rem;
                color: #6c757d;
            }

/* Category Sidebar */
.side-item {
    background-color: #f9f9f9; /* Màu nền của sidebar */
    border-radius: 5px;
    padding: 15px;
    margin-bottom: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.side-item h5 {
    font-size: 18px;
    color: #333; /* Màu tiêu đề */
    margin-bottom: 15px;
    border-bottom: 2px solid #007bff; /* Đường viền dưới cùng */
    padding-bottom: 10px;
}

/* Category List */
.list-group {
    padding: 0;
    margin: 0;
}

.list-group-item {
    padding: 10px 15px;
    margin-bottom: 5px;
    background-color: #fff; /* Màu nền cho danh sách */
    border: 1px solid #ddd;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.list-group-item a {
    text-decoration: none;
    font-size: 14px;
    color: #000; /* Màu chữ đen */
    display: block;
    padding: 5px 0;
    transition: background-color 0.3s ease;
}

.list-group-item a:hover {
    background-color: #f0f0f0; /* Màu nền khi hover */
}

/* Active/Selected Category */
.list-group-item a.fw-bold {
    font-weight: bold;
    background-color: #007bff; /* Màu nền cho danh mục đang chọn */
    color: #fff; /* Màu chữ trắng cho danh mục đang chọn */
    border-radius: 5px;
}

.list-group-item a.fw-bold:hover {
    background-color: #0056b3; /* Màu nền khi hover cho danh mục đang chọn */
}

/* Collapsible Subcategories */
.collapse {
    padding-left: 20px;
    margin-top: 10px;
    transition: all 0.3s ease;
}

.collapse a {
    font-size: 13px;
    color: #000; /* Màu chữ đen cho danh mục phụ */
    text-decoration: none;
    padding: 5px 0;
    display: block;
}

.collapse a:hover {
    color: #007bff; /* Màu chữ khi hover cho danh mục phụ */
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
    .side-item {
        margin-bottom: 15px;
    }

    .list-group-item {
        padding: 8px 10px;
    }

    .collapse a {
        padding: 5px 0;
    }
}

            

           .feedback-section {
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.feedback-section h2 {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #333;
}

.feedback-item {
    background-color: #fff;
    padding: 15px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

.feedback-item img.rounded-circle {
    width: 60px;
    height: 60px;
    object-fit: cover;
    border: 2px solid #ddd;
}

.feedback-item strong {
    font-size: 18px;
    color: #333;
}

.feedback-item p {
    font-size: 14px;
    color: #555;
    margin-bottom: 5px;
}

.feedback-item .fa-star {
    color: #f39c12; /* Màu vàng cho sao */
}

.feedback-item .img-fluid {
    max-width: 150px; /* Đặt kích thước cho ảnh đánh giá */
    max-height: 150px;
    object-fit: cover;
    border-radius: 8px;
}

.feedback-item .ms-auto {
    margin-left: auto;
}

.feedback-item .me-3 {
    margin-right: 15px;
}


            .recommend-items h2 {
                font-size: 2rem;
                color: #343a40;
                margin-top: 40px;
            }

            .btn-dark {
                background-color: #343a40;
                border-color: #343a40;
                padding: 10px 20px;
                font-size: 1rem;
            }

            .btn-dark:hover {
                background-color: #212529;
                border-color: #212529;
            }

            .carousel-control-prev-icon,
            .carousel-control-next-icon {
                background-color: #343a40;
                border-radius: 50%;
                padding: 15px;
            }

            /* Product list style */
            .latest-product-item {
                display: flex;
                align-items: center;
            }

            .latest-product-item img {
                width: 60px;
                height: 60px;
                object-fit: cover;
                margin-right: 10px;
                border-radius: 0.25rem;
            }

            .product-info h6 a {
                color: #343a40;
                text-decoration: none;
            }

            .product-info h6 a:hover {
                color: #007bff;
            }

            .price {
                font-size: 1rem;
                color: #dc3545;
            }

            .price del {
                font-size: 0.875rem;
                color: #6c757d;
            }

            /* Style the search bar */
            .form-search input {
                border-radius: 2rem;
                padding: 10px 20px;
                border: 1px solid #ced4da;
            }

            .form-search input:focus {
                border-color: #007bff;
                box-shadow: none;
            }
        </style>
    </head>

    <body>
        <jsp:include page="./layout/header.jsp"/>

        <!--Navigation section-->
        <section class="section-product-detail">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./Home">Home </a></li>
                        <li class="breadcrumb-item"><a href="./ProductList?index=1">Product List</a></li>
                        <li class="breadcrumb-item active">Product details</li>
                    </ol>   
                </nav> 
                <div class="row">
                    <div class="col-md-3">
                        <!-- Sidebar -->
                        <div class="search mb-4">
                            <form action="ProductList?index=1" class="form-search" method="get">
                                <input type="text" name="search" class="form-control" value="${param['search']}" placeholder="Search product...">
                            </form>
                        </div>

                        <!-- Categories and Brands -->
                        <div class="side-item">
                            <h5>Category</h5>
                            <ul class="list-group">
                                <c:forEach var="cate" items="${cate}">
                                    <li class="list-group-item">
                                        <a href="#sublist${cate.getSetting_id()}" data-bs-toggle="collapse" class="${cate.getSetting_id()==param['categoryId']?'fw-bold':''}">${cate.getValue()}</a>
                                        <div class="collapse" id="sublist${cate.getSetting_id()}">
                                            <c:forEach var="brand" items="${brand}">
                                                <a href="./ProductList?brandId=${brand.getSetting_id()}&categoryId=${cate.getSetting_id()}" class="d-block">${brand.getValue()}</a>
                                            </c:forEach>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <!-- Latest Products -->
                        <div class="latest-product mt-4">
                            <h5>Latest Products</h5>
                            <c:forEach var="pro" items="${prolist5}">
                                <div class="latest-product-item mb-3">
                                    <a href="./ProductDetail?pid=${pro.getId()}"><img src="${pro.getImg()}" alt="" class="img-thumbnail"></a>
                                    <div class="product-info mt-2">
                                        <h6><a href="./ProductDetail?pid=${pro.getId()}">${pro.getTitle()}</a></h6>
                                        <p class="price"><span>$</span>${pro.getSalePrice()} <del>$${pro.getPrice()}</del></p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Main product details -->
                    <div class="col-md-9">
                        <div class="product-details">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="product-img">
                                        <img src="${product.getImg()}" alt="${product.getTitle()}" class="img-fluid">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <h1>${product.getTitle()}</h1>
                                    <p class="product-price"><strong>$${product.getSalePrice()}</strong> <del>$${product.getPrice()}</del></p>
                                    <p><b>Category:</b> ${product.getCategory()}</p>
                                    <p><b>Brand:</b> ${product.getBrand()}</p>
                                    <p><b>Stock:</b> ${product.getStock()}</p>
                                    <p><b>Description:</b> ${product.getDescription()}</p>
                                    
                                    <!-- Add to Cart -->
                                    <form action="cart" class="mt-4">
                                        <input type="number" name="quantity" min="1" max="${product.getStock()-quantityincart}" value="1" class="form-control w-25 d-inline">
                                        <input type="hidden" name="pid" value="${product.id}">
                                        <button class="btn btn-dark mt-2" type="submit">Add To Cart</button>
                                    </form>
                                </div>
                            </div>
<!-- Feedback Form -->
<% User user = (User) session.getAttribute("account"); %>
<div class="feedback-section">
    <h3>Submit Your Feedback</h3>
    <% if (user == null) { %>
        <!-- If the user is not logged in, show a message -->
        <p>Please <a href="login.jsp">login</a> to submit your feedback.</p>
    <% } else { %>
        <!-- Feedback Form -->
        <form action="ProductDetail" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="pid" value="${pro.getId()}">

            <!-- Rating -->
            <div class="form-group">
                <label for="rate">Rate the Product:</label>
                <select name="rate" id="rate" class="form-control" required>
                    <option value="1">1 - Poor</option>
                    <option value="2">2 - Fair</option>
                    <option value="3">3 - Good</option>
                    <option value="4">4 - Very Good</option>
                    <option value="5">5 - Excellent</option>
                </select>
            </div>

            <!-- Feedback Content -->
            <div class="form-group">
                <label for="content">Your Feedback:</label>
                <textarea name="content" id="content" rows="4" class="form-control" placeholder="Write your feedback here..." required></textarea>
            </div>

            <!-- Image Upload -->
            <div class="form-group">
                <label for="img">Upload an Image (optional):</label>
                <input type="file" name="img" id="img" class="form-control" onchange="previewImage(event)">
            </div>

            <!-- Image Preview -->
            <div class="form-group">
                <label>Image Preview:</label>
                <img id="imagePreview" src="" alt="No image selected" style="max-width: 200px; display: none;" />
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Submit Feedback</button>
            </div>
        </form>
    <% } %>
</div>

<!-- JavaScript for AJAX Image Preview -->
<script>
    function previewImage(event) {
        var input = event.target;
        var reader = new FileReader();
        
        reader.onload = function() {
            var preview = document.getElementById('imagePreview');
            preview.src = reader.result;
            preview.style.display = 'block';  // Show the image preview
        };
        
        if (input.files && input.files[0]) {
            reader.readAsDataURL(input.files[0]);  // Read the file as a data URL
        } else {
            document.getElementById('imagePreview').style.display = 'none';  // Hide the preview if no file is selected
        }
    }
</script>

                            <!-- Feedback section -->
                            <div class="feedback-section mt-4">
                                <h2>Feedback list</h2>
                                <c:forEach var="fb" items="${fblist}">
                                    <div class="feedback-item d-flex align-items-center mb-3">
                                        <img src="${fb.getUser().getAvatar()}" alt="Avatar" class="rounded-circle me-3">
                                        <div>
                                            <strong>${fb.getUser().getFullname()}</strong> - ${fb.getRated()} <i class="fa fa-star" style="color: red;"></i>
                                            <p>${fb.getFeedback_date()}</p>
                                            <p>${fb.getFb_content()}</p>
                                        </div>
                                        <div class="ms-auto">
                                            <img src="${fb.getImage()}" alt="Feedback image" class="img-fluid">
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- Recommend items carousel -->
                            <div class="recommend-items mt-5">
                                <h2>Recommend items</h2>
                                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                    <div class="carousel-inner">
                                        <!-- First set of recommended items -->
                                        <div class="carousel-item active">
                                            <div class="row">
                                                <c:forEach items="${recommend1}" var="pro">
                                                    <div class="col-md-4">
                                                        <div class="product-item">
                                                            <img src="${pro.getImg()}" class="img-fluid" alt="${pro.getTitle()}">
                                                            <div class="product-info mt-2">
                                                                <h6>${pro.getTitle()}</h6>
                                                                <p class="price"><span>$</span>${pro.getSalePrice()} <del>$${pro.getPrice()}</del></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <!-- Second set of recommended items -->
                                        <div class="carousel-item">
                                            <div class="row">
                                                <c:forEach items="${recommend2}" var="pro">
                                                    <div class="col-md-4">
                                                        <div class="product-item">
                                                            <img src="${pro.getImg()}" class="img-fluid" alt="${pro.getTitle()}">
                                                            <div class="product-info mt-2">
                                                                <h6>${pro.getTitle()}</h6>
                                                                <p class="price"><span>$</span>${pro.getSalePrice()} <del>$${pro.getPrice()}</del></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Previous</span>
                                    </button>
                                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="visually-hidden">Next</span>
                                    </button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="./layout/footer.jsp"/>
        <script src="./js/main.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
