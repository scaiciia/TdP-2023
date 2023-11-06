/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej02;

/**
 *
 * @author santiago
 */
public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int pisos;
    private int plazas;
    private Auto[][] pisosPlazas;
    
    public Estacionamiento(String unNom, String unaDir){
        nombre = unNom;
        direccion = unaDir;
        horaApertura = "8:00";
        horaCierre = "21:00";
        pisosPlazas = new Auto[5][10];
    }
    
    public Estacionamiento(String unNom, String unaDir, String horaA, String horaC, int nPisos, int nPlazas) {
        nombre = unNom;
        direccion = unaDir;
        horaApertura = horaA;
        horaCierre = horaC;
        pisos = nPisos;
        plazas = nPlazas;
        pisosPlazas = new Auto[nPisos][nPlazas];
    }
    
    public void ingresarAuto(Auto unAuto, int piso, int plaza) {
        if (pisosPlazas[piso - 1][plaza - 1] == null) {
            pisosPlazas[piso - 1][plaza - 1] = unAuto;
        }
    }
    
    public String buscarAuto(String patente) {
        String rta = "Auto Inexistente";
        boolean encontrado = false;
        int piso = 0;
        int plaza = 0;
        while ((!encontrado) && (piso < pisos)) {
            while ((!encontrado) && (plaza < plazas)) {
                Auto auto = pisosPlazas[piso][plaza];
                if ((auto != null) && (auto.getPatente().equals(patente))) {
                    encontrado = true;
                } else {
                    plaza++;
                }
            }
            if (!encontrado) {
                piso++;
            }
        }
        if (encontrado) {
            rta = String.format("Piso: %d - Plaza: %d", piso, plaza);
        }
        return rta;
    }
    
    public int cantEnPlaza(int plaza) {
        int i;
        int cant = 0;
        for (i = 0; i < pisos; i++) {
            if (pisosPlazas[i][plaza - 1] != null) {
                cant++;
            }
        }
        return cant;
    }
    
    @Override
    public String toString() {
        String cadena = "";
        int piso;
        int plaza;
        for (piso = 0; piso < pisos; piso++) {
            cadena += String.format("Piso %d\n", (piso + 1));
            for (plaza = 0; plaza < plazas; plaza++) {
                Auto auto = pisosPlazas[piso][plaza];
                cadena += String.format("Plaza %d: ", (plaza + 1));
                if (auto != null) {
                    cadena += auto.toString();
                } else {
                    cadena += "Libre";
                }
                if (plaza == 4) {
                    cadena += "\n";
                } else {
                    cadena += " - ";
                }
            }
        }
        return cadena;
    }
    
}
