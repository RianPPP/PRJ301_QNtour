<%-- 
    Document   : cart
    Created on : Jun 8, 2022, 1:04:52 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart</title>
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
        
        
        </style>
        
        
        
    </head>

    <body>
        <jsp:include page="./layout/header.jsp"/>
        <section class="section-product-list">




            <div class="container col-md-12">
                <div class="row">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shopping Cart</a></li>
                        </ol>
                    </nav>
                    <div class="sider col-md-3">
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
                                            <div class="collapse" id="sublist${cate.getSetting_id()}">
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
                                                <a href="./ProductDetail?pid=${pro.getId()}" class="product-btn"> Show</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div id="cart-summary">
                                                    </div>
                        <div class="cart-content">
                            <div class="col-md-12">
                                <table>
                                    <thead>
                                        <tr>
                                            <td>Images</td>
                                            <td>Title</td>
                                            <td>Price</td>
                                            <td>Quantity</td>
                                            <td>Total</td>
                                            <td>Delete</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.cart}" var="c">
                                            <tr>
                                                <td class="cart-item-img">
                                                    <a href="./ProductDetail?pid=${c.value.product.getId()}" style="display:block"><img
                                                            src="${c.value.product.img}"
                                                            width="100px;" alt=""></a>
                                                </td>
                                                <td class="cart-pro-title">
                                                    <h4>${c.value.product.title}</h4>
                                                </td>
                                                <td class="cart-item-price">
                                                    <p>${c.value.product.salePrice}</p>

                                                </td>
                                                <td class="cart_quantity">
                                                    <div class="cart_quantity_button">
                                                        <form action="cart">
                                                            <input onchange="this.form.submit()" type="number" name="quantity" min="1" value="${c.value.quantity}"> 
                                                            <input type="hidden" name="pid" value="${c.value.product.id}"> 
                                                        </form>  
                                                    </div>
                                                </td>
                                                <td class="cart_total">
                                                    <p class="cart_total_price">${c.value.product.salePrice*c.value.quantity}</p>
                                                </td>
                                                <td class="cart_delete">
                                                    <a class="cart_quantity_delete" href="delCart?pid=${c.value.product.id}"><i class="fa fa-times"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-12">
                        <div id="cart-summary">
                            <table>
                                <tr>
                                    <td >Purchase amount</td>
                                    <td>${total}</td>
                                </tr>
                                <tr>
                                    <td >Number of products</td>
                                    <td>${count}</td>
                                </tr>	
                                <tr>
                                    <td >Shipping cod</td>
                                    <td>Free</td>
                                </tr>
                                <tr>
                                    <td ><a href="contact">Contact</a></td>
                                    <td><a href="ProductList">Buy more</a></td>
                                </tr>
                            </table>
                        </div>
                        </div>


                    </div>
                </div>

            </div>


        </section>
        <jsp:include page="./layout/footer.jsp"/>


        <script src="js/bootstrap.js"></script>
        <c:if test="${messageError != null}">
            <script>
                                                                alert("${messageError}")
            </script>
        </c:if>

    </body>

</html>
//cart.jsp