# Hemos tenido que descargar:
#       pip install beautifulsoup4
#       pip instal requests
#
# No poner url dentro
from Strategy import *
import requests
from bs4 import BeautifulSoup
import yaml             # para escribir en formato yaml

class BeaSoup(Strategy):
                   
    def extraer_datos(self, nombre, num):
        
        datos = []
        #Realizar la peticion HTTP
        #Realizar extraccion
        url = 'https://quotes.toscrape.com/'
        inicial ='https://quotes.toscrape.com/'

        for pag in range(num):
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

                datos.append({
                    'autor': autor.text,
                    'cita' : cita.text,
                    'etiquetas': enlacesTexto
                })
            
            boton = soup.find('li', class_='next')
            urlboton = boton.find('a')
            url = inicial + urlboton.get('href')

        citasTexto = {
            'Citas': datos
        }
       
        with open(nombre, 'w') as archivo:
            yaml.dump(citasTexto, archivo, default_flow_style=False,  allow_unicode=True)

# def main():
#     BeaSoup().extraer_datos("archivo.yaml", 5)

# if __name__ == "__main__":
#     main()        

