/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.Libros;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class LibrosDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(Libros l){
        Conexion conexion = new Conexion();
        String sql = "{ call insertarLibros(?,?,?,?,?,?) }";
        try{
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, l.getId());
            ps.setString(2, l.getTitulo());
            ps.setString(3, l.getLugarPublicacion());
            ps.setDate(4, null);
            ps.setString(5, l.getEdicion());
            ps.setString(6, l.getIsbn());
            ps.execute();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
