from BeautilSoupStra import *
from SeleniumStra import *
from Context import *

# Funcion que muestra el menu incial, y da una opcion para eleguir
def menu():
    seguir = True
    while seguir:

        print("Elige un metodo:")
        print("\t1 --> Beautiful Soup")
        print("\t2 --> Selenium")
        
        # Comporbamos qu elo insertado sea valido
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

# Funcion que muestra las opciones de navegador
def navegador():
    seguir = True
    while seguir:
        print("Elige un nevegador:")
        print("\t1 --> Firefox")
        print("\t2 --> Chrome")
        # Comprobamos que sea una de las opciones 
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

    opc = menu()    # Mostramos menus
    
    if opc == 1:    # BeautifulSoup
        BS = BeaSoup()
        contexto = context(BS)
        print("\t\tObteniendo información con Beautiful Soup ...")

    else:       # Selenium
        nav = navegador()   # Mostramos navegador
        Sen = Selen(nav)
        contexto = context(Sen)
        print("\t\tObteniendo información con Selenium ...")
    
    contexto.ejecutar(url, num_pag) # Obtenemos la informacion

    # Solicitar la opción al usuario
    archivo = input("Nombre del fichero (que termine en .yaml, sino se escogera otro nombre): ")
    
    # Comporbamos que el fichero termine en .yaml
    acepto = archivo.endswith(".yaml")

    # Por si el nombre mo es correcto
    if not acepto:
        print("El nombre dado no termina en '.yaml'. Por lo tanto el nombre del fichero donde se guardan los resultados será 'archivo.yaml'")
        archivo = "archivo.yaml"
    else:
        print("\tNombre aceptado")

    print("\t\tGuardando la información...")
    contexto.guardar(archivo)   # Guardamos la información
    print("\t\tInformacion guardada con exito!!")

if __name__ == "__main__":
    main()