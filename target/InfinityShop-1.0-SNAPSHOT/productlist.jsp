<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product List</title>
        <link rel="shortcut icon" type="image/x-icon" href="https://freevector-images.s3.amazonaws.com/uploads/vector/preview/36682/36682.png" />
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/bootstrap.css">
     
     <style>
     
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
            
            
 /* Sidebar General Styling */
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

/* Category & Brand List (Matching Styles) */
.list-group, .cat-list {
    padding: 0;
    margin: 0;
    list-style: none;
}

.list-group-item, .cat-list-item {
    padding: 10px 15px;
    margin-bottom: 5px;
    background-color: #fff; /* Màu nền cho danh sách */
    border: 1px solid #ddd;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

/* Links Styling (Consistent across both sections) */
.list-group-item a, .cat-list-item a {
    text-decoration: none;
    font-size: 14px;
    color: #000; /* Màu chữ đen */
    display: block;
    padding: 5px 0;
    transition: background-color 0.3s ease;
}

.list-group-item a:hover, .cat-list-item a:hover {
    background-color: #f0f0f0; /* Màu nền khi hover */
}

/* Active/Selected State */
.list-group-item a.fw-bold, .cat-list-item a.fw-bold {
    font-weight: bold;
    background-color: #007bff; /* Màu nền cho danh mục đang chọn */
    color: #fff; /* Màu chữ trắng cho danh mục đang chọn */
    border-radius: 5px;
}

.list-group-item a.fw-bold:hover, .cat-list-item a.fw-bold:hover {
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

/* Latest Products Section */
.latest-product-item {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
}

.latest-product-item img {
    width: 45%;
    border-radius: 5px;
    margin-right: 10px;
}

.latest-product-info {
    flex-grow: 1;
}

.latest-product-title {
    font-size: 16px;
    margin: 0 0 5px 0;
    color: #333; /* Màu chữ cho tiêu đề sản phẩm */
}

.latest-product-price {
    font-size: 14px;
    color: #888; /* Màu chữ cho giá sản phẩm */
}

.latest-product-price del {
    color: #bbb; /* Màu chữ cho giá cũ */
}

/* Product Buttons */
.btn-list .product-btn {
    display: inline-block;
    padding: 8px 15px;
    color: white;
    background-color: #242424; /* Màu nền nút */
    border-radius: 5px;
    text-decoration: none;
    margin-right: 5px;
}

.btn-list .product-btn:hover {
    background-color: #007bff; /* Màu nền khi hover cho nút */
}

/* Pagination Styling */
.pagination-arena {
    margin-top: 20px;
    text-align: center;
}

.pagination .page-link {
    color: #007bff; /* Màu chữ cho liên kết phân trang */
    border-radius: 50%;
    padding: 10px;
}

.pagination .page-link:hover {
    background-color: #007bff; /* Màu nền khi hover cho phân trang */
    color: white; /* Màu chữ trắng khi hover */
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
    .side-item {
        margin-bottom: 15px;
    }

    .list-group-item, .cat-list-item {
        padding: 8px 10px;
    }

    .collapse a {
        padding: 5px 0;
    }

    .latest-product-item {
        flex-direction: column; /* Chuyển thành cột trên màn hình nhỏ */
    }

    .latest-product-item img {
        width: 100%; /* Hình ảnh chiếm 100% chiều rộng */
        margin-bottom: 10px;
    }
}
/* Pagination Styling */
.pagination-arena {
    margin-top: 20px;
    text-align: center;
}

.pagination {
    padding: 0;
    list-style: none; /* Xóa dấu gạch đầu dòng */
}

.pagination .page-item {
    display: inline-block; /* Để các phần tử nằm trên cùng một hàng */
}

.pagination .page-link {
    color: #fff; /* Màu chữ trắng */
    background-color: #242424; /* Màu nền đen */
    border: 1px solid #ddd; /* Đường viền xung quanh */
    border-radius: 0; /* Để tạo hình vuông */
    padding: 10px 15px; /* Khoảng cách bên trong nút */
    text-decoration: none;
    transition: background-color 0.3s ease; /* Hiệu ứng chuyển màu nền */
    margin: 0; /* Không có khoảng cách giữa các nút */
}

/* Tùy chỉnh đường viền giữa các nút */
.pagination .page-item:not(:last-child) .page-link {
    border-right: none; /* Xóa đường viền bên phải của các nút không phải là nút cuối */
}

.pagination .page-link:hover {
    background-color: #007bff; /* Màu nền khi hover */
    color: white; /* Màu chữ khi hover */
}

/* Active Page Style */
.pagination .page-item.active .page-link {
    background-color: #007bff; /* Màu nền cho trang đang hoạt động */
    color: white; /* Màu chữ cho trang đang hoạt động */
    border: 1px solid #007bff; /* Đường viền cho trang đang hoạt động */
}

.pagination .page-link.d-none {
    display: none; /* Ẩn các nút không cần thiết */
}


      </style>
     
    </head>

    <body class="biolife-body">
        <c:if test="${param['index']==null }">   
            <c:set var = "index" scope = "page" value = "1"/>
        </c:if>
        <c:if test="${param['index']!=null}">
            <c:set var = "index" scope = "page" value = "${param['index']}"/>
        </c:if>
        <jsp:include page="./layout/header.jsp"/>
        <!--Navigation  section-->
        <section class="section-product-list">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="./Home">Home </a></li>
                        <li class="breadcrumb-item"><a href="./ProductList?index=1">Product List</a></li>
                    </ol>
                </nav>
                <div class="main-section-content">
                    <div class="sider">
                        <div class="search">
                            <form action="ProductList?index=1" class="form-search" method="get">
                                <input type="text" name="search" class="input-text" value="${param['search']}" placeholder="Search product here...">
                                <button type="submit" class="btn-submit"><i class="fa fa-search"></i></button>
                            </form>
                            <div class="side-item">
                                <h5>Category</h5>
                                <ul class="cat-list">
                                    <c:forEach var="cate" items="${cate}">
                                        <li class="cat-list-item "><a href="#sublist${cate.getSetting_id()}" data-bs-toggle="collapse" class="${cate.getSetting_id()==param['categoryId']?"fw-bold":""}">${cate.getValue()}</a>
                                            <div class="${cate.getSetting_id()==param['categoryId']?"":"collapse"}" id="sublist${cate.getSetting_id()}">
                                                <div class="card card-body " style="border: none;">
                                                    <c:forEach var="brand" items="${brand}">
                                                        <a href="./ProductList?brandId=${brand.getSetting_id()}&categoryId=${cate.getSetting_id()}&orderby=&index=1&search=${param['search']}" 
                                                           class="${brand.getSetting_id()==param['brandId']&&cate.getSetting_id()==param['categoryId']?"fw-bold":""} sub-cate-item" >- ${brand.getValue()}</a>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <div class="latest-product">
                                <h5>Latest  Product</h5>
                                <c:forEach var="pro" items="${prolist5}">
                                    <div class="latest-product-item">
                                        <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail" style="width: 45%;"><img src="${pro.getImg()}" alt="" width="100%"></a>
                                        <div class="latest-product-info">
                                            <h4 class="latest-product-title"><a href="./ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                            <div class="latest-product-price">
                                                <p><span class="price-amount"><span>$</span>${pro.getSalePrice()} </span></p>
                                                <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                            </div>
                                            <div class="btn-list">
                                                <a href="./ProductDetail?pid=${pro.getId()}" style="background-color: #747474;"class="product-btn"> Show</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="display-list">
                        <div class="filter">
                            <form action="ProductList" name="frm-refine" method="get">
                                <div class="left">
                                    <span class="filter-title">Refine </span>
                                    <select name="categoryId">
                                        <option value="">Category</option>
                                        <c:forEach var="cate" items="${cate}">
                                            <option value="${cate.getSetting_id()}" ${cate.getSetting_id()==param['categoryId']?"selected":""}>${cate.getValue()}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="brandId">
                                        <option value="">Brands</option>
                                        <c:forEach var="brand" items="${brand}">
                                            <option value="${brand.getSetting_id()}" ${brand.getSetting_id()==param['brandId']?"selected":""}>${brand.getValue()}</option>

                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="right" >
                                    <span class="filter-title">Sort </span>
                                    <select name="orderby">
                                        <option  ${param['orderby']==1?"selected":""} value="1" >Date</option>
                                        <option  ${param['orderby']==2?"selected":""} value="2">price: low to high</option>
                                        <option  ${param['orderby']==3?"selected":""} value="3">price: high to low</option>
                                    </select>
                                    <button type="submit" style="background-color: #242424" value="Go" id="submit_pfilter" >GO</button> 
                                </div>
                            </form>
                        </div>
                        <div class="product-list">
                            <c:forEach var="pro" items="${prolist}">
                                <div class="product-item">
                                    <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail" ><img src="${pro.getImg()}" alt="" width="100%"></a>
                                    <div class="product-info">
                                        <b class="categories">${pro.getBrand()} - ${pro.getCategory()}</b>
                                        <h4 class="product-title"><a href="./ProductDetail?pid=${pro.getId()}" class="product-name">${pro.getTitle()}</a></h4>
                                        <div class="price">
                                            <p><span class="price-amount"><span>$</span>${pro.getSalePrice()}</span></p>
                                            <del><span class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                        </div>
                                        <div class="product-description">
                                            <p>${pro.getDescription()}....</p>
                                        </div>
                                        <div class="btn-list">
                                            <a href="./cart?pid=${pro.getId()}&quantity=1" class="product-btn" style="background-color: #242424;"onclick="addCart()"><i class="fa fa-cart-arrow-down"></i> ADD TO CART</a>
<!--                                            <a href="./SendFeedback?pid=${pro.getId()}" id="sendfb" class="product-btn" ${sessionScope['account'] == null?"onclick='warmLogin(this)'":""}><i class="fa fa-commenting-o" ></i> FEED BACK</a>-->
                                            <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn" style="background-color: #242424;"><i class="fa fa-eye" ></i> Show more</a>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="pagination-arena">
                            <ul class="pagination">
                                <li class="page-item"><a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=1&search=${param['search']}" class="page-link"><i class="fa fa-angle-left" aria-hidden="true"></i></a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index-2}&search=${param['search']}" class="page-link ${index-2<1?"d-none":""}">${index-2}</a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index-1}&search=${param['search']}" class="page-link ${index-1<1?"d-none":""}">${index-1}</a></li>
                                <li class="page-item active">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index}&search=${param['search']}" class="page-link">${index}</a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index+1}&search=${param['search']}" class="page-link ${index+1>numberPage?"d-none":""}" >${index+1}</a></li>
                                <li class="page-item">
                                    <a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${index+2}&search=${param['search']}" class="page-link ${index+2>numberPage?"d-none":""}">${index+2}</a></li>
                                <li><a href="./ProductList?brandId=${param['brandId']}&categoryId=${param['categoryId']}&orderby=${param['orderby']}&index=${numberPage}&search=${param['search']}" class="page-link"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>          
                    </div>
                </div>
            </div>
                            
        </section>

        <jsp:include page="./layout/footer.jsp"/>
        <!-- Scroll Top Button -->
        <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

        <script src="./js/bootstrap.js"></script>
        <script src="./js/main.js"></script>
        
    </body>

</html>