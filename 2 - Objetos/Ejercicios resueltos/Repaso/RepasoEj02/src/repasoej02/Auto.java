/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej02;

/**
 *
 * @author santiago
 */
public class Auto {
    private String dueño;
    private String patente;
    
    public Auto(String nom, String pat) {
        dueño = nom;
        patente = pat;
    }

    /**
     * @return the dueño
     */
    public String getDueño() {
        return dueño;
    }

    /**
     * @param dueño the dueño to set
     */
    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    /**
     * @return the patente
     */
    public String getPatente() {
        return patente;
    }

    /**
     * @param patente the patente to set
     */
    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    @Override
    public String toString() {
        return String.format("Patente: %s - Dueño: %s", this.getPatente(), this.getDueño());
    }
}
