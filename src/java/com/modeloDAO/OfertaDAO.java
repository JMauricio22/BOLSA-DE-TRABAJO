/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;

import com.modelos.Conexion;
import com.modelos.Oferta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author rodez
 */
public class OfertaDAO {

    Connection con;
    CallableStatement cs;
    ResultSet rs;
    int r = 0;

    public int agregar(Oferta o) {
        Conexion conexion = new Conexion();
        String sql = "{call registrarOferta(?,?,?,?,?,?,?)}";
        try {
            con = conexion.getConnection();
            cs = con.prepareCall(sql);
            cs.setInt(1, o.getId());
            cs.setString(2, o.getTitulo());
            cs.setString(3, o.getDescripcion());
            cs.setString(4, o.getJornadaLaboral());
            cs.setString(5, o.getTipoContrato());
            cs.setDouble(6, o.getSalario());
            cs.setString(7, o.getCargo());
            cs.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return r;
    }

    public void eliminar(Oferta o) {
        Conexion conexion = new Conexion();
        String sql = "{call eliminarOferta(?) }";
        try {
            con = conexion.getConnection();
            cs = con.prepareCall(sql);
            cs.setInt(1, o.getId());
            cs.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
