<%-- 
    Document   : login
    Created on : 06-12-2021, 12:18:43 AM
    Author     : Julio Chica
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
        <nav class="navbar fixed-top navbar-expand-lg">
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
        </nav>

        <section id="container-enterprise-register" class="d-flex justify-content-center align-items-center">
            <div class="container-form">    
                <div class="container">
                    <form action="ControladorLogin" method="POST">
                        <div class="card">
                            <div class="card-header">
                                <h3>Iniciar Session</h3>
                            </div>
                            <div class="card-body">
                                <div class="row justify-content-center">
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                                        <input type="text" placeholder="Usuario" name="user" class="form-control"/>
                                    </div>
                                    <div class="col-12 mb-3 input-group">
                                        <span class="input-group-text"><i class="bi bi-key"></i></span>
                                        <input type="password" placeholder="Contraseña" name="password" class="form-control"/>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <button class="btn btn-primary">Iniciar Session</button>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <span>¿Todavia no tienes cuenta? </span><a href="registro.jsp">Registrate aquí</a>
                                    </div>
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <%@include file="WEB-INF/footer.jsp" %>

        <!-- Scripts -->
        <script src="estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="estilo/assets/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
        <script src="estilo/assets/js/owl.carousel.min.js"></script>
        <script src="estilo/assets/js/script.js"></script>
    </body>
</html>