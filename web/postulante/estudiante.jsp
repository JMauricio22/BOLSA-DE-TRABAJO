<%@page import="com.modelos.Premios"%>
<%@page import="com.modelos.Libros"%>
<%@page import="com.modelos.LaboresSociales"%>
<%@page import="com.modelos.ConocimientosAcademicos"%>
<%@page import="com.modelos.Congreso"%>
<%@page import="com.modelos.Certificaciones"%>
<%@page import="com.modelos.Postulante"%>
<%@page import="com.modelos.Aplicaciones"%>
<%@page import="java.util.ArrayList"%>
<%
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null) {
        System.out.println("Inicie session");
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }

    ArrayList<Aplicaciones> aplicaciones = (ArrayList<Aplicaciones>) session.getAttribute("APLICACIONES");

    Postulante p = (Postulante) session.getAttribute("EGRESADO");
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
                <div class="container my-5">
                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb fs-4">
                                    <li class="breadcrumb-item">/ Postulante</li>
                                    <li class="breadcrumb-item active" aria-current="page">Estudiante</li>
                                    <li class="breadcrumb-item active" aria-current="page"><%= p.getId()%></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-3">
                                    <img style="width: 100%; height: 100%" src = "/SISTEMA1/estilo/assets/images/profile.jpg"/>
                                </div>
                                <div class="col-6">
                                    <h3 class="fs-2"> 
                                        <%= p.getNombres()%> <%= p.getApellidos()%>
                                        <% if (p.getGenero().equals("M")) { %>
                                        <i class="bi bi-gender-male text-primary"></i>
                                        <% } else { %>
                                        <i class="bi bi-gender-female text-danger"></i>
                                        <% }%>
                                    </h3>
                                    <span class="text-success"><i class="bi bi-check-circle text-success"></i> Cuenta verficiada</span>
                                    <h4> <i class="bi bi-envelope"></i> <%= p.getCorreo()%> </h4>
                                    <h4> <i class="bi bi-telephone"></i> <%= p.getTelefono()%> </h4>
                                    <h4> <i class="bi bi-sort-numeric-down"></i> <%= p.getDocIdentidad()%> </h4>
                                    <h4><i class="bi bi-globe"></i> <%= p.getDireccion()%> </h4>
                                    <div class="d-block w-100 my-2">
                                        <button class="btn btn-outline-info">
                                            Contactar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <% if (!(p.getCertificaciones().isEmpty())) {%>
                    <div class="card">
                        <div class="card-header">
                            <h4>Certificaciones</h4>
                        </div>
                        <div class="card-body">
                            <% for (Certificaciones certificacion : p.getCertificaciones()) {%>
                            <div class="row">
                                <div class="col-12">
                                    <p>Titulo: <%= certificacion.getTitulo()%></p>
                                    <p>Institucion <%= certificacion.getInstitucion()%></p>
                                    <p>Tipo <%= certificacion.getTipo()%></p>
                                    <hr />
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>

                    <% if (!(p.getCongreso().isEmpty())) {%>
                    <div class="card">
                        <div class="card-header">
                            <h4>Congresos</h4>
                        </div>
                        <div class="card-body">
                            <% for (Congreso congreso : p.getCongreso()) {%>
                            <div class="row">
                                <div class="col-12">
                                    <p>Nombre: <%= congreso.getNombre()%></p>
                                    <p>Lugar: <%= congreso.getLugar()%></p>
                                    <p>Pais: <%= congreso.getPais()%></p>
                                    <hr />
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>

                    <% if (!(p.getConocimientos().isEmpty())) {%>
                    <div class="card">
                        <div class="card-header">
                            <h4>Conocimientos Academicos</h4>
                        </div>
                        <div class="card-body">
                            <% for (ConocimientosAcademicos conocimientos : p.getConocimientos()) {%>
                            <div class="row">
                                <div class="col-12">
                                    <p>Nombre: <%= conocimientos.getNombreTitulo()%></p>
                                    <p>Institucion <%= conocimientos.getNombreInstitucion()%></p>
                                    <hr />
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>

                    <% if (!(p.getLaboresSociales().isEmpty())) {%>
                    <div class="card">
                        <div class="card-header">
                            <h4>Labores sociales</h4>
                        </div>
                        <div class="card-body">
                            <% for (LaboresSociales labores : p.getLaboresSociales()) {%>
                            <div class="row">
                                <div class="col-12">
                                    <p>Nombre: <%= labores.getNombre()%></p>
                                    <p>Descripcion: <%= labores.getDescripcion()%></p>
                                    <hr />
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>

                    <% if (!(p.getLibros().isEmpty())) {%>
                    <div class="card">
                        <div class="card-header">
                            <h4>Libros</h4>
                        </div>
                        <div class="card-body">
                            <% for (Libros libros : p.getLibros()) {%>
                            <div class="row">
                                <div class="col-12">
                                    <p>Titulo: <%= libros.getTitulo()%></p>
                                    <p>Lugar Publicacion: <%= libros.getLugarPublicacion()%></p>
                                    <p>Edicion: <%= libros.getEdicion()%></p>
                                    <p>ISBN: <%= libros.getIsbn()%></p>
                                    <hr />
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>

                    <% if (!(p.getPremios().isEmpty())) {%>
                    <div class="card">
                        <div class="card-header">
                            <h4>Premios</h4>
                        </div>
                        <div class="card-body">
                            <% for (Premios premios : p.getPremios()) {%>
                            <div class="row">
                                <div class="col-12">
                                    <p>Nombre: <%= premios.getTitulo()%></p>
                                    <p>Descripcion: <%= premios.getDescripcion()%></p>
                                    <hr />
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <%}%>
                    
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="/SISTEMA1/estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
    </body>
</html>
