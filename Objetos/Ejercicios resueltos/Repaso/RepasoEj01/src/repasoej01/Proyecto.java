/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej01;

/**
 *
 * @author santiago
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador[] investigadores;
    private int DL;
    
    public Proyecto(String unNom, int unCod, String unNomDir){
        this.nombre = unNom;
        this.codigo = unCod;
        this.nombreDirector = unNomDir;
        this.investigadores = new Investigador[50];
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
     * @return the codigo
     */
    public int getCodigo() {
        return codigo;
    }

    /**
     * @param codigo the codigo to set
     */
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    /**
     * @return the nombreDirector
     */
    public String getNombreDirector() {
        return nombreDirector;
    }

    /**
     * @param nombreDirector the nombreDirector to set
     */
    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }
    
    public void agregarInvestigador(Investigador unInvestigador) {
        this.investigadores[DL] = unInvestigador;
        this.DL++;
    }
    
    public double dineroTotalOtorgado() {
        double total = 0;
        int i;
        int j;
        for (i = 0; i < DL; i++) {
            Investigador inv = investigadores[i];
            total += inv.montoOtorgado();
        }
        return total;
    }
    
    public void otorgarTodos(String nombre_completo) {
        int i = 0;
        Investigador inv = null;
        boolean encontrado = false;
        while ((!encontrado) && (i < DL)) {
            inv = investigadores[i];
            if (inv.getNombre().equals(nombre_completo)) {
                encontrado = true;
            } else {
                i++;
            }
        }
        if (encontrado) {
            for (i = 0; i < inv.getDL(); i++) {
                if(!inv.getSubsidio(i).isOtorgado()) {
                    inv.otorgarSubsidio(i);
                }
            }
        }
    }
    
    /**
     *
     * @return
     */
    @Override
    public String toString() {
        int i;
        String cadena = String.format("%s - Codigo: %d - Director: %s - Monto Total Otorgado: $%.2f\n", nombre, codigo, nombreDirector, this.dineroTotalOtorgado());
        cadena += "Investigadores:\n";
        for (i = 0; i < DL; i++) {
            Investigador inv = investigadores[i];
            cadena += String.format("    • %s - Categoria: %d - Especialidad: %s - Monto otorgado: $%.2f\n", inv.getNombre(), inv.getCategoria(), inv.getEspecialidad(), inv.montoOtorgado());
        }
        return cadena;
    }
    
}
