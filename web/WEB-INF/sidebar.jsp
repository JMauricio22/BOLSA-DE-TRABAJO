<div id="sidebar">
    <div class="sidebar-header">
        <h3 class="text-center">BOLSA DE TRABAJO UES</h3>
        <img class="d-block mx-auto" src="/SISTEMA1/estilo/assets/images/bg.jpg"/>
    </div>

    <ul class="nav flex-column">

        <%
            if (session.getAttribute("TIPO") == "EMPRESA") {
        %>
        <li class="nav-item active py-1">
            <a class="nav-link" href="/SISTEMA1/empresa/crear-oferta"><i class="bi bi-file-plus-fill me-2"></i> Crear oferta</a>
        </li>
        <li class="nav-item py-1">
            <a class="nav-link" href="/SISTEMA1/empresa/mis-ofertas"><i class="bi bi-stack me-2"></i> Mis ofertas</a>
        </li>
        <li class="nav-item py-1">
            <a class="nav-link" href="/SISTEMA1/empresa/notificaciones"><i class="bi bi-bell-fill me-2"></i> Notificaciones</a>
        </li>
        <%
            }
        %>


        <%
            if (session.getAttribute("TIPO") == "POSTULANTE") {
        %>
        <li class="nav-item active py-1">
            <a class="nav-link" href="/SISTEMA1/postulante/crear-cv"><i class="bi bi-file-plus-fill me-2"></i> Crear CV</a>
        </li>
        <li class="nav-item py-1">
            <a class="nav-link" href="/SISTEMA1/postulante/ofertas"><i class="bi bi-stack me-2"></i> Ver Ofertas</a>
        </li>
        <li class="nav-item py-1">
            <a class="nav-link" href="/SISTEMA1/postulante/mis-aplicaciones"><i class="bi bi-bell-fill me-2"></i>Mis Aplicaciones</a>
        </li>
        <%
            }
        %>
    </ul>
    <hR class="divider"/>
    <div class="p-2 d-flex justify-content-center">
        <button class="btn btn-outline-info">Regresar al Home</button>
    </div>
</div>