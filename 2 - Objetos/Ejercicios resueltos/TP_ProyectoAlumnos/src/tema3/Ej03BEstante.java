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
public class Ej03BEstante {
    public static void main(String[] args) {
        Estante estante = new Estante();
        System.out.println("Desea ingresar un libro?");
        String rta = Lector.leerString();
        while ((!estante.estanteLleno()) && ((rta.equals("S")) || (rta.equals("s")))) {
            System.out.println("Ingrese un titulo");
            String titulo = Lector.leerString();
            System.out.println("Ingrese editorial");
            String editorial = Lector.leerString();
            System.out.println("Ingrese autor");
            String autor = Lector.leerString();
            System.out.println("Ingrese ISBN");
            String ISBN = Lector.leerString();
            Libro libro = new Libro(titulo, editorial, autor, ISBN);
            estante.agregarLibro(libro);
            System.out.println("Desea ingresar un libro?");
            rta = Lector.leerString();
        }
        
        Libro aux = estante.devolverLibroXTitulo("Mujercitas");
        System.out.println(aux.getPrimerAutor().getNombre());
    }
}
