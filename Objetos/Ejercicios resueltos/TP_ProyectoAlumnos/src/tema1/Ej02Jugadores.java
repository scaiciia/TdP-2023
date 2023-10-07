
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        int DF = 15;
        
        //Paso 3: Crear el vector para 15 double 
        double [] vector = new double[DF];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double suma = 0;
        double prom;
        int cant = 0;
                
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < DF; i++) {
            System.out.println("Ingrese una altura");
            vector[i] = Lector.leerDouble();
            suma = suma + vector[i];
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        prom = suma / DF;
        System.out.println("El promedio de altura es: " + prom);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for (i = 0; i < DF; i++){
            if (vector[i] > prom)
                cant++;
        }
     
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores con la altura por encima del promedio son: " + cant);
    }
    
}
