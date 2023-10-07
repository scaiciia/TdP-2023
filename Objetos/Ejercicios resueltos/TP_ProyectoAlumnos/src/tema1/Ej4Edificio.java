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
public class Ej4Edificio {
    public static void main(String[] args) {
        int [][] edificio = new int[8][4];
        int i;
        int j;
        for (i = 0; i < 8; i++) {
            for (j = 0; j < 4; j++) {
                edificio[i][j] = 0;
            }
        }
        System.out.println("Ingrese el nro. de piso");
        int piso = Lector.leerInt();
        while (piso != 9) {
            System.out.println("Ingrese el nro. de oficina");
            int oficina = Lector.leerInt();
            edificio[piso-1][oficina-1]++;
            System.out.println("Ingrese el nro. de piso");
            piso = Lector.leerInt();
        }
        for (i = 0; i < 8; i++) {
            System.out.println("Piso: " + (i+1));
            for (j = 0; j < 4; j++) {
                System.out.print(edificio[i][j] + " ");
            }
            System.out.println();
        }
    }
}
