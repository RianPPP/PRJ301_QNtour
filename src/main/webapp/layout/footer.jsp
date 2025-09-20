<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- FOOTER -->
<style>
    .footer {
        background-color: #242424;
        color: #fff;
        padding: 40px 0;
    }

    .footer .container {
        display: flex;
        justify-content: space-between;
    }

    .footer-left, .footer-right {
        width: 45%;
    }

    .footer-left h4, .footer-right h4 {
        font-size: 1.5rem;
        margin-bottom: 15px;
        color: #fff;
    }

    .footer-left ul {
        list-style-type: none;
        padding: 0;
    }

    .footer-left ul li {
        margin-bottom: 10px;
    }

    .footer-left ul li a {
        color: #aaa;
        text-decoration: none;
        transition: color 0.3s;
    }

    .footer-left ul li a:hover {
        color: #fff;
    }

    .footer-contact p {
        margin-bottom: 10px;
    }

    .footer-contact a {
        color: #fff;
        text-decoration: none;
    }

    .footer-contact a:hover {
        text-decoration: underline;
    }

    .footer-social {
        margin-top: 15px;
    }

    .footer-social a {
        margin-right: 15px;
        color: #fff;
        font-size: 20px;
    }

    .footer-social a:hover {
        color: #ddd;
    }

    .footer-bottom {
        text-align: center;
        padding: 20px 0;
        border-top: 1px solid #444;
        background-color: #1b1b1b;
        margin-top: 20px;
    }

    .footer-bottom p {
        margin: 0;
        color: #bbb;
    }
</style>

<footer class="footer">
    <div class="container">
        <div class="footer-left">
            <h4>Useful Links</h4>
            <ul>
                <li><a href="Home">Home</a></li>
                <li><a href="ProductList">Product</a></li>
                <li><a href="Blog">Blog</a></li>
            </ul>
        </div>
        <div class="footer-right">
            <h4>Contact Us</h4>
            <div class="footer-contact">
                <p><strong>Address:</strong> Dai hoc FPT Quy Nhon</p>
                <p><strong>Phone:</strong> <a href="tel:+84 0356645624">(+84) 035 664 5624</a></p>
                <p><strong>Email:</strong> <a href="mailto:InfinityShop@gmail.com">InfinityShop@gmail.com</a></p>
                <div class="footer-social">
                    <a href="https://www.google.com/" title="Google Plus"><i class="fa fa-google-plus"></i></a>
                    <a href="https://www.facebook.com/daihocfptquynhon" title="Facebook"><i class="fa fa-facebook"></i></a>
                    <a href="https://www.youtube.com/@FPTUniversityChanel" title="YouTube"><i class="fa fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>Copyright © 2024. Designed by Group 4</p>
    </div>
</footer>
