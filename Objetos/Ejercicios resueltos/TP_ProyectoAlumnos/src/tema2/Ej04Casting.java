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
public class Ej04Casting {
    public static void main(String[] args) {
        Persona[][] matriz = new Persona[5][8];
        int i = 0;
        int j;
        System.out.println("Ingrese el nombre de la persona");
        String nombre = Lector.leerString();
        while ((i != 40) && (!"ZZZ".equals(nombre))){
            System.out.println("Ingrese el DNI");
            int dni = Lector.leerInt();
            System.out.println("Ingrese la edad");
            int edad = Lector.leerInt();
            System.out.println("Ingrese el dia del casting");
            int dia = Lector.leerInt();
            j = 1;
            while ((j < 8) && (matriz[dia-1][j] != null)){
                j++;
            }
            if (j == 8){
                System.out.println("No hay lugar turno en el dia especificado");
            } else {
                matriz[dia-1][j] = new Persona(nombre, dni, edad);
                i++;
            }
            System.out.println("Ingrese el nombre de la persona");
            nombre = Lector.leerString();
        }
        for (i = 0; i < 5; i++) {
            int cant = 0;
            for (j = 0; j < 8; j++) {
                if (matriz[i][j] != null){
                    cant++;
                }
            }
            System.out.println("Cantidad de inscriptos el dia " + (i + 1) + ": " + cant + " Personas");
        }
    }
}
