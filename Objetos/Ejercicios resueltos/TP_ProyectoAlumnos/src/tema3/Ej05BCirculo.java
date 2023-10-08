/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector;
/**
 *
 * @author santiago
 */
public class Ej05BCirculo {
    public static void main(String[] args) {
        System.out.println("Ingrese el radio del circulo");
        double radio = Lector.leerDouble();
        System.out.println("Ingrese el color de relleno");
        String colorRelleno = Lector.leerString();
        System.out.println("Ingrese el color de la linea");
        String colorLinea = Lector.leerString();
        Circunferencia circulo = new Circunferencia(radio, colorRelleno, colorLinea);
        System.out.println(String.format("%.2f", circulo.calcularPerimetro()));
        System.out.println(String.format("%.2f", circulo.calcularArea()));
    }
}
