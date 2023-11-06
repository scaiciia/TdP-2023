/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import tema2.Persona;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author santiago
 */
public class Habitacion {
        
    private double costo;
    private boolean ocupado;
    private Persona reservadoPor;

    public Habitacion() {
        GeneradorAleatorio.iniciar();
        costo = GeneradorAleatorio.generarInt(5000) + 2000;
        ocupado = false;
    }
    /**
     * @return the costo
     */
    public double getCosto() {
        return costo;
    }

    /**
     * @param costo the costo to set
     */
    public void setCosto(double costo) {
        this.costo = costo;
    }

    /**
     * @return the ocupado
     */
    public boolean isOcupado() {
        return ocupado;
    }

    /**
     * @param ocupado the ocupado to set
     */
    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }

    /**
     * @return the reservadoPor
     */
    public Persona getReservadoPor() {
        return reservadoPor;
    }

    /**
     * @param cliente the reservadoPor to set
     */
    public void setReservadoPor(Persona cliente) {
        this.reservadoPor = cliente;
    }
    
}
