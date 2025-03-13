#Ej 3
print("hola")
x = 5 #Esto es un int
y = 4.09 #esto es un float
z = "CADENA DE CARACTERES"
condicion = True # Boolean

if  condicion :
     print("hola")
else :
     print("hola")

for i in range(5):
     x = x + 1

while condicion :
     print("hola")

def Funcion (arg):
     print(f"hola {arg}")

numeros = [0, 1, 3, 5, 7, 8]
numeros.append(10)  #añade

class nombreClasePadre:
     def __init__(self, arg1, arg2):
          self.arg1 = arg1
          self.arg2 = arg2
     
     def metodo():
        print("hola")
     def __str__(self):
          return f"estoe s lo que salfar"
# si ahces print(obj) sale lo de str
    
class Hijo:
     def __init__(self, atr1, atr2, atr3):
          super().__init__(atr1, atr2)
          self.atr3 = atr3

#Para las clase abastractas-.
# from abc import ABC, abstractmethod
# class nombre(ABC)
#    @abstracmethod     # metodo abstracto no se implemnta
#       def metodoAbstracto(atr)
#           pass
#
# Las interfaces se hacen como metodos abstractos
# para importar un archivo --> archivo.py

# Manejo de archivos --> Lectura y escritura

with open("archivo.txt" "w") as archivo:
     archivo.write("hola que tal\n")
     archivo.write("bien y tu?")

with open("archivo.txt" "r") as archivo:
     contenido = archivo.read()
     print(contenido)

# los fichero creo que h ya que cerralor



# Manejo de excepciones
try:                                    # bloque de codigo donde se puede generar una excepcion
     numero = int(input("introduce un numero"))
     resultado = 10/numero
except ZeroDivisionError:               # Bloque que se genera si se da una excepcion
     print("Error")
except ValueError:
     print("error ingrese otro")

# else                                  # bloque que se da si no se genra ninguna excepcion de codigo
# finally                               # bloque de codigoque siempre se ejecuta sin importar si tuvo o no una excepcion

# Execpiones FileNotFoundError --> fichero no encotrado
#            ZeroDivisionError --> No se puede dividir por cerror
#            ValueError --> Lo insertado no es un numero
#            IndexError --> ccuando intentas acceder a un índice fuera de los límites de una lista.
#            TypeError --> Ocurre cuando se aplica una operación a un tipo de dato inapropiado

try:
    # Intentamos abrir un archivo y leerlo
    archivo = open("mi_archivo.txt", "r")
    contenido = archivo.read()
except FileNotFoundError:
    # Si el archivo no se encuentra, mostramos un error
    print("El archivo no se encuentra.")
else:
    # Si todo va bien, mostramos el contenido del archivo
    print(contenido)
finally:
    # Este bloque siempre se ejecuta, independientemente de si hubo un error o no
    print("Operación de lectura de archivo completada.")
    if 'archivo' in locals():
        archivo.close()  # Cerrar el archivo si fue abierto



# Fundacion lambda funciones anonimas
# Sirve para pequeñas funciones con argumentos a otras ejemplo map(),filter() o sorted()
suma = lambda x, y : x + y
print (suma(5, 3))

# DECORADOR --> Funciones qyue cambian el comportamiento de otras funciones sin cambiar el codigo original
def decorador (func):
     def wrapper():
          print("algo")
          func()
          print("algo mas")
    return wrapper

@decorador
def metodo()
     
#Generador yield --> iterar secuencia sin taer de memoria
 # Bivliotecas
 # pip install beautifulSoup4
 from bs4 import BeautifulSoup
 import request
 # Realizar una solicitud HTTP
 url = 'https://ejemplo.com' 
 reponse = request.get(url)

 #parsear respuesta 
 soup = BeautifulSoup(reponse.text, 'html.parser')

 # Extraer titulo
 print(soup.tittle.string)

 # pip install selenium
 from selenium import webdriver
 #Abrir navegador y carga pagina
 driver = webdriver.Chrome()
 driver.get('url')
 print(drive.tittle)
 driver.quit