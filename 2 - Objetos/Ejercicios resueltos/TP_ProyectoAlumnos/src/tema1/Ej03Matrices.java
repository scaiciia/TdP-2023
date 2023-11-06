/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
        GeneradorAleatorio.iniciar();
	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int[5][5];
        int i;
        int j;
        for (i = 0; i < 5; i++){
            for (j = 0; j < 5; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        }
    
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i = 0; i < 5; i++){
            for (j = 0; j < 5; j++)
                System.out.print(matriz[i][j] + " ");
            System.out.println();
        }
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for (i = 0; i < 5; i++){
            suma = suma + matriz[0][i];
        }
        System.out.println("La suma de los elementos de la fila 1 es: " + suma);
    
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vector = new int[5];
        for (j = 0; j < 5; j++){
            vector[j] = 0;
            for (i = 0; i < 5; i++)
                vector[j] = vector[j] + matriz[i][j];
        }
        for (i = 0; i < 5; i++){
            System.out.print(vector[i] + " ");
        }
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("Ingrese el dato a buscar");
        int num = Lector.leerInt();
        i = 0;
        j = 0;
        boolean enc = false;
        while ((enc = false) && (i < 5)){
            while ((enc = false) && (j < 5)){
                if (matriz[i][j] == num){
                    enc = true;
                } else {
                    j++;
                }
            }
            if (enc = false) {
                i++;
            }
        }
        if (enc = true) {
            System.out.println("Fila: " + i + " - Columna: " + j);
        } else {
            System.out.println("No se encontró el elemento");
        }
    }
}
