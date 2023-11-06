/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej03;

/**
 *
 * @author santiago
 */
public abstract class Recital {
    private String nombre;
    private String[] temas;
    private int DL = 0;
    
    public Recital(String unNom, int canTemas) {
        setNombre(unNom);
        temas = new String[canTemas];
        setDL(0);
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
     * @return the DL
     */
    public int getDL() {
        return DL;
    }

    /**
     * @param DL the DL to set
     */
    public void setDL(int DL) {
        this.DL = DL;
    }
    
    public void agregarTema(String nomTema) {
        temas[DL] = nomTema;
        DL++;
    }
    
    public void actuar() {
        int i;
        for (i = 0; i < DL; i++) {
            System.out.println("Y ahora tocaremos " + temas[i]);
        }
    }
    
    public abstract int calcularCosto();
}
