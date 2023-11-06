/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema4;

/**
 *
 * @author santiago
 */
public class Triangulo extends Figura {
    
    private double lado1;
    private double lado2;
    private double lado3;
    
    /**
     *
     * @param unLado1
     * @param unLado2
     * @param unLado3
     * @param unColorRelleno
     * @param unColorLinea
     */
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea){
        super(unColorRelleno, unColorLinea);
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
    }
        
        
        /**
     * @return the lado1
     */        
        /**
     * @return the lado1
     */
    public double getLado1() {
        return lado1;
    }

    /**
     * @param lado1 the lado1 to set
     */
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    /**
     * @return the lado2
     */
    public double getLado2() {
        return lado2;
    }

    /**
     * @param lado2 the lado2 to set
     */
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    /**
     * @return the lado3
     */
    public double getLado3() {
        return lado3;
    }

    /**
     * @param lado3 the lado3 to set
     */
    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }
    
    /**
     *
     * @return
     */
    @Override
    public double calcularPerimetro() {
        return (lado1+lado2+lado3);
    }
    
    /**
     *
     * @return
     */
    @Override
    public double calcularArea() {
        double s = (lado1+lado2+lado3)/2;
        return (Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3)));
    }
    
    /**
     *
     * @return
     */
    @Override
    public String toString() {
        String cadena = String.format("Lado 1: %.2f - Lado 2: %.2f - Lado 3: %.2f - Perimetro: %.2f - Area: %.2f",
            lado1, lado2, lado3, this.calcularPerimetro(), this.calcularArea());
        return cadena;
    }
}
