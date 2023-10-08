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
public class Ej05Campeonato {
    public static void main(String[] args){
        Partido[] vector = new Partido[20];
        int i = 0;
        int DL = 0;
        System.out.println("Ingrese el nombre del equipo visitante");
        String visitante = Lector.leerString();
        while ((!visitante.equals("ZZZ")) && (DL < 20)){
            System.out.println("Ingrese el nombre del equipo local");
            String local = Lector.leerString();
            System.out.println("Ingrese la cantidad de goles del visitante");
            int golVisitante = Lector.leerInt();
            System.out.println("Ingrese la cantidad de goles del local");
            int golLocal = Lector.leerInt();
            vector[DL] = new Partido(local, visitante, golLocal, golVisitante);
            DL++;
            System.out.println("Ingrese el nombre del equipo visitante");
            visitante = Lector.leerString();
        }
        int cantRiver = 0;
        int cantBocaLocal = 0;
        for (i = 0; i < DL; i++){
            Partido partido = vector[i];
            System.out.println(partido.getLocal() + " " + partido.getGolesLocal() + " VS " + partido.getVisitante() + " " + partido.getGolesVisitante());
            if (partido.getGanador().equals("River")) {
                cantRiver++;
            }
            if (partido.getLocal().equals("Boca")){
                cantBocaLocal += partido.getGolesLocal();
            }
        }
        System.out.println("Partidos ganados por River: " + cantRiver);
        System.out.println("Goles de Boca de local: " + cantBocaLocal);
    }
}
