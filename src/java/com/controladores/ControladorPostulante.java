package com.controladores;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import com.modeloDAO.EmpresaDAO;
import com.modeloDAO.OfertaDAO;
import com.modeloDAO.PostulanteDAO;
import com.modelos.Certificaciones;
import com.modelos.Conexion;
import com.modelos.Congreso;
import com.modelos.ConocimientosAcademicos;
import com.modelos.Empresa;
import com.modelos.LaboresSociales;
import com.modelos.Libros;
import com.modelos.Oferta;
import com.modelos.Postulante;
import com.modelos.Premios;
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
                case "/SISTEMA1/postulante/mostrar-estudiante":
                    cargarCurriculum(request);
                    request.getRequestDispatcher("/postulante/estudiante.jsp").forward(request, response);
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

    private void cargarCurriculum(HttpServletRequest request) throws SQLException{
        HttpSession session = request.getSession(false);
        Connection con = new Conexion().getConnection();
        CallableStatement cs = con.prepareCall("{ call obtenerCV(?,?,?,?,?,?,?,?) }");
        cs.setInt(1, Integer.parseInt(request.getParameter("id_est")));
        cs.registerOutParameter(2, OracleTypes.CURSOR);
        cs.registerOutParameter(3, OracleTypes.CURSOR);
        cs.registerOutParameter(4, OracleTypes.CURSOR);
        cs.registerOutParameter(5, OracleTypes.CURSOR);
        cs.registerOutParameter(6, OracleTypes.CURSOR);
        cs.registerOutParameter(7, OracleTypes.CURSOR);
        cs.registerOutParameter(8, OracleTypes.CURSOR);
        cs.execute();
        
        ResultSet rs_postulante = (ResultSet)cs.getObject(2);
        ResultSet rs_certificaciones = (ResultSet)cs.getObject(3);
        ResultSet rs_congresos = (ResultSet)cs.getObject(4);
        ResultSet rs_conocimientos = (ResultSet)cs.getObject(5);
        ResultSet rs_labores = (ResultSet)cs.getObject(6);
        ResultSet rs_libros = (ResultSet)cs.getObject(7);
        ResultSet rs_premios = (ResultSet)cs.getObject(8);
        
        Postulante p = new Postulante();
        
        while(rs_postulante.next()){
            p.setId(rs_postulante.getInt("idpostulante"));
            p.setNombres(rs_postulante.getString("nombres"));
            p.setApellidos(rs_postulante.getString("apellidos"));
            p.setGenero(rs_postulante.getString("genero"));
            p.setFechaNacimiento(rs_postulante.getString("f_nac"));
            p.setDocIdentidad(rs_postulante.getString("doc_identidad"));
            p.setPasaporte(rs_postulante.getInt("pasaporte"));
            p.setNit(rs_postulante.getString("nit"));
            p.setNup(rs_postulante.getString("nup"));
            p.setDireccion(rs_postulante.getString("direccion"));
            p.setTelefono(rs_postulante.getString("telefono"));
            p.setCorreo(rs_postulante.getString("correo"));
            p.setRutaCV(rs_postulante.getString("ruta_cv"));
        }
        
        ArrayList<Certificaciones> certificaciones = new ArrayList();
        
        while(rs_certificaciones.next()){
            Certificaciones certificacion = new Certificaciones();
            certificacion.setCodigo(rs_certificaciones.getInt("codigo"));
            certificacion.setTipo(rs_certificaciones.getString("tipo_certificacion"));
            certificacion.setTitulo(rs_certificaciones.getString("titulo_certificacion"));
            certificacion.setInstitucion(rs_certificaciones.getString("institucion"));
            certificaciones.add(certificacion);
        }
        
        p.setCertificaciones(certificaciones);
       
        ArrayList<Congreso> congresos = new ArrayList();
        
        while(rs_congresos.next()){
            Congreso congreso = new Congreso();
            congreso.setNombre(rs_congresos.getString("nombre_titulo"));
            congreso.setLugar(rs_congresos.getString("lugar"));
            congreso.setPais(rs_congresos.getString("pais"));
            congreso.setAnfitrion(rs_congresos.getString("anfitrion"));
            congreso.setFecha(rs_congresos.getDate("fecha_congreso"));
            congresos.add(congreso);
        }
        
        p.setCongreso(congresos);
        
   
        ArrayList<ConocimientosAcademicos> conocimientos = new ArrayList();
        
        while(rs_conocimientos.next()){
            ConocimientosAcademicos conocimiento = new ConocimientosAcademicos();
            conocimiento.setNombreInstitucion(rs_conocimientos.getString("nombre_institucion"));
            conocimiento.setFecha_inicio(rs_conocimientos.getDate("fecha_inicio"));
            conocimiento.setFecha_finalizacion(rs_conocimientos.getDate("fecha_finalizacion"));
            conocimiento.setNombreTitulo(rs_conocimientos.getString("nombre_titulo"));
            conocimiento.setTipo(rs_conocimientos.getString("tipo"));
            conocimientos.add(conocimiento);
        }
        
        p.setConocimientos(conocimientos);
        
        ArrayList<LaboresSociales> labores = new ArrayList();
        
        while(rs_labores.next()){
            LaboresSociales labor = new LaboresSociales();
            labor.setNombre(rs_labores.getString("nombre"));
            labor.setDescripcion(rs_labores.getString("descripcion"));
            labores.add(labor);
        }
        
        p.setLaboresSociales(labores);
        
        ArrayList<Libros> libros = new ArrayList();
        
        while(rs_libros.next()){
            Libros libro = new Libros();
            libro.setEdicion(rs_libros.getString("edicion"));
            libro.setTitulo(rs_libros.getString("titulo_libro"));
            libro.setLugarPublicacion(rs_libros.getString("lugar_publicado"));
            libro.setFechaPublicacion(rs_libros.getDate("fecha_publicacion"));
            libro.setIsbn(rs_libros.getString("isbn"));
            libros.add(libro);
        }
        
        p.setLibros(libros);
        
        ArrayList<Premios> premios = new ArrayList();
        
        while(rs_premios.next()){
            Premios premio = new Premios();
            premio.setTitulo(rs_premios.getString("nombre_titulo"));
            premio.setDescripcion(rs_premios.getString("descripcion"));
            premios.add(premio);
        }
        
        p.setPremios(premios);
        
       
        session.setAttribute("EGRESADO", p);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
