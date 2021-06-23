/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelos;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author rodez
 */
public class Conexion {
    
    private Connection con;
    private final String user = "system";
    private final String password = "12345";
    private final String url = "jdbc:oracle:thin:@localhost:1521:XE";
    
    public Connection getConnection(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(url , user, password);
            System.out.println("Conexion exitosa!!!");
        }catch(Exception e){     
            System.out.println("Error de conexion a la  base de datos.");
            e.printStackTrace();
        }
        return con;
    }
}
