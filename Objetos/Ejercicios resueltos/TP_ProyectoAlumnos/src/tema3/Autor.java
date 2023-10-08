/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author santiago
 */
public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor(String unNombre, String unaBiografia, String unOrigen) {
        nombre = unNombre;
        biografia = unaBiografia;
        origen = unOrigen;
    }
    
    public Autor(String unNombre) {
        nombre = unNombre;
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
     * @return the biografia
     */
    public String getBiografia() {
        return biografia;
    }

    /**
     * @param biografia the biografia to set
     */
    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    /**
     * @return the origen
     */
    public String getOrigen() {
        return origen;
    }

    /**
     * @param origen the origen to set
     */
    public void setOrigen(String origen) {
        this.origen = origen;
    }

    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "Nombre: " + nombre + " - Biografía: " + biografia + " - Origen: " + origen;
    }
}
