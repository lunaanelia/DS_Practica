import java.util.Scanner;   //Para meter elementos por entrada
import java.io.Console;     //Para que no muestre la contraseña cuando la escribas


public class Main{

    public static void BorrarPantalla(){
        System.out.print("\033[2J\033[H");  //\033[2J Borra la pantalla  \033[H Mueve el cursor al principio
        System.out.flush();  // Asegura que el comando se ejecute inmediatamente
    }

    public static void main(String[] args){
        ChatTarget chatTarget= new ChatTarget();
        FilterManager filterManager= new FilterManager(chatTarget);
        filterManager.addFilter(new FiltroCorreo());
        filterManager.addFilter(new FiltroContraCarac());
        filterManager.addFilter(new FiltroContraMayus());
        filterManager.addFilter(new FiltroContraNum());
        
        Cliente client= new Cliente(filterManager);


        String correo, contrasena;

        // Crear un objeto Scanner para leer entrada desde la consola
        Scanner scanner = new Scanner(System.in);

        Console console=System.console();   //Para la contraseña

        BorrarPantalla();

        System.out.printf("\033[1;33mPROGRAMA CREADOR DE USUARIOS\033[0m\n");
        System.out.printf("\033[0;31mFormato del correo:\033[0m \033[3m<nombre>@<dominio>\033[0m\n");
        System.out.printf("Siendo el dominio: \033[3;32mgmail.com\033[0m o \033[3;32mhotmail.com\033[0m\n");
        System.out.printf("La contraseña debe tener al menos 8 caracteres, siendo al menos uno de ellos una mayúscula y otro un número\n\n\n");

        System.out.printf("Introduzca una dirección de correo: ");
        correo= scanner.nextLine();

        char[] contra=console.readPassword("Introduzca una contraseña: ");  //Lee la contraseña sin mostrarla por pantalla
        contrasena=new String(contra);                                      //Convierte la contraseña a string

        Cliente cliente=new Cliente(filterManager);
        cliente.crearCuenta(correo,contrasena);

    }

}