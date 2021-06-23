/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controladores;

import com.modelos.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.mail.*;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author rodez
 */
public class ControladorOferta extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String accion = request.getParameter("accion");
        try {
            switch (accion) {
                case "aplicar":
                    aplicar(request);
                    response.sendRedirect("/SISTEMA1/postulante/mis-aplicaciones");
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }
    }

    private void aplicar(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession(false);
        Connection con = new Conexion().getConnection();
        CallableStatement cs = con.prepareCall("{ call aplicar(?,?)}");
        cs.setInt(1, (Integer) session.getAttribute("USER_ID"));
        cs.setInt(2, Integer.parseInt(request.getParameter("idOferta")));
        cs.execute();
    }

    public void enviarCorreo(String destinatario, String asunto, String cuerpo) {
        String remitente = "pablitoperez1806@gmail.com";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.user", remitente);
        props.setProperty("mail.smtp.password", "gitpruebapablito");
        props.put("mail.smtp.ssl.enable", "true"); //Para conectar de manera segura al servidor SMTP
        props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
        props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google
        Session session = Session.getInstance(props, null);

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.setFrom(remitente);
            msg.setRecipients(Message.RecipientType.TO,
                    destinatario);
            msg.setSubject(asunto);
            msg.setSentDate(new Date());
            msg.setText(cuerpo);
            Transport transport = session.getTransport("smtp");
            transport.connect("smtp.gmail.com", remitente, "gitpruebapablito");
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
