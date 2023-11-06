/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package repasoej03;

/**
 *
 * @author santiago
 */
public class RepasoEj03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EventoOcasional evento = new EventoOcasional("La Renga", 3, "TV", "Tinelli", "11/10/23");
        Gira gira = new Gira("La Renga", 3, "Latinoamerica", 3);
        evento.agregarTema("El final es donde parti");
        evento.agregarTema("El rebelde");
        evento.agregarTema("Obscuro diamante");
        gira.agregarTema("El final es donde parti");
        gira.agregarTema("El rebelde");
        gira.agregarTema("Obscuro diamante");
        Fecha fecha = new Fecha("11/10/23", "Buenos Aires");
        gira.agregarFecha(fecha);
        fecha = new Fecha("18/10/23", "Montevideo");
        gira.agregarFecha(fecha);
        fecha = new Fecha("25/10/23", "Sao Pablo");
        gira.agregarFecha(fecha);
        System.out.println("Costo Evento: $" + evento.calcularCosto());
        System.out.println("Costo Gira: $" + gira.calcularCosto());
        evento.actuar();
        gira.actuar();
        gira.actuar();
        gira.actuar();
    }
    
}
