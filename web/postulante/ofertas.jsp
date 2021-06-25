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
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/sidebar.css" />
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/cv.css"/>
    </head>
    <body>
        <div id="wrappper">
            <%@include file="../WEB-INF/sidebar.jsp" %> 
            <div id="content">
                <%@include file="../WEB-INF/nav.jsp" %>        
                    <div class="container my-5">    
                        <div class="row">
                            <%                            ArrayList<Oferta> lista = (ArrayList<Oferta>) session.getAttribute("OFERTAS");
                                for (Oferta o : lista) {
                            %>
                            <div class="col-lg-4 col-sm-12">

                                <div class="card text-dark bg-transparent mb-3 shadow">
                                    <div class="card-header bg-transparent text-center">
                                        <h3><%= o.getTitulo()%></h3>
                                    </div>
                                    <div class="card-body">
                                        <p>Empresa: <%= o.getEmpresa().getNombre()%> <span>(<%= o.getEmpresa().getPais()%>)</span></p>
                                        <p>Telefono: <%= o.getEmpresa().getTelefono()%></p>
                                        <p>Cargo: <%= o.getCargo()%></p>
                                        <p>Salario: <%= o.getSalario()%> <span><%= o.getTipoContrato()%></span></p>
                                    </div>
                                    <a href=<%= "/SISTEMA1/postulante/oferta?id=" + o.getId()%>>
                                        <div class="card-footer bg-transparent">
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
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="/SISTEMA1/estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
    </body>
</html>
