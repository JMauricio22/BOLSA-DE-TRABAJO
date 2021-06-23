/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelos;

import java.io.Serializable;

/**
 *
 * @author rodez
 */
public class Lenguaje implements Serializable {

    private static final long serialVersionUID = 1L;
    private int id;
    private String escritura;
    private String lectura;
    private String conversacion;
    private String escucha;

    public Lenguaje() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEscritura() {
        return escritura;
    }

    public void setEscritura(String escritura) {
        this.escritura = escritura;
    }

    public String getLectura() {
        return lectura;
    }

    public void setLectura(String lectura) {
        this.lectura = lectura;
    }

    public String getConversacion() {
        return conversacion;
    }

    public void setConversacion(String conversacion) {
        this.conversacion = conversacion;
    }

    public String getEscucha() {
        return escucha;
    }

    public void setEscucha(String escucha) {
        this.escucha = escucha;
    }

}
