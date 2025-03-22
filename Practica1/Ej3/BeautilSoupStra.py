# Hemos tenido que descargar:
#       pip install beautifulsoup4
#       pip install requests
#
# No poner url dentro
from Strategy import *
import requests
from bs4 import BeautifulSoup

class BeaSoup(Strategy):
                   
    def extraer_datos(self, url, num):
        
        datos = []
        url_m = url

        for pag in range(num):
            response = requests.get(url_m)

            if response.status_code == 200:
                soup = BeautifulSoup(response.text,  'html.parser')
                
                # Buscamos todas las citas
                citas = soup.find_all('div', class_='quote')
                
                # Iteramos sobre cada cita para obtener el autor, la cita y las etiquetas
                for cita in citas:
                    autor = cita.find('small', class_='author').text
                    texto_cita = cita.find('span', class_='text').text
                    etiquetas = cita.find_all('a', class_='tag')

                    # Extraemos las etiquetas
                    etiquetas_texto = [etiqueta.text for etiqueta in etiquetas]

                    # Buscamos si ya tenemos el autor en nuestra lista
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