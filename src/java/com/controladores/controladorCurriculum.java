/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.modeloDAO.CertificacionesDAO;
import com.modeloDAO.CongresosDAO;
import com.modeloDAO.ConocimientosAcademicosDAO;
import com.modeloDAO.LaboresSocialesDAO;
import com.modeloDAO.LenguajeDAO;
import com.modeloDAO.LibrosDAO;
import com.modeloDAO.PremiosDAO;
import com.modelos.Certificaciones;
import com.modelos.Congreso;
import com.modelos.ConocimientosAcademicos;
import com.modelos.LaboresSociales;
import com.modelos.Lenguaje;
import com.modelos.Libros;
import com.modelos.Premios;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rodez
 */
@WebServlet(name = "controladorCurriculum", urlPatterns = {"/controladorCurriculum"})
public class controladorCurriculum extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
        /* Conocimientos Academicos */
        String[] instituciones = request.getParameterValues("nombreInstitucion[]");
        String[] titulos = request.getParameterValues("nombreTitulo[]");
        ConocimientosAcademicosDAO cadao = new ConocimientosAcademicosDAO();

        if (instituciones != null && titulos != null) {
            for (int i = 0; i < instituciones.length; i++) {
                ConocimientosAcademicos conocimientos = new ConocimientosAcademicos();
                conocimientos.setIdConocimiento((Integer)session.getAttribute("USER_ID"));
                conocimientos.setNombreInstitucion(instituciones[i]);
                conocimientos.setNombreTitulo(titulos[i]);
                conocimientos.setTipo("Diploma");
                cadao.agregar(conocimientos);
            }
        }

        /* Premios */
        String[] nombrePremios = request.getParameterValues("nombrePremio[]");
        String[] descripcionPremio = request.getParameterValues("descripcionPremio[]");
        PremiosDAO premiosDAO = new PremiosDAO();

        if (nombrePremios != null && descripcionPremio != null) {
            for (int i = 0; i < nombrePremios.length; i++) {
                Premios premios = new Premios();
                premios.setId((Integer)session.getAttribute("USER_ID"));
                premios.setTitulo(nombrePremios[i]);
                premios.setDescripcion(descripcionPremio[i]);
                premiosDAO.agregar(premios);
            }
        }

        /* Labores Sociales */
        String[] nombreLaborSocial = request.getParameterValues("nombreLaborSocial[]");
        String[] descripcionLaborSocial = request.getParameterValues("descripcionLaborSocial[]");
        LaboresSocialesDAO laborSocialDAO = new LaboresSocialesDAO();

        if (nombreLaborSocial != null && descripcionLaborSocial != null) {
            for (int i = 0; i < nombreLaborSocial.length; i++) {
                LaboresSociales laboresSociales = new LaboresSociales();
                laboresSociales.setId((Integer)session.getAttribute("USER_ID"));
                laboresSociales.setNombre(nombreLaborSocial[i]);
                laboresSociales.setDescripcion(descripcionLaborSocial[i]);
                laborSocialDAO.agregar(laboresSociales);
            }
        }

        /* Libros */
        String[] tituloLibro = request.getParameterValues("tituloLibro[]");
        String[] lugarPublicacionLibro = request.getParameterValues("lugarPublicacionLibro[]");
        String[] edicionLibro = request.getParameterValues("edicionLibro[]");
        String[] isbnLibro = request.getParameterValues("isbnLibro[]");
        LibrosDAO librosDAO = new LibrosDAO();

        if (tituloLibro != null && lugarPublicacionLibro != null && edicionLibro != null && isbnLibro != null) {
            for (int i = 0; i < tituloLibro.length; i++) {
                Libros libro = new Libros();
                libro.setId((Integer)session.getAttribute("USER_ID"));
                libro.setTitulo(tituloLibro[i]);
                libro.setLugarPublicacion(lugarPublicacionLibro[i]);
                libro.setEdicion(edicionLibro[i]);
                libro.setIsbn(isbnLibro[i]);
                librosDAO.agregar(libro);
            }
        }

        /* Congreso */
        String[] nombreCongreso = request.getParameterValues("nombreCongreso[]");
        String[] lugarCongreso = request.getParameterValues("lugarCongreso[]");
        String[] paisCongreso = request.getParameterValues("paisCongreso[]");
        String[] anfitrionCongreso = request.getParameterValues("anfitrionCongreso[]");
        CongresosDAO congresoDAO = new CongresosDAO();

        if (nombreCongreso != null && lugarCongreso != null && paisCongreso != null && anfitrionCongreso != null) {
            for (int i = 0; i < nombreCongreso.length; i++) {
                Congreso congreso = new Congreso();
                congreso.setId((Integer)session.getAttribute("USER_ID"));
                congreso.setNombre(nombreCongreso[i]);
                congreso.setLugar(lugarCongreso[i]);
                congreso.setPais(paisCongreso[i]);
                congreso.setAnfitrion(anfitrionCongreso[i]);
                congresoDAO.agregar(congreso);
            }
        }

        /* Certificaciones */
        String[] tituloCertificacion = request.getParameterValues("tituloCertificacion[]");
        String[] tipoCertificacion = request.getParameterValues("tipoCertificacion[]");
        String[] codigoCertificacion = request.getParameterValues("codigoCertificacion[]");
        String[] institucionCertificacion = request.getParameterValues("institucionCertificacion[]");
        CertificacionesDAO certificacionesDAO = new CertificacionesDAO();

        if (tituloCertificacion != null && tipoCertificacion != null && codigoCertificacion != null && institucionCertificacion != null) {
            for (int i = 0; i < tituloCertificacion.length; i++) {
                Certificaciones certificacion = new Certificaciones();
                certificacion.setId((Integer)session.getAttribute("USER_ID"));
                certificacion.setTitulo(tituloCertificacion[i]);
                certificacion.setTipo(tipoCertificacion[i]);
                certificacion.setCodigo(Integer.parseInt(codigoCertificacion[i].trim()));
                certificacion.setInstitucion(institucionCertificacion[i]);
                certificacionesDAO.agregar(certificacion);
            }
        }

        /* Lenguaje */
        String nivelEscritura = request.getParameter("nivelEscritura");
        String nivelLectura = request.getParameter("nivelLectura");
        String nivelConversacion = request.getParameter("nivelConversacion");
        String nivelEscucha = request.getParameter("nivelEscucha");
        /*
        if (nivelEscritura != null && nivelLectura != null && nivelConversacion != null && nivelEscucha != null) {
            Lenguaje lenguaje = new Lenguaje();

            lenguaje.setEscritura(nivelEscritura);
            lenguaje.setEscritura(nivelEscritura);
            lenguaje.setConversacion(nivelConversacion);
            lenguaje.setEscucha(nivelEscucha);

            LenguajeDAO lenguajeDAO = new LenguajeDAO();

            lenguajeDAO.agregar(lenguaje);
        }
         */
        request.getRequestDispatcher("/postulante/oferta.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
