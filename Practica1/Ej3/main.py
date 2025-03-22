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


def main():

    url = "https://quotes.toscrape.com/"
    num_pag = 5

    opc = menu()

   
    # Solicitar la opción al usuario
    archivo = input("Introduzca el nombre del fichero: ")
    acepto = archivo.endswith(".yaml")

    # Procesar la opción seleccionada
    if not acepto:
        print("El nombre dado no termina en '.yaml'. Por lo tanto el nombre del fichero donde se guardan los resultados será 'archivo.yaml'")
        archivo = "archivo.yaml"
    else:
        print("\tNombre aceptado")

    BS = BeaSoup()
    Sen = Selen("firefox")  # Cuando este la eleccion de navegador esto hay que cambiar
    
    if opc == 1:
        contexto = context(BS)
        print("\t\tObteniendo información con Beautiful Soup ...")

    else:
        contexto = context(Sen)
        print("\t\tObteniendo información con Selenium ...")
    
    contexto.ejecutar(url, num_pag)

    print("\t\tGuardando la información...")
    contexto.guardar(archivo)

if __name__ == "__main__":
    main()