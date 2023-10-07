/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema1;

import PaqueteLectura.Lector;

/**
 *
 * @author santiago
 */
public class Ej5Restaurante {
    public static void main(String[] args) {
        String [] aspectos = new String[4];
        aspectos[0] = "Atencion al cliente";
        aspectos[1] = "Calidad de la comida";
        aspectos[2] = "Precio";
        aspectos[3] = "Ambiente";
        int [][] clientes = new int[5][4];
        int i;
        int j;
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 4; j++) {
                System.out.println("Calificar el/la " + aspectos[j] + ": ");
                clientes[i][j] = Lector.leerInt();
            }
        }
        
        for (j = 0; j < 4; j++) {
            double prom;
            int suma = 0;
            for (i = 0; i < 5; i++) {
                suma = suma + clientes[i][j];
            }
            prom = (double)suma / 5;
            System.out.println(aspectos[j] + ": " + prom);
        }
    }
}
