/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author santiago
 */
public class Circulo extends Figura {
    
    private double radio;
    
    public Circulo(double unRadio, String unColorRelleno, String unColorLinea){
        super(unColorRelleno, unColorLinea);
        this.radio = unRadio;
    }

    /**
     * @return the radio
     */
    public double getRadio() {
        return radio;
    }

    /**
     * @param radio the radio to set
     */
    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public double calcularArea() {
        return (Math.PI * Math.pow(radio, 2)); 
    }

    @Override
    public double calcularPerimetro() {
        return (2*Math.PI*radio);
    }
    
    
    
}
