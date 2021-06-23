/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.Postulante;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author rodez
 */
public class PostulanteDAO {

    Connection con;
    CallableStatement ps;
    ResultSet rs;
    int r = 0;

    public int agregar(Postulante p) {
        System.out.println("AGREGAR POSTULANTE");
        System.out.println("DATE: " + p.getFechaNacimiento());
        Conexion conexion = new Conexion();
        String sql = "{call registroPostulante(?,?,?,?,?,?,?,?,?,?,?,?,?)}";
        try {
            con = conexion.getConnection();
            ps = con.prepareCall(sql);
            ps.setString(1, p.getNombres());
            ps.setString(2, p.getApellidos());
            ps.setString(3, p.getGenero());
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");//give format in which you are receiving the `String date_updated`
            java.util.Date date = sdf.parse(p.getFechaNacimiento());
            java.sql.Date sql_date = new java.sql.Date(date.getTime());
            ps.setDate(4, sql_date);

            ps.setString(5, p.getDocIdentidad());
            ps.setInt(6, p.getPasaporte());
            ps.setString(7, p.getNit());
            ps.setString(8, p.getNup());
            ps.setString(9, p.getDireccion());
            ps.setString(10, p.getTelefono());
            ps.setString(11, p.getCorreo());
            ps.setString(12, p.getRutaCV());
            ps.setString(13, p.getContrasena());
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
