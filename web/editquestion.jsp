

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
        <form action="updatequestion" method="POST">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add Question</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Id</label>
                        <input type="text" value = "${detail.id}"class="form-control" name ="id" readonly >
                    </div>
                    <div class="form-group">
                        <label>Detail</label>
                        <input type="text" value = "${detail.detail}" class="form-control" name ="detail" >
                    </div>
                    <div class="form-group">
                        <label>Answer A</label>
                        <input type="text" value = "${detail.answerA}" class="form-control" name ="answerA" >
                    </div>
                    <div class="form-group">
                        <label>Answer B</label>
                        <input type="text" value = "${detail.answerB}" class="form-control" name ="answerB" >
                    </div>
                    <div class="form-group">
                        <label>Answer C</label>
                        <input type="text" value = "${detail.answerC}"  class="form-control" name ="answerC">
                    </div>
                    <div class="form-group">
                        <label>Answer D</label>
                        <input type="text" value = "${detail.answerD}" class="form-control" name ="answerD">
                    </div>
                    <div class="form-group">
                        <label>True Answer</label>
                        <input type="text" value = "${detail.trueAnswer}" class="form-control" name ="trueAnswer">
                    </div>

                </div>
                <div class="modal-footer">
                    <a href="getquestion" type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</a>
                    <button type="submit" class="btn btn-success">Add</button>
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
