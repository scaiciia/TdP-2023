/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package repasoej02;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author santiago
 */
public class RepasoEj02 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Ingrese un nombre");
        String nom = Lector.leerString();
        System.out.println("Ingrese la direccion");
        String dir = Lector.leerString();
        System.out.println("Ingrese hora de apertura");
        String hAp = Lector.leerString();
        System.out.println("Ingrese hora de cierre");
        String hCi = Lector.leerString();
        Estacionamiento estacionamiento = new Estacionamiento(nom, dir, hAp, hCi, 3, 3);
        int i;
        String patente;
        for (i = 0; i < 6; i++) {
            patente = GeneradorAleatorio.generarString(6);
            System.out.println("Ingrese nombre del dueño");
            String nombre = Lector.leerString();
            Auto auto = new Auto(nombre, patente);
            System.out.println("Ingrese un piso");
            int piso = Lector.leerInt();
            System.out.println("Ingrese una plaza");
            int plaza = Lector.leerInt();
            estacionamiento.ingresarAuto(auto, piso, plaza);
        }
        
        System.out.println(estacionamiento.toString());
        System.out.println(estacionamiento.cantEnPlaza(1));
        System.out.println("Ingrese la patente a buscar");
        patente = Lector.leerString();
        System.out.println(estacionamiento.buscarAuto(patente));
    }
    
}
