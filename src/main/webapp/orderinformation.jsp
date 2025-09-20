<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>My Order</title>
            <link rel="stylesheet" href="./css/main.css">
            <link rel="stylesheet" href="./css/font-awesome.min.css">
            <link rel="stylesheet" href="./css/bootstrap.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
                    background-color: #f9f9f9;
                    /* Màu nền của sidebar */
                    border-radius: 5px;
                    padding: 15px;
                    margin-bottom: 20px;
                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                }

                .side-item h5 {
                    font-size: 18px;
                    color: #333;
                    /* Màu tiêu đề */
                    margin-bottom: 15px;
                    border-bottom: 2px solid #007bff;
                    /* Đường viền dưới cùng */
                    padding-bottom: 10px;
                }

                /* Category & Brand List (Matching Styles) */
                .list-group,
                .cat-list {
                    padding: 0;
                    margin: 0;
                    list-style: none;
                }

                .list-group-item,
                .cat-list-item {
                    padding: 10px 15px;
                    margin-bottom: 5px;
                    background-color: #fff;
                    /* Màu nền cho danh sách */
                    border: 1px solid #ddd;
                    border-radius: 5px;
                    transition: background-color 0.3s ease;
                }

                /* Links Styling (Consistent across both sections) */
                .list-group-item a,
                .cat-list-item a {
                    text-decoration: none;
                    font-size: 14px;
                    color: #000;
                    /* Màu chữ đen */
                    display: block;
                    padding: 5px 0;
                    transition: background-color 0.3s ease;
                }

                .list-group-item a:hover,
                .cat-list-item a:hover {
                    background-color: #f0f0f0;
                    /* Màu nền khi hover */
                }

                /* Active/Selected State */
                .list-group-item a.fw-bold,
                .cat-list-item a.fw-bold {
                    font-weight: bold;
                    background-color: #007bff;
                    /* Màu nền cho danh mục đang chọn */
                    color: #fff;
                    /* Màu chữ trắng cho danh mục đang chọn */
                    border-radius: 5px;
                }

                .list-group-item a.fw-bold:hover,
                .cat-list-item a.fw-bold:hover {
                    background-color: #0056b3;
                    /* Màu nền khi hover cho danh mục đang chọn */
                }

                /* Collapsible Subcategories */
                .collapse {
                    padding-left: 20px;
                    margin-top: 10px;
                    transition: all 0.3s ease;
                }

                .collapse a {
                    font-size: 13px;
                    color: #000;
                    /* Màu chữ đen cho danh mục phụ */
                    text-decoration: none;
                    padding: 5px 0;
                    display: block;
                }

                .collapse a:hover {
                    color: #007bff;
                    /* Màu chữ khi hover cho danh mục phụ */
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
                    color: #333;
                    /* Màu chữ cho tiêu đề sản phẩm */
                }

                .latest-product-price {
                    font-size: 14px;
                    color: #888;
                    /* Màu chữ cho giá sản phẩm */
                }

                .latest-product-price del {
                    color: #bbb;
                    /* Màu chữ cho giá cũ */
                }

                /* Product Buttons */
                .btn-list .product-btn {
                    display: inline-block;
                    padding: 8px 15px;
                    color: white;
                    background-color: #242424;
                    /* Màu nền nút */
                    border-radius: 5px;
                    text-decoration: none;
                    margin-right: 5px;
                }

                .btn-list .product-btn:hover {
                    background-color: #007bff;
                    /* Màu nền khi hover cho nút */
                }

                /* Pagination Styling */
                .pagination-arena {
                    margin-top: 20px;
                    text-align: center;
                }

                .pagination .page-link {
                    color: #007bff;
                    /* Màu chữ cho liên kết phân trang */
                    border-radius: 50%;
                    padding: 10px;
                }

                .pagination .page-link:hover {
                    background-color: #007bff;
                    /* Màu nền khi hover cho phân trang */
                    color: white;
                    /* Màu chữ trắng khi hover */
                }

                /* Responsive Styles */
                @media screen and (max-width: 768px) {
                    .side-item {
                        margin-bottom: 15px;
                    }

                    .list-group-item,
                    .cat-list-item {
                        padding: 8px 10px;
                    }

                    .collapse a {
                        padding: 5px 0;
                    }

                    .latest-product-item {
                        flex-direction: column;
                        /* Chuyển thành cột trên màn hình nhỏ */
                    }

                    .latest-product-item img {
                        width: 100%;
                        /* Hình ảnh chiếm 100% chiều rộng */
                        margin-bottom: 10px;
                    }
                }
            </style>

        </head>

        <body>
            <jsp:include page="./layout/header.jsp" />
            <c:if test="${param['index']==null }">
                <c:set var="index" scope="page" value="1" />
            </c:if>
            <c:if test="${param['index']!=null}">
                <c:set var="index" scope="page" value="${param['index']}" />
            </c:if>
            <section class="section-product-detail">
                <div class="container">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="./Home">Home </a></li>
                            <li class="breadcrumb-item"><a href="./MyOrder">My Order</a></li>
                            <li class="breadcrumb-item active">Order Information</li>
                        </ol>
                    </nav>
                    <div class="main-section-content">
                        <div class="sider">
                            <div class="search">
                                <div class="side-item">
                                    <h5>Category</h5>
                                    <ul class="cat-list">
                                        <c:forEach var="cate" items="${cate}">
                                            <li class="cat-list-item "><a href="#sublist${cate.getSetting_id()}"
                                                    data-bs-toggle="collapse"
                                                    class="${cate.getSetting_id()==param['categoryId']?"
                                                    fw-bold":""}">${cate.getValue()}</a>
                                                <div class="collapse" id="sublist${cate.getSetting_id()}">
                                                    <div class="card card-body " style="border: none;">
                                                        <c:forEach var="brand" items="${brand}">
                                                            <a href="./ProductList?brandId=${brand.getSetting_id()}&categoryId=${cate.getSetting_id()}&orderby=&index=1&search=${param['search']}"
                                                                class="${brand.getSetting_id()==param['brandId']&&cate.getSetting_id()==param['categoryId']?"
                                                                fw-bold":""} sub-cate-item">- ${brand.getValue()}</a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="latest-product">
                                    <h5>Latest Product</h5>
                                    <c:forEach var="pro" items="${latesproduct}">
                                        <div class="latest-product-item">
                                            <a href="./ProductDetail?pid=${pro.getId()}" title="product thumbnail"
                                                style="width: 45%;"><img src="${pro.getImg()}" alt="" width="100%"></a>
                                            <div class="latest-product-info">
                                                <h4 class="latest-product-title"><a
                                                        href="./ProductDetail?pid=${pro.getId()}"
                                                        class="product-name">${pro.getTitle()}</a></h4>
                                                <div class="latest-product-price">
                                                    <p><span class="price-amount"><span>$</span>${pro.getSalePrice()}
                                                        </span></p>
                                                    <del><span
                                                            class="price-amount"><span>$</span>${pro.getPrice()}</span></del>
                                                </div>
                                                <div class="btn-list">
                                                    <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn">
                                                        Show</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="orderdetails-content">
                            <div class="id-status-order">
                                <span class="id-order">Order ID: ${order.order_id} &nbsp;&nbsp;|</span>
                                <span class="status-order">Status order: ${order.setting.value}</span>
                            </div>
                            <c:forEach items="${orderdetails}" var="o">
                                <div class="products-container">
                                    <div class="left-container">
                                        <div class="img-container">
                                            <img onclick="window.location = 'ProductDetail?pid=${o.product_id}'"
                                                class="product-img" src="${o.image}" alt="">
                                        </div>
                                        <div class="product-content">
                                            <div onclick="window.location = 'ProductDetail?pid=${o.product_id}'"
                                                class="name-product">${o.title}</div>
                                            <div class="quantity-product">x${o.quantity}</div>
                                        </div>
                                    </div>
                                    <div class="right-container">
                                        <div class="product-price">
                                            <span class="price">${o.price}$</span>
                                            <span class="sale-price">${o.sale_price}$</span>
                                        </div>
                                        <c:if test="${order.setting.value=='Received'}">
                                            <div class="feedback-item">
                                                <button class="btn-feedback"
                                                    onclick="window.location = './SendFeedback?pid=${o.product_id}'">Feedback</button>
                                            </div>
                                        </c:if>
                                    </div>

                                </div>

                            </c:forEach>
                            <div class="hr"></div>
                            <div class="info-container">
                                <div class="order-info">
                                    <div class="deliadd">Delivery address</div>
                                    <div class="fullname">Fullname: ${order.fullname}</div>
                                    <div class="address-order">
                                        ${order.phone}<br>${order.address}
                                    </div>
                                </div>
                                <div class="div-right">

                                    <c:if test="${canCancel!=null}">
                                        <button data-toggle="modal" data-target="#exampleModal"
                                            style="margin-bottom: 25px; background-color:peru"
                                            class="btn-feedback">Cancel Order</button>
                                    </c:if>
                                    <div class="total-prices">Total Price:&nbsp;&nbsp;&nbsp; <span
                                            class="bottoms">${order.total}$</span></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Confirm Cancel Order</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div style="text-align: center">Do you want cancel your order?</div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button onclick="window.location = 'cancelorder?oid=${order.order_id}'" type="button"
                                    class="btn btn-primary">Cancel Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="./layout/footer.jsp" />
            <script src="./js/bootstrap.js"></script>
            <script src="./js/main.js"></script>

        </body>

        </html>