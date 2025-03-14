import requests
from bs4 import BeautifulSoup

def main():
    archivo = open('Ejercicio1.yalm', 'w') 
    
    num_pag = 3
    url = 'https://quotes.toscrape.com/'
    url_initial  = url
    for pag in range(num_pag):
        archivo.write(f"--------------Pagina {pag} --------------\n")
        response = requests.get(url)
        
        if response.status_code == 200:
            soup = BeautifulSoup(response.text, 'html.parser')

        archivo.write("Cita:\n")
        cita = soup.find_all(class_='text')    # busca el texto que contiene
        for i in cita:
            archivo.write(f"\t- {i.text}\n")
            #print(f"Citas: {i.text}")

        archivo.write("Autor:\n")
        autor = soup.find_all(class_ = 'author')
        for i in autor:
            archivo.write(f"\t - {i.text}\n")
        #   print(f"Autor: {i.text}")

        divtags = soup.find_all('div', class_='tags')
        for i in divtags:
            enlace = i.find_all('a', class_ = 'tag')

            for j in enlace:
                archivo.write(f"\t- {j.text}\n")
                # print(f"Etiquetas: {j.text}")

        # Vamoa a buscar el boton y que nos de el siguiente enlace
        # Todo esto porque es estatico uy no se mueve en la pagina
        boton_li = soup.find('li', class_='next')
        urlboton = boton_li.find('a')
        url = url_initial + urlboton.get('href')
    
    archivo.close()

if __name__ == "__main__":
    main()

    # requests.get(url) Obtiene el contenido de la url especificada --> response
    # BeautifulSoup(response.text, 'html.parse') --> Analiza el contenido html con el analizador 
    # soup.prettify() --> Muestra HTML de forma ordenad y legible

    # fiechero yalm debe ser :
    #  Autor:
    #   nombre del autor
    # Cita:
    #   cita de texto:
# Tags:
#   - etiqueta1
#   - etiqueta2
#   - ...                       Se pone conguiones para indicar lista

# Usando el contexto 'with' para abrir el archivo
# with open('archivo.txt', 'w') as archivo:
#     # Escribir varias líneas en el archivo
#     archivo.write("Este es un ejemplo largo\n")
#     archivo.write("Primera línea de contenido\n")
#     archivo.write("Segunda línea de contenido\n")
#     archivo.write("Tercera línea de contenido\n")

# No es necesario cerrar el archivo explícitamente; Python lo hace automáticamente.

# Abrir archivo en modo escritura
# archivo = open('archivo.txt', 'w')

# # Escribir contenido en el archivo
# archivo.write("Este es un ejemplo largo\n")
# archivo.write("Primera línea de contenido\n")
# archivo.write("Segunda línea de contenido\n")
# archivo.write("Tercera línea de contenido\n")

# # Cerrar el archivo manualmente
# archivo.close()

# En las opciones a es para que añada por donde vaya
# si borrar lo que tiene el fichero y w sobreescribe