/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Certificaciones;
import com.modelos.Conexion;
import java.sql.CallableStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class CertificacionesDAO {
    Connection con;
    CallableStatement cs;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(Certificaciones c){
        Conexion conexion = new Conexion();
        String sql = "{ call insertarCertificacion(?,?,?,?,?,?) }";
        try{
            con = conexion.getConnection();
            cs = con.prepareCall(sql);
            cs.setInt(1, c.getId());
            cs.setString(2, c.getTipo());
            cs.setDate(3, null);
            cs.setInt(4, c.getCodigo());
            cs.setString(5, c.getTitulo());
            cs.setString(6, c.getInstitucion());
            cs.execute();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
