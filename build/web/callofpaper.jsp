
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Author Guidelines</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
            #top{
                font-size: 25px;
                color:red;
            }
            #co{
                font-size: 30px;
                text-align: center;
                
            }
            p{
                text-align: justify;
            }
             
        </style>
    </head>
    <body>
        <%@include file="conference_menu.jsp" %>
        <div class="container-fluid">
            <div class="col-md-6">
            <br><br>    
            <p id="co"><b>Content</b></p>
                <div id="bg">
                    <span id="top"><i>Abstract:</i></span>
                <p>The abstract should not exceed 150 words</p>
                </div>
            <br><br>   
                <div id="bg">
                    <span id="top"><i>Keywords:</i></span>
                <p>The keywords which describe the main issues discussed should be given in alphabetical order</p>
                </div>
            <br><br>    
                <div id="bg">
                    <span id="top"><i>Full-text paper:</i></span>
                <p>Not exceeding 2000 words</p>
                </div>
            </div>
            <div class="col-md-6">
                <br><br>    
            <p id="co"><b>Format for Full-text Paper</b></p>
                <div id="bg">
                    <span id="top"><i>A4 size, Margins: </i></span>
                <p>1" Top,1" Bottom, 1.25" Left, 1" Right</p>
                </div>
            <br><br>   
                <div id="bg">
                    <span id="top"><i>Font and font size:</i></span>
                <p>Times New Roman-12 point</p>
                </div>
            <br><br>    
                <div id="bg">
                    <span id="top"><i>Line Spacing</i></span>
                <p>1.5</p>
                </div>
            <br><br>    
                <div id="bg">
                    <span id="top"><i>Title of the paper</i></span>
                <p>12 Bold with center alignment followed by Author/s name and affiliated Institute with address</p>
                </div>
            <br><br>    
                <div id="bg">
                    <span id="top"><i>References</i></span>
                <p>APA style</p>
                </div>
            </div>
            
        </div>
    </body>
</html>
