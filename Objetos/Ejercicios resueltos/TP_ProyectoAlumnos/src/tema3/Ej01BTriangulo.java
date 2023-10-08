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
public class Ej01BTriangulo {
    public static void main(String[] args) {
        Triangulo triangulo = new Triangulo();
        System.out.println("Ingrese el lado 1");
        triangulo.setLado1(Lector.leerDouble());
        System.out.println("Ingrese el lado 2");
        triangulo.setLado2(Lector.leerDouble());
        System.out.println("Ingrese el lado 3");
        triangulo.setLado3(Lector.leerDouble());
        System.out.println("Ingrese el color de relleno");
        triangulo.setRelleno(Lector.leerString());
        System.out.println("Ingrese el color de la linea");
        triangulo.setColorLinea(Lector.leerString());
        System.out.println("Perimetro: " + triangulo.calcularPerimetro());
        System.out.println("Area: " + triangulo.calcularArea());
    }
}
