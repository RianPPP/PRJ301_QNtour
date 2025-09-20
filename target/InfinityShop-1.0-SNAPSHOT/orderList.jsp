<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order List</title>
</head>
<body>
    <h2>Order List</h2>

    <!-- Form tìm kiếm đơn hàng -->
    <form action="order" method="get">
        <label for="status">Status:</label>
        <input type="text" id="status" name="status" value="${status}"/>
        
        <label for="fromDate">From:</label>
        <input type="date" id="fromDate" name="from" value="${fromDate}"/>
        
        <label for="toDate">To:</label>
        <input type="date" id="toDate" name="to" value="${toDate}"/>
        
        <input type="hidden" name="userId" value="${param.userId}"/>
        
        <button type="submit">Search</button>
    </form>

    <!-- Bảng hiển thị danh sách đơn hàng -->
    <table border="1">
        <tr>
            <th>Order ID</th>
            <th>Fullname</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Order Date</th>
            <th>Total</th>
            <th>Status</th>
        </tr>
        <!-- Duyệt qua danh sách orders được truyền từ Servlet -->
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.order_id}</td>
                <td>${order.fullname}</td>
                <td>${order.address}</td>
                <td>${order.phone}</td>
                <td>${order.order_date}</td>
                <td>${order.total}</td>
                <td>${order.status}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- Phân trang -->
    <c:if test="${totalPages > 1}">
        <div>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <a href="order?page=${i}&status=${status}&from=${fromDate}&to=${toDate}&userId=${param.userId}">
                    Page ${i}
                </a>
            </c:forEach>
        </div>
    </c:if>
</body>
</html>