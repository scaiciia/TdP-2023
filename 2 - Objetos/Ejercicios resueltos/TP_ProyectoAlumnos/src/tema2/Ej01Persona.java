/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;

import PaqueteLectura.Lector;

/**
 *
 * @author santiago
 */
public class Ej01Persona {
    
    public static void main(String [] args) {
        System.out.println("Ingrese el nombre de la persona");
        String nombre = Lector.leerString();
        System.out.println("Ingrese el DNI");
        int dni = Lector.leerInt();
        System.out.println("Ingrese la edad");
        int edad = Lector.leerInt();
        Persona persona = new Persona(nombre, dni, edad);
        System.out.println(persona.toString());
    }
    
}
