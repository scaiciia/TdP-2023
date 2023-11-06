/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package repasoej01;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author santiago
 */
public class RepasoEj01 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        System.out.println("Ingrese el nombre del proyecto");
        String nombre = Lector.leerString();
        System.out.println("Ingrese el codigo del proyecto");
        int cod = Lector.leerInt();
        System.out.println("Ingrese el nombre del director");
        String nomDir = Lector.leerString();
        Proyecto proj = new Proyecto(nombre, cod, nomDir);
        int i;
        int j;
        for (i = 0; i < 3; i++) {
            System.out.println("Ingrese el nombre del Investigador");
            nombre = Lector.leerString();
            int cat = GeneradorAleatorio.generarInt(5) + 1;
            System.out.println("Ingrese la especialidad");
            String esp = Lector.leerString();
            Investigador inv = new Investigador(nombre, cat, esp);
            for (j = 0; j < 2; j++) {
                System.out.println("Ingrese el monto del subsidio");
                double monto = Lector.leerDouble();
                System.out.println("Ingrese el motivo");
                String motivo = Lector.leerString();
                Subsidio sub = new Subsidio(monto, motivo);
                inv.agregarSubsidio(sub);
            }
            proj.agregarInvestigador(inv);
        }
        System.out.println("Ingrese el nombre del investigador a entregar los subsidios");
        nombre = Lector.leerString();
        proj.otorgarTodos(nombre);
        System.out.println(proj.toString());
    }
    
}
