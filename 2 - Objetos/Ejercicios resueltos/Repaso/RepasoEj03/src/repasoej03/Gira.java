/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej03;

/**
 *
 * @author santiago
 */
public class Gira extends Recital {
    private String nomGira;
    private Fecha[] fechas;
    private int actual;
    private int DL;
    
    public Gira(String unNom, int canTemas, String unNomGira, int cantFechas){
        super(unNom, canTemas);
        nomGira = unNomGira;
        fechas = new Fecha[cantFechas];
        DL = 0;
    }

    /**
     * @return the nomGira
     */
    public String getNomGira() {
        return nomGira;
    }

    /**
     * @param nomGira the nomGira to set
     */
    public void setNomGira(String nomGira) {
        this.nomGira = nomGira;
    }
    
    public void agregarFecha(Fecha unaFecha) {
        fechas[DL] = unaFecha;
        DL++;
    }
    
    public String getActual() {
        return fechas[actual].getFecha();
    }
    
    @Override
    public void actuar() {
        System.out.println("Buenas noches " + fechas[actual].getLugar());
        super.actuar();
        actual++;
    }
    
    @Override
    public int calcularCosto() {
        return (30000 * DL);
    }
}
