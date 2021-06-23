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
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <title>Notificaciones</title>
        <link rel="stylesheet" href="../estilo/assets/css/header.css" />
        <link rel="stylesheet" href="../estilo/assets/css/footer.css" />
        <link rel="stylesheet" href="../estilo/assets/css/botones.css" />
    </head>
    <body>
        <header>
            <%@include file="../WEB-INF/headerEMP.jsp" %> <br>
        </header>
        
        
        <div class="container my-5">
            <div class="alert alert-secondary" role="alert">
                <h1>Información de Postulantes</h1>
            </div>
            <div class="row">
                <%
                    for (Aplicaciones a : aplicaciones) {
                %>
                <div class="col-sm-4 col-md-4">
                    <div class="card border-primary">
                        <div class="card-header">
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
        <%@include file="../WEB-INF/footer.jsp" %>
    </body>
</html>
