<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>${applicationScope.storeInstance.storeName} - Update Profile</title>
    <%@include file="includes/head.jsp" %>
</head>

<body>
<header>
    <%@include file="includes/header.jsp" %>
    <br>
</header>

<div class="container">
    <div class="row">
        <div class="col-md-8">

            <div class="card">
                <div class="card-header">
                    <h5 class="title">Profile Details</h5>
                </div>
                <div class="card-body">
                    <form action="/iti-store/update-profile" id="userForm" method="post" enctype="multipart/form-data">

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>First Name</label>
                                <input name="firstName" type="text" class="form-control" placeholder="First Name"
                                       value="${sessionScope.user.firstName}">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Last Name</label>
                                <input name="lastName" type="text" class="form-control" placeholder="Last Name"
                                       value="${sessionScope.user.lastName}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Phone Number</label>
                                <input name="phone" type="tel" class="form-control" placeholder="Phone Number"
                                       value="${sessionScope.user.phone}">
                            </div>

                            <div class="form-group col-md-6">
                                <label>Email address</label>
                                <input name="email" type="email" class="form-control" placeholder="Email Address"
                                       value="${sessionScope.user.email}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Password</label>
                                <input name="password" id="userpassword" type="password" class="form-control"
                                       placeholder="Password" value="">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Confirm Password</label>
                                <input name="confirmPassword" id="confirmPassword" type="password" class="form-control"
                                       placeholder="Confirm Password" value="" onblur="validatePassword()">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Country</label>
                                <input name="country" type="text" class="form-control" placeholder="Country"
                                       value="${sessionScope.user.address.country}">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Birth Date</label>
                                <input name="birthDate" type="date" class="form-control" placeholder="Birth Date"
                                       value="${sessionScope.user.birthDate}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>State</label>
                                <input name="state" type="text" class="form-control" placeholder="State"
                                       value="${sessionScope.user.address.state}">
                            </div>
                            <div class="form-group col-md-6">
                                <label>City</label>
                                <input name="city" type="text" class="form-control" placeholder="City"
                                       value="${sessionScope.user.address.city}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Street</label>
                                <input name="street" type="text" class="form-control" placeholder="Street"
                                       value="${sessionScope.user.address.street}">
                            </div>
                            <div class="form-group col-md-6">
                                <label>Postal Code</label>
                                <input name="zipCode" type="text" class="form-control" placeholder="ZIP Code"
                                       value="${sessionScope.user.address.zipCode}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <label>Profile Image</label>
                                <input name="image" type="file" class="form-control"
                                       placeholder="Choose a new profile image...">
                            </div>
                            <br>
                        </div>

                        <br>

                        <!-- How Could you do that !!! -->
                        <div class="d-flex justify-content-between">
                            <div>
                                <h6></h6>
                            </div>
                            <div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="${sessionScope.user.userId}">
                                        <input type="submit" class="btn btn-primary text-white"
                                               value="   Save Updates   ">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

            <br>

        </div>

        <div class="col-md-4">

            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between">
                        <div>
                            <h5 class="title">${sessionScope.user.firstName} ${sessionScope.user.lastName}</h5>
                        </div>
                        <div>
                            <p class="card-text"><small
                                    class="text-muted">${sessionScope.user.role.toString().replace("_ROLE",
                                    "")}</small></p>

                        </div>
                    </div>

                </div>

                <c:choose>
                    <c:when test="${sessionScope.user.userImage != null}">
                        <img src="${sessionScope.user.userImage}"
                             class="card-img-top img-fluid" alt="Profile Image">
                    </c:when>
                    <c:otherwise>
                        <img src="images/user/avatar.jpg" class="card-img-top img-fluid"
                             alt="Default Profile Image">
                    </c:otherwise>
                </c:choose>

                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <div class="d-flex justify-content-between">
                                <div>
                                    Orders
                                </div>
                                <div>
                                    ${sessionScope.user.orders.size()}
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="d-flex justify-content-between">
                                <div>
                                    Balance
                                </div>
                                <div>
                                    ${sessionScope.user.balance}
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <br>

            <div class="card">
                <div class="card-header">
                    <h5 class="title">Navigation</h5>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><a href="/iti-store/view-profile" class="card-link">View
                            Profile Details</a></li>
                        <li class="list-group-item"><a href="/iti-store/cart" class="card-link">View Current
                            Cart</a></li>
                        <li class="list-group-item" data-toggle="modal" data-target="#requestBalanceModel"><a
                                href="#" class="card-link">Add Balance</a></li>
                    </ul>
                </div>
            </div>

            <br>

        </div>
    </div>
</div>

<div class="modal fade" id="requestBalanceModel" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- modal header -->
            <div class="modal-header">
                <h5 class="modal-title text-capitalize">Request For Balance</h5>
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <!--end of  modal header -->
            <!-- modal body -->
            <div class="modal-body">
                <div class="row">
                    <label for="requestBalance" class="col control-label">Amount of Money</label>
                    <div class="col">
                        <input aria-invalid="amount" type="number" name="requestBalance" class="form-control"
                               min="1" id="requestBalance">
                    </div>

                </div>
            </div>
            <!-- end modal body -->
            <div class="modal-footer">
                <button class="btn btn-danger my-2 mx-2  addBalance" data-dismiss="modal">Request Balance</button>
                <%-- <button type="button" class="btn btn-danger " data-dismiss="modal">close modal</button>--%>
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>
</body>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script src="scripts/confirm-password.js"></script>
</html>