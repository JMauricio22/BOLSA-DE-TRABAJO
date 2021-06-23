/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.modeloDAO.EmpresaDAO;
import com.modeloDAO.OfertaDAO;
import com.modelos.Aplicaciones;
import com.modelos.Conexion;
import com.modelos.Empresa;
import com.modelos.Oferta;
import com.modelos.Postulante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author rodez
 */
public class ControladorEmpresa extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
        }
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

        System.out.println("DOGET EMPRESA CONTROLADOR.");

        switch (request.getRequestURI()) {
            case "/SISTEMA1/empresa/mis-ofertas":
                mostrarOfertas(request, response);
                break;
            case "/SISTEMA1/empresa/crear-oferta":
                request.getRequestDispatcher("/empresa/perfil.jsp").forward(request, response);
                break;
            case "/SISTEMA1/empresa/postulante":
                request.getRequestDispatcher("/empresa/estudiante.jsp").forward(request, response);
                break;
            case "/SISTEMA1/empresa/notificaciones":
                obtenerAplicaciones(request);
                System.out.println("GET COMTROLADOR EMPRESA NOTIFICACIONES");
                request.getRequestDispatcher("/empresa/notificaciones.jsp").forward(request, response);
                break;
        }
    }

    private void mostrarOfertas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            request.getRequestDispatcher("/404.jsp").forward(request, response);
            return;
        }
        Connection con = new Conexion().getConnection();

        int id = (int) session.getAttribute("USER_ID");

        ResultSet rs;

        try {
            CallableStatement cs = con.prepareCall("{ call obtenerOfertasEmpresa(?,?)}");
            cs.setInt(1, id);
            cs.registerOutParameter(2, OracleTypes.CURSOR);
            cs.execute();
            rs = (ResultSet) cs.getObject(2);
            ArrayList<Oferta> ofertas = new ArrayList();
            while (rs.next()) {
                Oferta ofe = new Oferta();
                ofe.setId(rs.getInt("idoferta"));
                ofe.setTitulo(rs.getString("titulo"));
                ofe.setDescripcion(rs.getString("descripcion"));
                ofe.setJornadaLaboral(rs.getString("jornada_laboral"));
                ofe.setTipoContrato(rs.getString("tipo_contrato"));
                ofe.setSalario(Double.parseDouble(rs.getString("salario")));
                ofe.setCargo(rs.getString("cargo"));
                ofertas.add(ofe);
            }
            session.setAttribute("OFERTAS", ofertas);
        } catch (SQLException ex) {
            Logger.getLogger(ControladorEmpresa.class.getName()).log(Level.SEVERE, null, ex);
        }

        request.getRequestDispatcher("/empresa/mis-ofertas.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        System.out.println("DOPOST EMPRESA CONTROLADOR.");

        String accion = request.getParameter("accion");

        switch (accion) {
            case "registrar":
                EmpresaDAO empresaDAO = new EmpresaDAO();
                empresaDAO.agregar(crearEmpresa(request));
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                break;
            case "publicar":
                OfertaDAO ofertaDAO = new OfertaDAO();
                ofertaDAO.agregar(crearOferta(request));
                request.getRequestDispatcher("/empresa/perfil.jsp").forward(request, response);
                break;
        }
    }

    private void obtenerAplicaciones(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        Connection con = new Conexion().getConnection();

        int id = (int) session.getAttribute("USER_ID");

        ResultSet rs;

        try {
            CallableStatement cs = con.prepareCall("{ call obtenerPostulantesEmpresa(?,?)}");
            cs.registerOutParameter(1, OracleTypes.CURSOR);
            cs.setInt(2, id);
            cs.execute();
            rs = (ResultSet) cs.getObject(1);
            ArrayList<Aplicaciones> lista = new ArrayList();
            while (rs.next()) {
               Oferta oferta = new Oferta();
               Postulante postulante = new Postulante();
               Aplicaciones aplicacion = new Aplicaciones();
               oferta.setTitulo(rs.getString("titulo"));
               oferta.setCargo(rs.getString("cargo"));
               postulante.setId(rs.getInt("idpostulante"));
               postulante.setNombres(rs.getString("nombres"));
               postulante.setApellidos(rs.getString("apellidos"));
               postulante.setTelefono(rs.getString("telefono"));
               postulante.setCorreo(rs.getString("correo"));
               aplicacion.setOferta(oferta);
               aplicacion.setPostulante(postulante);
               lista.add(aplicacion);
            }
            session.setAttribute("APLICACIONES", lista);
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
    }

    private Empresa crearEmpresa(HttpServletRequest request) {
        Empresa empresa = new Empresa();
        empresa.setNombre(request.getParameter("nombreEmpresa"));
        empresa.setTelefono(request.getParameter("telefonoEmpresa"));
        empresa.setDescripcion(request.getParameter("descripcionEmpresa"));
        empresa.setDireccion(request.getParameter("direccionEmpresa"));
        empresa.setEmail(request.getParameter("emailEmpresa"));
        empresa.setNit(request.getParameter("nitEmpresa"));
        empresa.setPais(request.getParameter("paisEmpresa"));
        empresa.setSector(request.getParameter("sectorEmpresa"));
        empresa.setContrasena(request.getParameter("contrasenaEmpresa"));
        return empresa;
    }

    private Oferta crearOferta(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Oferta oferta = new Oferta();
        oferta.setId((Integer) session.getAttribute("USER_ID"));
        oferta.setTitulo(request.getParameter("tituloOferta"));
        oferta.setCargo(request.getParameter("cargoOferta"));
        oferta.setTipoContrato(request.getParameter("tipoContratoOferta"));
        oferta.setJornadaLaboral(request.getParameter("jornadaLaboralOferta"));
        oferta.setSalario(Double.parseDouble(request.getParameter("salarioOferta")));
        oferta.setDescripcion(request.getParameter("descripcionOferta"));
        return oferta;
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
