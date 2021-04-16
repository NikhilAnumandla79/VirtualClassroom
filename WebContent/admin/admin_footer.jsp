<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
     <form>
 <input type="button" class="btn btn-dark" style="position:fixed;bottom:20px;left:400px" value="backward" onclick="history.back()">
</form>
<form>
 <input type="button" class="btn btn-dark" style="position:fixed;bottom:20px;right:200px" value="forward" onclick="history.forward()">
</form>
    </div>
    
    
    
   
        </div>





        <!-- jQuery CDN -->
         <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
         <!-- Bootstrap Js CDN -->
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

         <script type="text/javascript">
             $(document).ready(function () {
                 $('#sidebarCollapse').on('click', function () {
                     $('#sidebar').toggleClass('active');
                 });
             });
         </script>
    </body>
</html>
