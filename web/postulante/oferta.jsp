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
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/sidebar.css" />
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/footer.css" />
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../WEB-INF/sidebar.jsp" %> 
            <div id="content">
                <%@include file="../WEB-INF/nav.jsp" %> 
                <div id="vacant-container">      
                    <div class="card bg-light mb-3">
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
                                <div class="card">
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
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="/SISTEMA1/estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
    </body>
</html>
