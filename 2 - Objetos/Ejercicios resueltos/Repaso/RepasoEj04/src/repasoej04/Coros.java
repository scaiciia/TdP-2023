/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej04;

/**
 *
 * @author santiago
 */
public abstract class Coros {
    
    private String nombre;
    private Director dir;
    
    public Coros(String unNom, Director unDir) {
        this.nombre = unNom;
        this.dir = unDir;
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
     * @return the dir
     */
    public Director getDir() {
        return dir;
    }

    /**
     * @param dir the dir to set
     */
    public void setDir(Director dir) {
        this.dir = dir;
    }
    
    public abstract void agregarCorista();
    
    public abstract boolean estaLleno();
    
    public abstract boolean coroBienFormado();
}
