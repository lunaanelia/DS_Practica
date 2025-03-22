from BeautilSoupStra import *
from SeleniumStra import *
from Context import *

def menu():
    seguir = True
    while seguir:
        print("Elige un metodo:")
        print("\t1 --> Beautiful Soup")
        print("\t2 --> Selenium")
        try:
            # Solicitar la opción al usuario
            opcion = int(input())
            
            # Procesar la opción seleccionada
            if opcion == 1 or opcion == 2:
               seguir = False
            else:
                print("Numero no valida.")

        except ValueError:
            print("Por favor, ingrese un número válido.\n")
    
    return opcion

def navegador():
    seguir = True
    while seguir:
        print("Elige un nevegador:")
        print("\t1 --> Firefox")
        print("\t2 --> Chrome")
        try:
            # Solicitar la opción al usuario
            opcion = int(input())
            
            # Procesar la opción seleccionada
            if opcion == 1 or opcion == 2:
               seguir = False
               if opcion == 1:
                    return "firefox"
               else:
                    return "chrome"
            else:
                print("Numero no valida.")

        except ValueError:
            print("Por favor, ingrese un número válido.\n")     



def main():

    url = "https://quotes.toscrape.com/"
    num_pag = 5

    opc = menu()
    
    if opc == 1:
        BS = BeaSoup()
        contexto = context(BS)
        print("\t\tObteniendo información con Beautiful Soup ...")

    else:
        nav = navegador()
        Sen = Selen(nav)  # Cuando este la eleccion de navegador esto hay que cambiar
        contexto = context(Sen)
        print("\t\tObteniendo información con Selenium ...")
    
    contexto.ejecutar(url, num_pag)

    # Solicitar la opción al usuario
    archivo = input("Introduzca el nombre del fichero: ")
    
    acepto = archivo.endswith(".yaml")

    # Procesar la opción seleccionada
    if not acepto:
        print("El nombre dado no termina en '.yaml'. Por lo tanto el nombre del fichero donde se guardan los resultados será 'archivo.yaml'")
        archivo = "archivo.yaml"
    else:
        print("\tNombre aceptado")

    print("\t\tGuardando la información...")
    contexto.guardar(archivo)
    print("\t\tInformacion guardada con exito!!")

if __name__ == "__main__":
    main()