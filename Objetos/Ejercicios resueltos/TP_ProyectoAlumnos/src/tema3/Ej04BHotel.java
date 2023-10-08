/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

import PaqueteLectura.Lector;
import tema2.Persona;
/**
 *
 * @author santiago
 */
public class Ej04BHotel {
    public static void main(String[] args) {
        Hotel hotel = new Hotel(3);
        System.out.println("Desea ingresar algun cliente?");
        String rta = Lector.leerString();
        while ((rta.equals("S")) || (rta.equals("s"))) {
            System.out.println("Ingrese nombre del cliente");
            String nombre = Lector.leerString();
            System.out.println("Ingrese DNI del cliente");
            int dni = Lector.leerInt();
            System.out.println("Ingrese la edad del cliente");
            int edad = Lector.leerInt();
            Persona cliente = new Persona(nombre, dni, edad);
            System.out.println("Ingrese la habitación");
            int hab = Lector.leerInt();
            hotel.ingresarCliente(cliente, hab);
            System.out.println("Desea ingresar algun cliente?");
            rta = Lector.leerString();
        }
        System.out.println(hotel.toString());
        hotel.aumentarPrecios(500);
        System.out.println(hotel.toString());
    }
}
