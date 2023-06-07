<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
        <title>Manager Question</title>
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
            table.table td:last-child {
                opacity: 0.9;
                font-size: 15px;
                margin: 0px 5px;
            }
        </style>

    </head>
    <body>   
        <div class="main-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">

                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-4 p-0 flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Manage  Question</h2>
                                </div>
                                <div class="col-sm-4 p-0 flex justify-content-lg-start justify-content-center" >
                                    <form action="searchquestion" method="post">
                                         <input type="text" class="searchBox" name="search">
                                         <button type="submit"> Search
                                    </form>
                                </div>
                                <div class="col-sm-4 p-0 flex justify-content-lg-end justify-content-center">
                                    <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal">
                                        <i class="material-icons">&#xE147;</i>
                                        <span>Add New Question</span>
                                    </a>                                           
                                </div>
                            </div>
                        </div>

                        <table class="table" >
                            <thead>
                                <tr>
                                    <td>ID</td>
                                    <td>Detail</td>
                                    <td>Answer A</td>
                                    <td>Answer B</td>
                                    <td>Answer C</td>
                                    <td>Answer D</td>
                                    <td>True Answer</td>       
                                    <td>Action</td>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${listq}" var = "i">
                                    <tr>                                           
                                        <td>${i.id}</td>
                                        <td>${i.detail}</td>
                                        <td>${i.answerA}</td>
                                        <td>${i.answerB}</td>
                                        <td>${i.answerC}</td>
                                        <td>${i.answerD}</td>
                                        <td>${i.trueAnswer}</td>                                       
                                        <td>
                                            <a href="uploadquestion?qid=${i.id}"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                            <a href="deletequestion?qid=${i.id}" ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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
                                         <a href="pagingquestion?index=${i}"class="page-link">${i}</a>
                                     </li>                                
                                    
                                </ul>
                            </c:forEach>
                            
                        </div>
                    </div>
                </div>


                <!----add-modal start--------->
                <div class="modal fade" tabindex="-1" id="addEmployeeModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <form action="addquestion" method="POST">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Add Question</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Detail</label>
                                        <input type="text" class="form-control" name ="detail" >
                                    </div>
                                    <div class="form-group">
                                        <label>Answer A</label>
                                        <input type="text" class="form-control" name ="answerA" >
                                    </div>
                                    <div class="form-group">
                                        <label>Answer B</label>
                                        <input type="text" class="form-control" name ="answerB" >
                                    </div>
                                    <div class="form-group">
                                        <label>Answer C</label>
                                        <input type="text" class="form-control" name ="answerC">
                                    </div>
                                    <div class="form-group">
                                        <label>Answer D</label>
                                        <input type="text" class="form-control" name ="answerD">
                                    </div>
                                    <div class="form-group">
                                        <label>True Answer</label>
                                        <input type="text" class="form-control" name ="trueAnswer">
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


