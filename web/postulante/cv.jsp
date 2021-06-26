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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/cv.css"/>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/sidebar.css" />
        <title>Curriculum</title>
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
                                    <li class="breadcrumb-item active" aria-current="page">Curriculum</li>
                                </ol>
                            </nav>
                        </div>
                    </div>

                    <form id="CurriculumForm" action="/SISTEMA1/controladorCurriculum" method="POST">
                        <!-- Seccion de Conocimientos Academicos -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Conocimientos Academicos</h2>
                            </div>
                            <div id="card-conocimientos-academicos" class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#conocimientosAcaModal">
                                            <i class="bi bi-plus"></i> Añadir
                                        </button>
                                    </div>
                                </div>

                            </div>
                            <!--                    <div class="card-footer">
                                                    <button class="btn btn-success" type="submit"> Enviar </button>
                                                </div>-->
                        </div>

                        <!-- Seccion de Conocimientos Academicos -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Premios</h2>
                            </div>
                            <div id="card-premios" class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#premiosModal">
                                            <i class="bi bi-plus"></i> Añadir
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seccion de Labores Sociales -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Labores Sociales</h2>
                            </div>
                            <div id="card-labores-sociales" class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#laborSocialModal">
                                            <i class="bi bi-plus"></i> Añadir
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seccion de Libros -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Libros</h2>
                            </div>
                            <div id="card-libros" class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#librosModal">
                                            <i class="bi bi-plus"></i> Añadir
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seccion de Congresos -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Congresos</h2>
                            </div>
                            <div id="card-congresos" class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#congresosModal">
                                            <i class="bi bi-plus"></i> Añadir
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seccion de Certificaciones -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Certificaciones</h2>
                            </div>
                            <div id="card-certificaciones" class="card-body">
                                <div class="row">
                                    <div class="col-12 d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#certificacionesModal">
                                            <i class="bi bi-plus"></i> Añadir
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seccion de Lenguaje -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Lenguaje</h2>
                            </div>
                            <div class="card-body">
                                <div class="row mb-3 justify-content-center">
                                    <div class="col-md-1">
                                        <label class="form-label">Escritura</label>
                                    </div>
                                    <div class="col-md-4">
                                        <select name="nivelEscritura" class="form-select">
                                            <option value="basico">Basico</option>
                                            <option value="intermedio">Intermedio</option>
                                            <option value="avanzado">Avanzado</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3 justify-content-center">
                                    <div class="col-md-1">
                                        <label class="form-label">Lectura</label>
                                    </div>
                                    <div class="col-md-4">
                                        <select name="nivelLectura" class="form-select">
                                            <option value="basico">Basico</option>
                                            <option value="intermedio">Intermedio</option>
                                            <option value="avanzado">Avanzado</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3 justify-content-center">
                                    <div class="col-md-1">
                                        <label class="form-label">Conversacion</label>
                                    </div>
                                    <div class="col-md-4">
                                        <select name="nivelConversacion" class="form-select">
                                            <option value="basico">Basico</option>
                                            <option value="intermedio">Intermedio</option>
                                            <option value="avanzado">Avanzado</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row mb-3 justify-content-center">
                                    <div class="col-md-1">
                                        <label class="form-label">Escucha</label>
                                    </div>
                                    <div class="col-md-4">
                                        <select name="nivelEscucha" class="form-select">
                                            <option value="basico">Basico</option>
                                            <option value="intermedio">Intermedio</option>
                                            <option value="avanzado">Avanzado</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Seccion de conocimientos y habilidades -->
                        <div class="card">
                            <div class="card-header">
                                <h2>Conocimientos y Habilidades</h2>
                            </div>
                            <div id="card-habilidades" class="card-body">
                                <div class="row justify-content-center">
                                    <div class="col-3">
                                        <select id="lista-habilidades" class="form-select">
                                            <option value="Word">Microsoft Word</option>
                                            <option value="Excel">Microsoft Excel</option>
                                            <option value="PowerPoint">Microsoft PowerPoint</option>
                                            <option value="Visio">Microsoft Visio</option>
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <button class="btn btn-outline-primary" onclick="agregarHabilidades()"><i class="bi bi-plus"></i> Añadir</button>
                                    </div>
                                </div>
                                <div class="row justify-content-center my-3">
                                    <div class="col-sm-12 col-md6" id="habilidades-selecionadas">

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-12 my-4 d-flex justify-content-center">
                                <button class="btn btn-confirm" type="submit">GUARDAR CV</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>

        <%@include  file="../modals/ModalConocimientosAcademicos.jsp" %>    

        <!--Modal Premios -->
        <%@include file="../modals/ModalPremios.jsp" %>

        <!--Modal Labor Social -->
        <%@include file="../modals/ModalLaborSocial.jsp" %>

        <!--Modal Labor Social -->
        <%@include file="../modals/ModalLibros.jsp" %>

        <!--Modal Congreso -->
        <%@include file="../modals/ModalCongresos.jsp" %>

        <!--Modal Certificacion -->
        <%@include file="../modals/ModalCertificaciones.jsp" %>

    </body>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/SISTEMA1/js/cv.js"></script>
    <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
</html>
