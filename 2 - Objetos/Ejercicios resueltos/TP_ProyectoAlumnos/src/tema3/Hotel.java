/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import tema2.Persona;
/**
 *
 * @author santiago
 */
public class Hotel {
    
    private Habitacion[] habitaciones;
    private int cantHab;
    
    public Hotel(int n){
        cantHab = n;
        habitaciones = new Habitacion[cantHab];
        int i;
        for (i = 0; i < cantHab; i++) {
            habitaciones[i] = new Habitacion();
        }
    }
    
    public boolean ingresarCliente(Persona cliente, int i){
        boolean finalizado = false;
        Habitacion habitacion = habitaciones[i - 1];
        if (!habitacion.isOcupado()) {
            habitacion.setReservadoPor(cliente);
            habitacion.setOcupado(true);
            finalizado = true;
        }
        return finalizado;
    }
    
    public boolean aumentarPrecios(double n) {
        boolean finalizado = false;
        int i;
        for (i = 0; i < cantHab; i++) {
            Habitacion hab = habitaciones[i];
            hab.setCosto(hab.getCosto() + n);
        }
        return finalizado;
    }
    
    /**
     *
     * @return
     */
    @Override
    public String toString(){
        String cadena = "";
        int i;
        for (i = 0; i < cantHab; i++) {
            Habitacion hab = habitaciones[i];
            String ocupada;
            if (hab.isOcupado()) {
                Persona cliente = hab.getReservadoPor();
                ocupada = String.format("Ocupada - Nombre: %s, dni: %d, Edad: %d", cliente.getNombre(), cliente.getDNI(), cliente.getEdad());
            } else {
                ocupada = "Libre";
            }
            cadena += String.format("Habitacion %d: $%.2f, %s\n", (i + 1), hab.getCosto(), ocupada);
        }
        return cadena;
    }
    
}
