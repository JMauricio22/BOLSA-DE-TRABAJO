<%@page import="java.util.ArrayList"%>
<%@page import="com.modelos.Oferta"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null || !(session.getAttribute("TIPO") == "POSTULANTE")) {
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }

    ArrayList<Oferta> lista = (ArrayList<Oferta>) session.getAttribute("APLICACIONES");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Aplicaciones</title>
        <link rel="stylesheet" href="../estilo/assets/css/header.css" />
        <link rel="stylesheet" href="../estilo/assets/css/footer.css" />
        <link rel="stylesheet" href="../estilo/assets/css/botones.css" />
        
    </head>
    <body>
        <header>
            <%@include file="../WEB-INF/headerPOST.jsp" %> <br>
        </header>
        <div class="container">
            <div class="row">
                <div class="alert alert-info" role="alert">
                    <h1>Mis aplicaciones</h1>
                </div>
                
                <div class="col-12">
                    <%
                        if (lista.isEmpty()) {
                    %>
                    <div class="alert alert-danger" role="alert">
                       <h3>No hay Aplicaciones.</h3>
                    </div>
                    <%
                    } else {
                    %>
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">Titulo</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Tipo de Contrato</th>
                                <th scope="col">Salario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Oferta o : lista) {
                            %>
                            <tr >
                                <th scope="row"><%= o.getTitulo()%></th>
                                <td><%= o.getCargo()%></td>
                                <td><%= o.getTipoContrato()%></td>
                                <td><%= o.getSalario()%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>
        <%@include file="../WEB-INF/footer.jsp" %>
    </body>
</html>
<!--Bundle-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>