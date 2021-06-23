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
        <title>Mis Ofertas</title>
        <%@include file="../WEB-INF/bootstrap-links.jsp" %>
        <link rel="stylesheet" href="../estilo/assets/css/header.css" />
        <link rel="stylesheet" href="../estilo/assets/css/footer.css" />
        <link rel="stylesheet" href="../estilo/assets/css/botones.css" />
    </head>
    <body>
        <header>
            <%@include file="../WEB-INF/headerEMP.jsp" %>
        </header>

        <div class="container my-5">
            <table class="table">
                <thead>
                    <tr>
                        <th>Titulo</th>
                        <th>Cargo</th>
                        <th>Salario</th>
                        <th>Opciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Oferta> list = (ArrayList<Oferta>) session.getAttribute("OFERTAS");
                        for (Oferta o : list) {
                    %>
                    <tr>
                        <td><%= o.getTitulo()%></td>
                        <td><%= o.getCargo()%></td>
                        <td><%= o.getSalario()%></td>
                        <td>
                            <form method="POST" action="/SISTEMA1/ControladorEmpresa">
                                <input type="hidden" name="id_oferta" value=<%= o.getId() %> />
                                <button class="btn btn-danger" type="submit" name="accion" value="eliminar">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>    
            </table>
        </div>

        <%@include file="../WEB-INF/footer.jsp"%>    
    </body>
</html>
