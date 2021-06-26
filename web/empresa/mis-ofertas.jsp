<%
    session = request.getSession(false);
    if (session.getAttribute("USER_ID") == null || !(session.getAttribute("TIPO") == "EMPRESA")) {
        System.out.println("Inicie session");
        request.getRequestDispatcher("/SISTEMA1/login.jsp").forward(request, response);
    }
%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelos.Oferta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Mis Ofertas</title>
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/SISTEMA1/estilo/assets/css/sidebar.css" />
    </head>
    <body>
        <div id="wrapper">
            <%@include file="../WEB-INF/sidebar.jsp" %> 
            <div id="content">
                <%@include file="../WEB-INF/nav.jsp" %> 
                <div class="container my-5 px-3">
                    <div class="row">
                        <div class="col-12">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb fs-4">
                                    <li class="breadcrumb-item">/ Empresa</li>
                                    <li class="breadcrumb-item active" aria-current="page">Mis Oferta</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table border-secondary bg-light striped table-hover">
                            <thead>
                                <tr>
                                    <th class="fs-5 text-center">Titulo</th>
                                    <th class="fs-5 text-center">Cargo</th>
                                    <th class="fs-5 text-center">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    ArrayList<Oferta> list = (ArrayList<Oferta>) session.getAttribute("OFERTAS");
                                    for (Oferta o : list) {
                                %>
                                <tr>
                                    <td class="col-3 text-center text-capitalize align-middle">
                                        <span class="fs-5">
                                            <%= o.getCargo()%>
                                        </span>
                                    </td>

                                    <td class="col-3 text-center text-capitalize align-middle">
                                        <p class="fs-5">
                                            <%= o.getCargo()%>
                                        </p>
                                        <p>
                                            <i class="bi bi-currency-dollar"></i><%= o.getSalario() + " (" + o.getJornadaLaboral() + ")"%> 
                                        </p>
                                    </td>
                                    <td class="col-3 align-middle">
                                        <div class="d-flex justify-content-center">
                                            <form method="POST" action="/SISTEMA1/ControladorEmpresa">
                                                <input type="hidden" name="id_oferta" value=<%= o.getId()%> />
                                                <button class="fs-5 link-primary btn bg-transparent" type="submit" name="accion" value="eliminar"><i class="bi bi-trash"></i> Eliminar</button>
                                            </form>
                                            <form method="POST" action="/SISTEMA1/ControladorEmpresa">
                                                <input type="hidden" name="id_oferta" value=<%= o.getId()%> />
                                                <button class="fs-5 link-primary btn bg-transparent" type="submit" name="accion" value="eliminar"><i class="bi bi-clipboard"></i> Inspeccionar</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>    
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../WEB-INF/footer.jsp"%>    

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="/SISTEMA1/estilo/assets/js/jquery-1.12.3.min.js"></script>
        <script src="/SISTEMA1/estilo/assets/js/sidebar.js"></script>
    </body>
</html>
