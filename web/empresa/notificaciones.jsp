<%@page import="com.modelos.Aplicaciones"%>
<%@page import="java.util.ArrayList"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null || !(session.getAttribute("TIPO") == "EMPRESA")) {
        System.out.println("Inicie session");
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }

    ArrayList<Aplicaciones> aplicaciones = (ArrayList<Aplicaciones>) session.getAttribute("APLICACIONES");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Notificaciones</title>
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/sidebar.css" />
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../WEB-INF/sidebar.jsp" %> 
            <div id="content">
                <%@include file="../WEB-INF/nav.jsp" %> 
                <div class="container-fluid my-4">
                    <div>
                        <h1 class="text-center fs-3">Información de Postulantes</h1>
                    </div>
                    <div class="row">
                        <%
                            for (Aplicaciones a : aplicaciones) {
                        %>
                        <div class="col-sm-4 col-md-4">
                            <div class="card shadow">
                                <div class="card-header bg-transparent">
                                    <center><h3><%= a.getOferta().getTitulo()%></h3></center>
                                </div>
                                <div class="card-body">
                                    <p><strong>Cargo:</strong> <%= a.getOferta().getCargo()%></p>
                                    <p><strong>Nombres:</strong> <%= a.getPostulante().getNombres()%></p>
                                    <p><strong>Apellidos:</strong> <%= a.getPostulante().getApellidos()%></p>
                                    <p><strong>Telefono:</strong> <%= a.getPostulante().getTelefono()%></p>
                                    <p><strong>Email:</strong> <%= a.getPostulante().getCorreo()%></p>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="/SISTEMA1/estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
    </body>
</html>
