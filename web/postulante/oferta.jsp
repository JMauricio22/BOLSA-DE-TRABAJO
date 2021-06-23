<%@page import="com.modelos.Oferta"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null || !(session.getAttribute("TIPO") == "POSTULANTE")) {
        System.out.println("Inicie session");
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }

    Oferta o = (Oferta) session.getAttribute("OFERTA");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Oferta</title>
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/oferta.css"/>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/header.css"/>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/footer.css" />
    </head>
    <body>
        <header>
            <%@include file="../WEB-INF/headerPOST.jsp" %>
        </header>
        
        <div id="vacant-container">      
                <div class="card bg-light border-primary mb-3">
                    <div class="row g-0">
                      <div class="col-md-4">
                        <img src="/SISTEMA1/estilo/assets/images/empresa.jpg" class="img-fluid rounded-start" alt="...">
                      </div>
                      <div class="col-md-8">
                        <div class="card-body">
                            <div id="vacant-info"> <br>
                                <h2 class="card-title">Empresa: <%= o.getEmpresa().getNombre()%> <span>(<%= o.getEmpresa().getPais()%>)</span></h2>
                                <h3 class="card-text">Dirección: <%= o.getEmpresa().getDireccion()%></h3>
                                <h3 class="card-text">Teléfono:  <%= o.getEmpresa().getTelefono()%></h3>
                            </div>
                        </div>
                      </div>
                    </div>
                </div>

            <div id="vacant-info" class="container my-2">
                <div class="row">
                    <div class="col-12 border-bottom border-white">
                        <div class="card border-danger">
                            <div class="card-body">
                                <h2><%= o.getTitulo()%></h2>
                                <p>Jornada Laboral: <%= o.getJornadaLaboral()%></p>
                                <p>Tipo de Contrato: <%= o.getTipoContrato()%></p>
                                <p>Salario: <%= o.getSalario()%></p>
                                <p>Descripcion: <%= o.getDescripcion()%></p>
                            </div>
                        </div>
                    </div>
                </div>
                  
                <div class="row my-3 p-4">
                    <div class="col-12">
                        <form method="POST"  action="/SISTEMA1/ControladorOferta">
                            <input type="hidden" value=<%= o.getId()%> name="idOferta"/>    
                            <button name="accion" value="aplicar" class="btn btn-success d-block mx-auto">APLICAR</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../WEB-INF/footer.jsp" %>
    </body>
</html>
