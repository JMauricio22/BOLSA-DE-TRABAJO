/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelos;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author rodez
 */
public class ConocimientosAcademicos implements Serializable {

    private static final long serialVersionUID = 1L;
    private int idConocimiento;
    private String tipo;
    private String nombreInstitucion;
    private String nombreTitulo;
    private Date fecha_inicio;
    private Date fecha_finalizacion;

    public ConocimientosAcademicos() {
    }

    public int getIdConocimiento() {
        return idConocimiento;
    }

    public void setIdConocimiento(int idConocimiento) {
        this.idConocimiento = idConocimiento;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getNombreInstitucion() {
        return nombreInstitucion;
    }

    public void setNombreInstitucion(String nombreInstitucion) {
        this.nombreInstitucion = nombreInstitucion;
    }

    public String getNombreTitulo() {
        return nombreTitulo;
    }

    public void setNombreTitulo(String nombreTitulo) {
        this.nombreTitulo = nombreTitulo;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_finalizacion() {
        return fecha_finalizacion;
    }

    public void setFecha_finalizacion(Date fecha_finalizacion) {
        this.fecha_finalizacion = fecha_finalizacion;
    }

}
