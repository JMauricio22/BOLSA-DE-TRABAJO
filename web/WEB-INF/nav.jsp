<nav class="nav bg-light justify-content-between px-3">
    <div class="d-flex justify-content-center align-items-center">
        <i id="sidebarCollapse" class="bi bi-list"></i>
    </div>
    <ul class="navbar-nav">
        <li class="nav-item dropdown me-3">
            <a class="nav-link dropdown-toggle text-dark" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span><%= session.getAttribute("USER")%></span> <i class="bi bi-person-fill"></i>
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <form method="POST" action="/SISTEMA1/ControladorLogout">
                    <li><a class="dropdown-item"><button class="btn bg-transparent" type="submit">Cerrar Session</button></a></li>
                </form>
            </ul>
        </li>
    </ul>
</nav>