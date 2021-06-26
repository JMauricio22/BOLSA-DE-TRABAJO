/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.LaboresSociales;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class LaboresSocialesDAO {
    Connection con;
    CallableStatement ps;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(LaboresSociales ls){
        Conexion conexion = new Conexion();
        String sql = "{ call insertarLaborSocial(?,?,?) }";
        try{
            con = conexion.getConnection();
            ps = con.prepareCall(sql);
            ps.setInt(1,ls.getId());
            ps.setString(2, ls.getNombre());
            ps.setString(3, ls.getDescripcion());
            ps.execute();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
