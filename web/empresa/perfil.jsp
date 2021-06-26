<%
    /*
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null || !(session.getAttribute("TIPO") == "EMPRESA")) {
        System.out.println("Inicie session");
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }
     */
%>

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
    </head>
    <body>
        <!--
        <header>
        <%@include file="../WEB-INF/headerEMP.jsp" %>
    </header>
        -->
        <div id="wrapper">
            <%@include file="../WEB-INF/sidebar.jsp" %> 
            <div id="content">

                <%@include file="../WEB-INF/nav.jsp" %> 
                <div class="container my-5">
                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb fs-4">
                                    <li class="breadcrumb-item">/ Empresa</li>
                                    <li class="breadcrumb-item active" aria-current="page">Crear Oferta</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <form method="POST" action="/SISTEMA1/ControladorEmpresa">
                        <div class="card">
                            <div class="card-header bg-transparent">
                                <h3>Datos Oferta</h3>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Titulo*</label>
                                        <input class="form-control" type="text" name="tituloOferta"/>
                                    </div>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Cargo*</label>
                                        <input class="form-control" type="text" name="cargoOferta"/>
                                    </div>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Jornada Laboral*</label>
                                        <select class="form-select" type="text" name="jornadaLaboralOferta">
                                            <option value="tiempo parcial">Tiempo Parcial</option>
                                            <option value="tiempo completo">Tiempo Completo</option>
                                            <option value="por hora">Por Hora</option>
                                            <option value="desde casa">Desde Casa</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Tipo de Contrato*</label>
                                        <select class="form-select" type="text" name="tipoContratoOferta">
                                            <option value="Contrato indefinido">contrato indefinido</option>
                                            <option value="Tiempo completo">Tiempo Completo</option>
                                            <option value="Contrato de formacion">Contrato de formacion</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Salario*</label>
                                        <input class="form-control" type="number" name="salarioOferta" step=".01"/>
                                    </div>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Descripcion de Tareas*</label>
                                        <textarea class="form-control" rows="5" name="descripcionOferta"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <div class="card">
                            <div class="card-header bg-transparent">
                                <h3>Requerimientos</h3>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Habilidades</label>
                                        <select class="form-select">
                                            <option value="">OPTION 1</option>
                                            <option value="">OPTION 2</option>
                                            <option value="">OPTION 3</option>
                                            <option value="">OPTION 4</option>
                                            <option value="">OPTION 5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row justify-content-center mb-3">
                                    <div class="col-md-8 col-lg-6 col-sm-12">
                                        <label class="form-label">Idiomas</label>
                                        <select class="form-select">
                                            <option value="">OPTION 1</option>
                                            <option value="">OPTION 2</option>
                                            <option value="">OPTION 3</option>
                                            <option value="">OPTION 4</option>
                                            <option value="">OPTION 5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-12 my-4 d-flex justify-content-center">
                                <button class="btn btn-success" type="submit" name="accion" value="publicar">PUBLICAR</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="/SISTEMA1/estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
    </body>
</html>
