# Hemos tenido que descargar:
#       pip install beautifulsoup4
#       pip install requests


from Strategy import *
# Para poder usar el BeautifulSoup
import requests
from bs4 import BeautifulSoup

class BeaSoup(Strategy):
    
    # num = numero de paginas a leer
    # url = url de inicio
    def extraer_datos(self, url, num):
      
        datos = []
        url_m = url

        for pag in range(num):
            response = requests.get(url_m)  # Solicitud para obtener los datos

            if response.status_code == 200: # Vemos si no ha habido algun problema
                
                # Para poder manipualr los elementos de las pagina wed
                soup = BeautifulSoup(response.text,  'html.parser') # 'html.parser' es el analizador nativo de pyton para HTML
                
                # Buscamos todas las citas. Estan en los div con clase quote
                citas = soup.find_all('div', class_='quote')
                
                # Iteramos sobre cada cita para obtener el autor, la cita y las etiquetas
                for cita in citas:
                    autor = cita.find('small', class_='author').text
                    texto_cita = cita.find('span', class_='text').text
                    etiquetas = cita.find_all('a', class_='tag')

                    # Extraemos las etiquetas
                    etiquetas_texto = [etiqueta.text for etiqueta in etiquetas]

                    # Buscamos si ya ha aparecido el autor, si no encunetra nada devuleve None
                    autor_existente = next((a for a in datos if a['autor'] == autor), None)
                    
                    # Si el autor ya existe, agregamos la cita
                    if autor_existente:
                        autor_existente['citas'].append({
                            'cita': texto_cita,
                            'etiquetas': etiquetas_texto
                        })
                    else:
                        # Si el autor no existe, lo agregamos a la lista
                        datos.append({
                            'autor': autor,
                            'citas': [{
                                'cita': texto_cita,
                                'etiquetas': etiquetas_texto
                            }]
                        })
                    
                # Buscamos el siguiente enlace 
                boton = soup.find('li', class_='next')
                urlboton = boton.find('a')
                url_m = url + urlboton.get('href')

        return datos