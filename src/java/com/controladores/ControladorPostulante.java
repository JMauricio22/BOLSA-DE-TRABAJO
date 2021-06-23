package com.controladores;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.modeloDAO.EmpresaDAO;
import com.modeloDAO.OfertaDAO;
import com.modeloDAO.PostulanteDAO;
import com.modelos.Conexion;
import com.modelos.Empresa;
import com.modelos.Oferta;
import com.modelos.Postulante;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleTypes;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author rodez
 */
@WebServlet(urlPatterns = {"/ControladorPostulante"})
public class ControladorPostulante extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            switch (request.getRequestURI()) {
                case "/SISTEMA1/postulante/crear-cv":
                    request.getRequestDispatcher("/postulante/cv.jsp").forward(request, response);
                    break;
                case "/SISTEMA1/postulante/ofertas":
                    cargarOfertas(request);
                    request.getRequestDispatcher("/postulante/ofertas.jsp").forward(request, response);
                    break;
                case "/SISTEMA1/postulante/oferta":
                    cargarOferta(request);
                    request.getRequestDispatcher("/postulante/oferta.jsp").forward(request, response);
                    break;
                case "/SISTEMA1/postulante/mis-aplicaciones":
                    cargarAplicaciones(request);
                    request.getRequestDispatcher("/postulante/aplicaciones.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("404.jsp").forward(request, response);
        }

    }

    private void cargarOfertas(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession(false);
        Connection con = new Conexion().getConnection();
        String sql = "{ call obetenerOfertas(?)}";
        CallableStatement cs = con.prepareCall(sql);
        cs.registerOutParameter(1, OracleTypes.CURSOR);
        cs.execute();
        ResultSet rs = (ResultSet) cs.getObject(1);
        ArrayList<Oferta> listaOfertas = new ArrayList();

        while (rs.next()) {
            Oferta oferta = new Oferta();
            oferta.setId(rs.getInt("idoferta"));
            oferta.setTitulo(rs.getString("titulo"));
            oferta.setDescripcion(rs.getString("descripcion"));
            oferta.setJornadaLaboral(rs.getString("jornada_laboral"));
            oferta.setTipoContrato(rs.getString("tipo_contrato"));
            oferta.setSalario(rs.getDouble("salario"));
            oferta.setCargo(rs.getString("cargo"));
            Empresa empresa = new Empresa();
            empresa.setId(rs.getInt("idempresa"));
            empresa.setNombre(rs.getString("nombre_empresa"));
            empresa.setTelefono(rs.getString("telefono_empresa"));
            empresa.setEmail(rs.getString("correo_empresa"));
            empresa.setDireccion(rs.getString("direccion_empresa"));
            empresa.setNit(rs.getString("nit"));
            empresa.setPais(rs.getString("pais"));
            empresa.setSector(rs.getString("sector"));
            oferta.setEmpresa(empresa);
            listaOfertas.add(oferta);
        }

        session.setAttribute("OFERTAS", listaOfertas);
    }

    private void cargarOferta(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession(false);
        Connection con = new Conexion().getConnection();
        String sql = "{ call obtenerOferta(?,?)}";
        CallableStatement cs = con.prepareCall(sql);
        cs.registerOutParameter(1, OracleTypes.CURSOR);
        cs.setInt(2, Integer.parseInt(request.getParameter("id")));
        cs.execute();
        ResultSet rs = (ResultSet) cs.getObject(1);
        Oferta oferta = new Oferta();
        Empresa empresa = new Empresa();

        while (rs.next()) {
            oferta.setId(rs.getInt("idoferta"));
            oferta.setTitulo(rs.getString("titulo"));
            oferta.setDescripcion(rs.getString("descripcion"));
            oferta.setJornadaLaboral(rs.getString("jornada_laboral"));
            oferta.setTipoContrato(rs.getString("tipo_contrato"));
            oferta.setSalario(rs.getDouble("salario"));
            oferta.setCargo(rs.getString("cargo"));
            empresa.setId(rs.getInt("idempresa"));
            empresa.setNombre(rs.getString("nombre_empresa"));
            empresa.setTelefono(rs.getString("telefono_empresa"));
            empresa.setEmail(rs.getString("correo_empresa"));
            empresa.setDireccion(rs.getString("direccion_empresa"));
            empresa.setNit(rs.getString("nit"));
            empresa.setPais(rs.getString("pais"));
            empresa.setSector(rs.getString("sector"));
            oferta.setEmpresa(empresa);
        }
        session.setAttribute("OFERTA", oferta);
    }

    private void cargarAplicaciones(HttpServletRequest request) throws SQLException {
        HttpSession session = request.getSession(false);
        Connection con = new Conexion().getConnection();
        String sql = "{ call obtenerOfertasPostulante(?,?)}";
        CallableStatement cs = con.prepareCall(sql);
        cs.registerOutParameter(1, OracleTypes.CURSOR);
        cs.setInt(2, (Integer) session.getAttribute("USER_ID"));
        cs.execute();
        ResultSet rs = (ResultSet) cs.getObject(1);
        ArrayList<Oferta> lista = new ArrayList();
        while (rs.next()) {
            Oferta oferta = new Oferta();
            oferta.setId(rs.getInt("idoferta"));
            oferta.setTitulo(rs.getString("titulo"));
            oferta.setDescripcion(rs.getString("descripcion"));
            oferta.setJornadaLaboral(rs.getString("jornada_laboral"));
            oferta.setTipoContrato(rs.getString("tipo_contrato"));
            oferta.setSalario(rs.getDouble("salario"));
            oferta.setCargo(rs.getString("cargo"));
            lista.add(oferta);
        }
        session.setAttribute("APLICACIONES", lista);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("DOPOST EMPRESA POSTULANTE.");
        registrarPostulante(request, response);

    }

    public void registrarPostulante(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<String> list = new ArrayList();
        Postulante postulante = new Postulante();
        String filePath = "C:\\imagenes";
        String fileName = "";
        String separator = System.getProperty("file.separator");
        try {

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            //cv es la HttpServletRequest que recibimos del formulario.
            //Los items obtenidos serán cada uno de los campos del formulario,
            //tanto campos normales como ficheros subidos.
            List items = upload.parseRequest(request);

            //Se recorren todos los items, que son de tipo FileItem
            for (Object item : items) {
                FileItem uploaded = (FileItem) item;

                // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
                // subido donde nos interese
                if (!uploaded.isFormField()) {
                    // No es campo de formulario, guardamos el fichero en algún sitio
                    fileName = uploaded.getName();
                    File fichero = new File(filePath, fileName);
                    uploaded.write(fichero);
                } else {
                    // es un campo de formulario, podemos obtener clave y valor
                    list.add(uploaded.getString());
                }
            }

            System.out.println("SIZE: " + list.size());

            postulante.setNombres(list.get(0));
            postulante.setApellidos(list.get(1));
            postulante.setContrasena(list.get(2));
            postulante.setGenero(list.get(3));
            postulante.setFechaNacimiento(list.get(4));
            postulante.setDocIdentidad(list.get(5));
            postulante.setPasaporte(Integer.parseInt(list.get(6)));
            postulante.setNit(list.get(7));
            postulante.setNup(list.get(8));
            postulante.setDireccion(list.get(9));
            postulante.setTelefono(list.get(10));
            postulante.setCorreo(list.get(11));
            postulante.setRutaCV(filePath + separator + fileName);

            PostulanteDAO postulanteDAO = new PostulanteDAO();
            postulanteDAO.agregar(postulante);

            request.getRequestDispatcher("/login.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
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
