/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.modelos.Conexion;
import com.modelos.Empresa;
import com.modelos.Postulante;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.*;

/**
 *
 * @author rodez
 */
public class ControladorLogin extends HttpServlet {

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
//        processRequest(request, response);
        String user = request.getParameter("user");
        String pass = request.getParameter("password");

        if (user != null && pass != null) {
            try {
                Connection con = new Conexion().getConnection();
                CallableStatement cs = con.prepareCall("{ call obtenerUsuario(?,?,?,?) }");
                cs.setString(1, user);
                cs.setString(2, pass);
                cs.registerOutParameter(3, OracleTypes.CURSOR);
                cs.registerOutParameter(4, OracleTypes.CURSOR);
                cs.execute();

                ResultSet rse = (ResultSet) cs.getObject(3);

                Empresa empresa = new Empresa();

                if (rse != null) {
                    while (rse.next()) {
                        System.out.println("WHILE RESULSET EMPRESA");
                        empresa.setId(rse.getInt("idempresa"));
                        empresa.setNombre(rse.getString("nombre_empresa"));
//                    empresa.setDescripcion(rse.getString("descripcion_empresa"));
                        empresa.setDireccion(rse.getString("direccion_empresa"));
                        empresa.setEmail(rse.getString("correo_empresa"));
                        empresa.setPais(rse.getString("pais"));
                        empresa.setNit(rse.getString("nit"));
                        empresa.setTelefono(rse.getString("telefono_empresa"));
                        empresa.setSector(rse.getString("sector"));
                    }
                }

                if (empresa.getNombre() != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("USER_ID", empresa.getId());
                    session.setAttribute("EMPRESA", empresa);
                    session.setAttribute("TIPO", "EMPRESA");

                    System.out.println("RESULSET EMPRESA");

                    response.setStatus(200);
                    response.sendRedirect("/SISTEMA1/empresa/crear-oferta");
                    return;
                }

                ResultSet rsp = (ResultSet) cs.getObject(4);

                Postulante postulante = new Postulante();

                if (rsp != null) {
                    while (rsp.next()) {
                        System.out.println("WHILE RESULSET POSTULANTE");
                        postulante.setId(rsp.getInt("idpostulante"));
                        postulante.setNombres(rsp.getString("nombres"));
                        postulante.setApellidos(rsp.getString("apellidos"));
                        postulante.setGenero(rsp.getString("genero"));
//                        postulante.setGenero(rsp.getDate("f_nac"));
                        postulante.setDocIdentidad(rsp.getString("doc_identidad"));
                        postulante.setPasaporte(rsp.getInt("pasaporte"));
                        postulante.setNit(rsp.getString("nit"));
                        postulante.setNup(rsp.getString("nup"));
                        postulante.setDireccion(rsp.getString("direccion"));
                        postulante.setTelefono(rsp.getString("telefono"));
                        postulante.setCorreo(rsp.getString("correo"));
                        postulante.setRutaCV(rsp.getString("ruta_cv"));
                    }
                }

                if (postulante.getNombres() != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("USER_ID", postulante.getId());
                    session.setAttribute("POSTULANTE", postulante);
                    session.setAttribute("TIPO", "POSTULANTE");

                    System.out.println("RESULSET POSTULANTE");

                    response.setStatus(200);
                    response.sendRedirect("/SISTEMA1/postulante/crear-cv");
                    return;
                }

                request.getRequestDispatcher("login.jsp").forward(request, response);

            } catch (SQLException ex) {

                ex.printStackTrace();

            }
        }
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
