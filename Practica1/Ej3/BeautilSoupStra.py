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

class BeaSoup(Strategy):
    def __init__(self, url):
        self.url  = url
    
    def solicitudYCreacion(self):
        self.response = requests.get(self.url)
        if self.response.status_code == 200:
            self.soup = BeautifulSoup(self.response.text, 'html.parse')
            print(self.soup.prettify())

    def buscar (self)
        titulo = self.soup.title # titulo de la pagina
        h1 = self.soup.find('h1') # busca el primer h1 de la pagina
        enlaces = self.soup.find_all('a') # Encuetra todos los enlaces
        enlaces.get('href') # Obtiene el valor del atributo href 
        elemetoClase = self.soup.find(class_ = 'miclase') # busca le primer elemeto de la clase epecifica
        dievespe = self.soup.find('div', class_ = 'miclase') # busca le primer elemeto del contenedor div de la clase epecifica
        enlacesdiv = self.soup.find_all('a') # busca los enlaces dentro del div especifico
    def extraerInformacion(self):
        #....

# requests.get(url) Obtiene el contenido de la url especificada --> response
# BeautifulSoup(response.text, 'html.parse') --> Analiza el contenido html con el analizador 
# soup.prettify() --> Muestra HTML de forma ordenad y legible

# Errores comunes
# 