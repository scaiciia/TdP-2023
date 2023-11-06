/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej04;

/**
 *
 * @author santiago
 */
public class Corista {
    private String nombre;
    private int dni;
    private int edad;
    private int tono;
    
    public Corista(String unNom, int unDni, int unaEdad, int unTono) {
        this.nombre = unNom;
        this.dni = unDni;
        this.edad = unaEdad;
        this.tono = unTono;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the dni
     */
    public int getDni() {
        return dni;
    }

    /**
     * @param dni the dni to set
     */
    public void setDni(int dni) {
        this.dni = dni;
    }

    /**
     * @return the edad
     */
    public int getEdad() {
        return edad;
    }

    /**
     * @param edad the edad to set
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }

    /**
     * @return the tono
     */
    public int getTono() {
        return tono;
    }

    /**
     * @param tono the tono to set
     */
    public void setTono(int tono) {
        this.tono = tono;
    }
    
}
