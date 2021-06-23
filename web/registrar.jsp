<%-- 
    Document   : registrar.jsp
    Created on : 06-12-2021, 01:15:47 PM
    Author     : rodez
--%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>LOGIN</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"><!-- comment -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <link href="estilo/assets/css/footer.css" rel="stylesheet">       
        <link href="estilo/assets/css/header.css" rel="stylesheet">
        <link href="estilo/assets/css/registro.css" rel="stylesheet">
    </head>
    <body>

        <!-- NavigationBar Section -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <img class="img-fluid logo" src="estilo/assets/images/logoues.png" alt="logo">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">HOME</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav> <br><br>
        
        <section id="container-enterprise-register" class="d-flex justify-content-center align-items-center">
            <div class="container-form">    
                <div class="container"> <br>
                    <form enctype="multipart/form-data" action="com.controladores/ControladorPostulante" method="POST"> <br>
                        <div class="card">
                            <div class="card-header"> 
                                <h3>Registro de Postulante</h3> 
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center"> 
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                                        <input type="Text" class="form-control" id="txtnombre" name="txtnombre" placeholder="Nombre">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-people-fill"></i></span>
                                        <input type="Text" class="form-control"  id="txtapellido" name="txtapellido" placeholder="Apellidos">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-gender-ambiguous"></i></span>
                                        <select name="txtgenero" class="form-control">
                                                        <option>Elegir</option>
                                                        <option value="M">M</option>
                                                        <option value="F">F</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-calendar-day"></i></span>
                                        <input type="date" class="form-control" id="txtfecha" name="txtfecha">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-sort-numeric-down"></i></span>
                                        <input type="Text" class="form-control" id="txtdui" name="txtdui" placeholder="Número Único de Identidad (DUI)">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-sort-numeric-down"></i></span>
                                        <input type="Text" class="form-control" id="txtpasaporte" name="txtpasaporte" placeholder="Pasaporte"> 
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-sort-numeric-down"></i></span>
                                        <input type="Text" class="form-control" id="txtnit" name="txtnit" placeholder="Número de Identificación Tributaria (NIT)">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-sort-numeric-down"></i></span>
                                        <input type="Text" class="form-control" id="txtnup" name="txtnup" placeholder="Número Único Previsional (NUP)">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-house-door"></i></span>
                                        <input type="Text" class="form-control" id="txtdireccion" name="txtdireccion" placeholder="Dirección"> 
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                                        <input type="Text" class="form-control" id="txttelefono" name="txttelefono" placeholder="Teléfono">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                        <input type="email" class="form-control" id="txtcorreo" name="txtcorreo" placeholder="Correo (ejemplo@correo.com)">
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-instagram"></i></span>
                                        <span class="input-group-text"><i class="bi bi-twitter"></i></span>
                                        <span class="input-group-text"><i class="bi bi-facebook"></i></span>
                                        <input type="Text" class="form-control" id="txtrs" name="txtrs" placeholder="Redes Sociales">
                                    </div>
                                    
                                    <div class="col-12 mb-3 input-group">
                                        <span>Curriculum Vitae:</span>
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-file-person"></i></span>
                                        <input type="file" class="form-control" id="cv" name="cv">
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <button class="btn btn-success col-md-12 mb-3 input-group">Registrar</button> 
                                    </div> 
                                </div>
                            </div>
                        </div>
                    </form> <br>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <%@include file="footer.jsp"%>

        <!-- Scripts -->
        <script src="estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="estilo/assets/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
        <script src="estilo/assets/js/owl.carousel.min.js"></script>
        <script src="estilo/assets/js/script.js"></script>
    </body>
</html>