/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tema3;

/**
 *
 * @author santiago
 */
public class Estante {
    private Libro[] libros;
    private int DL;

    public Estante(){
        libros = new Libro[20];
        DL = 0;
    }
    
    public int cantidadLibros() {
        return DL;
    }
    
    public boolean estanteLleno() {
        boolean lleno;
        if (DL == 20) {
            lleno = true;
        } else {
            lleno = false;
        }
        return lleno;
    }
    
    public void agregarLibro(Libro unLibro) {
        libros[DL] = unLibro;
        DL++;
    }
    
    public Libro devolverLibroXTitulo(String unTitulo) {
        Libro libro = null;
        int i = 0;
        boolean encontro = false;
        while ((!encontro) && (i < DL)) {
            libro = libros[i];
            if (libro.getTitulo().equals(unTitulo)) {
                encontro = true;
            } else {
                i++;
            }
        }
        return libro;
    }
}
