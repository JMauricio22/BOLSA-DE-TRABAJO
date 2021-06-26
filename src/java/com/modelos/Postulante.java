/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelos;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author rodez
 */
public class Postulante implements Serializable {

    private static final long serialVersionUID = 1L;
    private int id;
    private String nombres;
    private String apellidos;
    private String genero;
    private String fechaNacimiento;
    private String docIdentidad;
    private int pasaporte;
    private String nit;
    private String nup;
    private String direccion;
    private String telefono;
    private String correo;
    private String rs;
    private String rutaCV;
    private String contrasena;
    private ArrayList<Certificaciones> certificaciones;
    private ArrayList<Congreso> congreso;
    private ArrayList<ConocimientosAcademicos> conocimientos;
    private ArrayList<LaboresSociales> laboresSociales;
    private ArrayList<Libros> libros;
    private ArrayList<Premios> premios;

    public ArrayList<Certificaciones> getCertificaciones() {
        return certificaciones;
    }

    public void setCertificaciones(ArrayList<Certificaciones> certificaciones) {
        this.certificaciones = certificaciones;
    }

    public ArrayList<Congreso> getCongreso() {
        return congreso;
    }

    public void setCongreso(ArrayList<Congreso> congreso) {
        this.congreso = congreso;
    }

    public ArrayList<ConocimientosAcademicos> getConocimientos() {
        return conocimientos;
    }

    public void setConocimientos(ArrayList<ConocimientosAcademicos> conocimientos) {
        this.conocimientos = conocimientos;
    }

    public ArrayList<LaboresSociales> getLaboresSociales() {
        return laboresSociales;
    }

    public void setLaboresSociales(ArrayList<LaboresSociales> laboresSociales) {
        this.laboresSociales = laboresSociales;
    }

    public ArrayList<Libros> getLibros() {
        return libros;
    }

    public void setLibros(ArrayList<Libros> libros) {
        this.libros = libros;
    }

    public ArrayList<Premios> getPremios() {
        return premios;
    }

    public void setPremios(ArrayList<Premios> premios) {
        this.premios = premios;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDocIdentidad() {
        return docIdentidad;
    }

    public void setDocIdentidad(String docIdentidad) {
        this.docIdentidad = docIdentidad;
    }

    public int getPasaporte() {
        return pasaporte;
    }

    public void setPasaporte(int pasaporte) {
        this.pasaporte = pasaporte;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getNup() {
        return nup;
    }

    public void setNup(String nup) {
        this.nup = nup;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getRs() {
        return rs;
    }

    public void setRs(String rs) {
        this.rs = rs;
    }

    public String getRutaCV() {
        return rutaCV;
    }

    public void setRutaCV(String cv) {
        this.rutaCV = cv;
    }

    public Postulante() {
    }
}
