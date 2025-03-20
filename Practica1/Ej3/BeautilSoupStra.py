# Hemos tenido que descargar
#       pip install beautifulsoup4
#       pip instal requests

# numero de paginas a leer 5.
# lo ideal es paraslas con click no con 5 url diferentes
# tenemos que obtener texto de la cita, autor, etiquetas asociadas
# Primera vista:
#   texto de la cita --> span class = "text"
#   Autoe --> span   small class="author"
#   etiquetas --> div class = tags
#                       a class = tag
# en eñl ultimo de etiquetas hay unas al lado que en el enlace tien ela msima clase
# que son:          span clas tag_item
#                       a class tag

import Strategy
import requests
from bs4 import BeautifulSoup
import yaml

class BeaSoup():
    def __init__(self, nombre, num):
        self.nombre = nombre
        self.num = num
        self.c_datos = []
        self.a_datos = []
        self.e_datos = []
        self.datos = []

    def poner(self):
        # odenar primero por autor, luego poner etiqutas y luega tags
        # como ordenar --> por autor, por cita, por etiquesas, separados,...
        # self.a_datos.sort()
        # self.c_datos.sort()
        # self.e_datos.sort()
        
        citas = {
            'Citas': self.datos
        }
        pepe = yaml.dump(citas, default_flow_style=False,  allow_unicode=True)
        # pepe = pepe.replace('- ', '    - ') 
        # pepe = pepe.replace("    - autor", "  - autor")
        # pepe = pepe.replace("      cita", "    cita")
        # pepe = pepe.replace("      etiqueta", "    etiquetas")
        with open(self.nombre, 'w') as archivo:
            archivo.write(pepe)
            # for i in range(len(self.datos)):
        #    pepe = yaml.dump(citas, archivo, default_flow_style=False, indent=4, allow_unicode=True)
                # archivo.write(f'\t- autor: "{self.a_datos[i]}"\n')
                # archivo.write(f'\t  cita: "{self.c_datos[i]}"\n')
                # archivo.write(f"\t  etiquetas:\n")
                # for j in range(len(self.e_datos[i])):
                #     archivo.write(f'\t\t- "{self.e_datos[i][j]}"\n')   

            # for autor in self.a_datos:
            #     archivo.write(f"\t - {autor}\n")
                
            
            # archivo.write("Citas:\n")
            # for cita in self.c_datos:
            #     archivo.write(f"\t - {cita}\n")
            
            # archivo.write("Error:\n")
            # for error in self.e_datos:
            #     archivo.write(f"\t - {error}\n")
                    
    def extraer_datos(self):
        #Realizar la peticion HTTP
        #Realizar extraccion
        url = 'https://quotes.toscrape.com/'
        inicial ='https://quotes.toscrape.com/'
        # archivo = open(self.nombre, 'w')

        for pag in range(self.num):
            response = requests.get(url)

            if response.status_code == 200:
                soup = BeautifulSoup(response.text,  'html.parser')
            
            citas = soup.find_all(class_='text')     #busca el texto que contiene
            autores = soup.find_all(class_='author')
            
            divstags = soup.find_all('div', class_='tags')
           
            for divtag, cita, autor in zip(divstags, citas, autores) :
                enlaces = divtag.find_all('a', class_ = 'tag')            

                enlacesTexto = []
                for enlace in enlaces:
                    enlacesTexto.append(enlace.text)

                self.datos.append({
                    'autor': autor.text,
                    'cita' : cita.text,
                    'etiquetas': enlacesTexto
                })

                # self.e_datos.append(enlacesTexto)                

            # for cita in citas:
            #     self.c_datos.append(cita.text)
            

            # for autor in autores:
            #     self.a_datos.append(autor.text)
            
            boton = soup.find('li', class_='next')
            urlboton = boton.find('a')
            url = inicial + urlboton.get('href')

        self.poner()

def main():
    tre = BeaSoup("archivo.yaml", 1)
    tre.extraer_datos()

if __name__ == "__main__":
    main()        

