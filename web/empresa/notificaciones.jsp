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
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <title>Notificaciones</title>
    </head>
    <body>
        <h1>Notificaciones</h1>
        <div class="container my-5">
            <div class="row">
                <%
                    for (Aplicaciones a : aplicaciones) {
                %>
                <div class="col-sm-4 col-md-4">
                    <div class="card">
                        <div class="card-header">
                            <h3><%= a.getOferta().getTitulo()%></h3>
                        </div>
                        <div class="card-body">
                            <p>Cargo: <%= a.getOferta().getCargo()%></p>
                            <p>Nombres <%= a.getPostulante().getNombres()%></p>
                            <p>Apellidos: <%= a.getPostulante().getApellidos()%></p>
                            <p>Telefono: <%= a.getPostulante().getTelefono()%></p>
                            <p>Email: <%= a.getPostulante().getCorreo()%></p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
