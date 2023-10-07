/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema2;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author santiago
 */
public class Ej02VectorPersona {
    public static void main(String[] args) {
        int DF = 15;
        int DL = 0;
        GeneradorAleatorio.iniciar();
        Persona [] vector = new Persona[DF];
        int edad = GeneradorAleatorio.generarInt(110) + 1;
        while ((edad != 0) && (DL < 15)) {
            String nom = GeneradorAleatorio.generarString(30);
            int dni = GeneradorAleatorio.generarInt(99999999) + 1;
            vector[DL] = new Persona(nom, dni, edad);
            DL++;
            edad = GeneradorAleatorio.generarInt(110) + 1;
        }
        DL--;
        
        int i;
        for (i = 0; i < 15; i++) {
            System.out.println(vector[i].toString());
        }
        int cant65 = 0;
        for (i = 0; i < 15; i++) {
            if (vector[i].getEdad() > 65) {
                cant65++;
            }
        }
        System.out.println("La cantidad de personas mayores a 65 son: " + cant65);
        int p = -1;
        int dni = 100000000;
        for (i = 0; i < 15; i++){
            if (dni > vector[i].getDNI()){
                p = i;
                dni = vector[i].getDNI();
            }
        }
        System.out.println(vector[p].toString());
    }
}
