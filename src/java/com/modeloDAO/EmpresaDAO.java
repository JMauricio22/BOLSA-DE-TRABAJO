/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.Empresa;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class EmpresaDAO {
     Connection con;
    CallableStatement pc;
    ResultSet rs;
    int r = 0;
    
    
    public int agregar(Empresa emp){
        Conexion conexion = new Conexion();
        String sql = "call registrarEmpresa(?,?,?,?,?,?,?,?)";
        try{
            con = conexion.getConnection();
            pc = con.prepareCall(sql);
            pc.setString(1, emp.getNombre());
            pc.setString(2, emp.getTelefono());
            pc.setString(3, emp.getEmail());
            pc.setString(4, emp.getDireccion());
            pc.setString(5, emp.getNit());
            pc.setString(6, emp.getPais());
            pc.setString(7, emp.getSector());
            pc.setString(8, emp.getContrasena());
            pc.execute();
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }
}
