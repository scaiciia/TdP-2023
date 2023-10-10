/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej01;

/**
 *
 * @author santiago
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios;
    private int DL;
    
    public Investigador(String unNombre, int unaCat, String unaEsp){
        this.nombre = unNombre;
        this.categoria = unaCat;
        this.especialidad = unaEsp;
        this.subsidios = new Subsidio[5];
        this.DL = 0;
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
     * @return the categoria
     */
    public int getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    /**
     * @return the especialidad
     */
    public String getEspecialidad() {
        return especialidad;
    }

    /**
     * @param especialidad the especialidad to set
     */
    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }
    
    public int getDL() {
        return DL;
    }
    
    public Subsidio getSubsidio(int i) {
        return subsidios[i];
    }
    
    public void otorgarSubsidio(int i) {
        subsidios[i].setOtorgado(true);
    }
    
    public void agregarSubsidio(Subsidio unSubsidio) {
        this.subsidios[DL] = unSubsidio;
        this.DL++;
    }
    
    public double montoOtorgado() {
        double total = 0;
        int j;
        for (j = 0; j <  DL; j++) {
            Subsidio sub = getSubsidio(j);
            if (sub.isOtorgado()) {
                total += sub.getMonto();
            }
        }
        return total;
    }
    
}
