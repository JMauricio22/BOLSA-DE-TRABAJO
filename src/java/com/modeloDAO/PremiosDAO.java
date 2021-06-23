/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.Premios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class PremiosDAO {
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(Premios p){
        Conexion conexion = new Conexion();
        String sql = "insert into premios values(?,?,?)";
        try{
            con = conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, 1);
            ps.setString(2, p.getTitulo());
            ps.setString(3, p.getDescripcion());
            ps.executeUpdate();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
