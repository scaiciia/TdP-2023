/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej03;

/**
 *
 * @author santiago
 */
public class EventoOcasional extends Recital {
    private String motivo;
    private String nomContratante;
    private String dia;
    
    public EventoOcasional(String unNom, int canTemas, String unMotivo, String unNomContratante, String unDia) {
        super(unNom, canTemas);
        motivo = unMotivo;
        nomContratante = unNomContratante;
        dia = unDia;
    }

    /**
     * @return the motivo
     */
    public String getMotivo() {
        return motivo;
    }

    /**
     * @param motivo the motivo to set
     */
    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    /**
     * @return the nomContratante
     */
    public String getNomContratante() {
        return nomContratante;
    }

    /**
     * @param nomContratante the nomContratante to set
     */
    public void setNomContratante(String nomContratante) {
        this.nomContratante = nomContratante;
    }

    /**
     * @return the dia
     */
    public String getDia() {
        return dia;
    }

    /**
     * @param dia the dia to set
     */
    public void setDia(String dia) {
        this.dia = dia;
    }
    
    @Override
    public void actuar() {
        switch (motivo) {
            case "beneficiencia" -> System.out.println("Recuerden colaborar con " + nomContratante);
            case "TV" -> System.out.println("Saludos amigos televidentes");
            case "privado" -> System.out.println("Un feliz cumpleaños para " + nomContratante);
        }
        super.actuar();
    }
    
    @Override
    public int calcularCosto() {
        int monto = 0;
        if (motivo.equals("TV")) {
            monto = 50000;
        } else {
            monto = 150000;
        }
        return monto;
    }
}
