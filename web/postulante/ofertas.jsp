<%@page import="java.util.ArrayList"%>
<%@page import="com.modelos.Oferta"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null || !(session.getAttribute("TIPO") == "POSTULANTE")) {
        System.out.println("Inicie session");
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Listado de Ofertas</title>
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/cv.css"/>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/header.css"/>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/footer.css" />
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/ofertas.css" />
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/botones.css" />
    </head>
    <body>
        <header>
            <%@include file="../WEB-INF/headerPOST.jsp" %>
        </header>
        <div id="content" class="container my-5">
            <div class="row">
                <%
                    ArrayList<Oferta> lista = (ArrayList<Oferta>) session.getAttribute("OFERTAS");
                    for (Oferta o : lista) {
                %>
                <div class="col-lg-4 col-sm-12">
                    
                        <div class="card text-dark bg-light mb-3">
                            <div class="card-header">
                                <h3><%= o.getTitulo()%></h3>
                            </div>
                            <div class="card-body">
                                <p>Empresa: <%= o.getEmpresa().getNombre()%> <span>(<%= o.getEmpresa().getPais()%>)</span></p>
                                <p>Telefono: <%= o.getEmpresa().getTelefono()%></p>
                                <p>Cargo: <%= o.getCargo()%></p>
                                <p>Salario: <%= o.getSalario()%> <span><%= o.getTipoContrato()%></span></p>
                            </div>
                            <a href=<%= "/SISTEMA1/postulante/oferta?id=" + o.getId()%>>
                                <div class="card-footer">
                                    <center>
                                        <i class="bi bi-check2-circle">!POSTULARME!</i>
                                    </center>
                                </div>
                            </a>  
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
