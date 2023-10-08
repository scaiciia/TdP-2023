/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author santiago
 */
public class Circunferencia {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Circunferencia(double unRadio, String unColorRelleno, String unColorLinea){
        radio = unRadio;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
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

    /**
     * @return the colorRelleno
     */
    public String getColorRelleno() {
        return colorRelleno;
    }

    /**
     * @param colorRelleno the colorRelleno to set
     */
    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    /**
     * @return the colorLinea
     */
    public String getColorLinea() {
        return colorLinea;
    }

    /**
     * @param colorLinea the colorLinea to set
     */
    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro() {
        return (2*Math.PI*radio);
    }
    
    public double calcularArea() {
        return (Math.PI * Math.pow(radio, 2));
    }
    
    
}
