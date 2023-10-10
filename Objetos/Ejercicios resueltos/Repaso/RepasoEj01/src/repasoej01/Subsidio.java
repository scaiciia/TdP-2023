/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repasoej01;

/**
 *
 * @author santiago
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    public Subsidio(double unMonto, String unMotivo){
        this.monto = unMonto;
        this.motivo = unMotivo;
        this.otorgado = false;
    }

    /**
     * @return the monto
     */
    public double getMonto() {
        return monto;
    }

    /**
     * @param monto the monto to set
     */
    public void setMonto(double monto) {
        this.monto = monto;
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
     * @return the otorgado
     */
    public boolean isOtorgado() {
        return otorgado;
    }

    /**
     * @param otorgado the otorgado to set
     */
    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
}
