<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Manager Account</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!----css3---->
        <link rel="stylesheet" href="css/custom.css">

        <!--google fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">


        <!--google material icon-->
        <link href="https://fonts.googleapis.com/css2?family=Material+Icons"rel="stylesheet">

    </head>
    <body>   
        <div class="main-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">

                        <div class="table-title">                          
                            <div class="row">
                                <div class="col-sm-4 p-0 flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Manage  Accounts</h2>
                                </div>
                                <div class="col-sm-4 p-0 flex justify-content-lg-start justify-content-center" >
                                    <form action="searchaccount" method="post">
                                         <input type="text" class="searchBox" name="search">
                                         <button type="submit"> Search
                                    </form>
                                </div>
                                 
                                
                                <div class="col-sm-4 p-0 flex justify-content-lg-end justify-content-center">
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                        <i class="material-icons">&#xE147;</i>
                                        <span>Add New Employees</span>
                                    </a>                                           
                                </div>
                                
                                
                            </div>
                            
                        </div>
                        

                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>First Name</td>
                                    <td>Last Name</td>
                                    <td>UserName</td>
                                    <td>Password</td>
                                    <td>Phone</td>
                                    <td>Email</td>
                                    <td>DOB</td>
                                    <td>Role</td>
                                    <td>Action</td>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${lista}" var = "i">
                                    <tr>                                           
                                        <td>${i.id}</td>
                                        <td>${i.firstName}</td>
                                        <td>${i.lastName}</td>
                                        <td>${i.userName}</td>
                                        <td>${i.passWord}</td>
                                        <td>${i.phone}</td>
                                        <td>${i.email}</td>
                                        <td>${i.dob}</td>
                                        <td>${i.role}</td>
                                        <td>
                                            <a href="uploadaccount?uid=${i.id}"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="deleteaccount?aid=${i.id}" ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div class="clearfix">
                            <div class="hint-text">showing <b>5</b> out of <b>25</b></div>
                            <c:forEach begin = "1" end="${endPage}" var="i">
                                <ul class="pagination">                                        
                                     <li class="page-item ">
                                         <a href="pagingaccount?index=${i}"class="page-link">${i}</a>
                                     </li>                                
                                    
                                </ul>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>


                <!----add-modal start--------->
                <div class="modal fade" tabindex="-1" id="addEmployeeModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <form action="addaccount" method="POST">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add Employees</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input type="text" class="form-control" name ="firstName" >
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control" name ="lastName" >
                                    </div>
                                    <div class="form-group">
                                        <label>UserName</label>
                                        <input type="text" class="form-control" name ="userName" >
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="text" class="form-control" name ="password">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name ="phone">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input type="text" class="form-control" name ="email">
                                    </div>
                                    <div class="form-group">
                                        <label>DOB</label>
                                        <input type="text" class="form-control" name ="dob">
                                    </div>
                                    <div class="form-group">
                                        <label>Role</label>
                                        <input type="text" class="form-control" name ="role">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-success">Add</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>                    
            </div>
        </div>

  


    </div>

</div>



<!-------complete html----------->






<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $(".xp-menubar").on('click', function () {
            $("#sidebar").toggleClass('active');
            $("#content").toggleClass('active');
        });

        $('.xp-menubar,.body-overlay').on('click', function () {
            $("#sidebar,.body-overlay").toggleClass('show-nav');
        });

    });
</script>





</body>

</html>


