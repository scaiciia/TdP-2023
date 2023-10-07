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
public class Ej03Casting {
    public static void main(String[] arg){
        Persona[][] matriz = new Persona[5][8];
        int i = 0;
        int j;
        boolean seguir = true;
        System.out.println("Ingrese el nombre de la persona");
        String nombre = Lector.leerString();
        for (i = 0; i < 5; i ++){
            for (j = 0; j < 8; j++){
                System.out.println("Ingrese el DNI");
                int dni = Lector.leerInt();
                System.out.println("Ingrese la edad");
                int edad = Lector.leerInt();
                matriz[i][j] = new Persona(nombre, dni, edad);
                if (matriz[i][j].getNombre().equals("ZZZ")) {
                    seguir = false;
                    break;
                }
                System.out.println("Ingrese el nombre de la persona");
                nombre = Lector.leerString();
            }
            if (!seguir){
                break;
            }
        }
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 8; j++) {
                if(matriz[i][j] != null){
                    System.out.println("Día: " + (i+1) + " - Turno: " + (j+1));
                    System.out.println(matriz[i][j].getNombre());
                    break;
                }
            }
        }
    }
}
