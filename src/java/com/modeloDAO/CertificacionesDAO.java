/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Certificaciones;
import com.modelos.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class CertificacionesDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(Certificaciones c){
        Conexion conexion = new Conexion();
        String sql = "insert into certificaciones values(?,?,?,?,?,?)";
        try{
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setString(2, c.getTipo());
            ps.setDate(3, null);
            ps.setInt(4, c.getCodigo());
            ps.setString(5, c.getTitulo());
            ps.setString(6, c.getInstitucion());
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
