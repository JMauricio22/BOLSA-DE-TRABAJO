/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.Lenguaje;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class LenguajeDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(Lenguaje l){
        Conexion conexion = new Conexion();
        String sql = "insert into postulante values(?,?,?,?,?)";
        try{
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setString(2, l.getEscritura());
            ps.setString(3, l.getLectura());
            ps.setString(4, l.getConversacion());
            ps.setString(5, l.getEscucha());
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
