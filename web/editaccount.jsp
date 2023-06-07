

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Edit Account</title>
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
        <style>
            form {
                width: 50%;
                margin-left: auto;
                margin-right: auto;
                height: 500px;
            }
        </style>

    </head>
    <body>
        <form action="updateaccount" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit ACcount</h5>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Id</label>
                        <input type="text" value ="${detail.id}" class="form-control" name ="id" readonly >
                    </div>
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" value ="${detail.firstName}" class="form-control" name ="firstName" >
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" value ="${detail.lastName}" class="form-control" name ="lastName" >
                    </div>
                    <div class="form-group">
                        <label>UserName</label>
                        <input type="text" value ="${detail.userName}" class="form-control" name ="userName" >
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="text" value ="${detail.passWord}" class="form-control" name ="password">
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" value ="${detail.phone}" class="form-control" name ="phone">
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" value ="${detail.email}" class="form-control" name ="email">
                    </div>
                    <div class="form-group">
                        <label>DOB</label>
                        <input type="text" value ="${detail.dob}" class="form-control" name ="dob">
                    </div>
                    <div class="form-group">
                        <label>Role</label>
                        <input type="text" value ="${detail.role}" class="form-control" name ="role">
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="gettallaccount" class="btn btn-secondary" data-dismiss="modal">Cancel</a>
                    <button type="submit" class="btn btn-success">Edit</button>
                </div>
            </div>

        </form>
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
