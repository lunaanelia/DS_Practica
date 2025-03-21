# Hemos tenido que descargar: (probarlo creo qu eno es necesario)
#       pip install selenium
from Strategy import *
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.keys import Keys
import time
# from selenium.webdriver.firefox.options import Options

# Agrupar citas y etiquetas por autor
from collections import defaultdict


import yaml 

class Selen(Strategy):
    def extraer_datos(self, nombre, num):
        # options = Options()
        # options.headless = True  # Activar el modo headless NO abra ventana
        
        datos = []

        service = FirefoxService(executable_path = "/snap/bin/geckodriver")
        driver = webdriver.Firefox(service=service)
        driver.get("https://quotes.toscrape.com/")
        
        # Aquí puedes hacer cualquier interacción con la página
        
        page_number = 2

        for pag in range(num):
            citas = driver.find_elements(By.CLASS_NAME, "quote")

            # Recorrer todas las citas y mostrar el texto
            for cita in citas:
                autor = cita.find_element(By.CLASS_NAME, "author").text
                texto_cita = cita.find_element(By.CLASS_NAME, "text").text
                etiquetas = cita.find_elements(By.CLASS_NAME, "tag")
                
                enlacesTexto = [etiqueta.text for etiqueta in etiquetas]
                
                # for etiqueta in etiquetas:
                #     enlacesTexto.append(etiqueta.text)
                # etiquetas_texto = [etiqueta.text for etiqueta in etiquetas]

                # Verificamos si el autor ya está en la lista de datos
                autor_existente = next((item for item in datos if item['autor'] == autor), None)

                if autor_existente:
                   # Si el autor ya está, simplemente añadimos la nueva cita a su lista de citas
                    autor_existente['citas'].append({
                        'cita': texto_cita,
                        'etiquetas': enlacesTexto
                    })
                else:
                    # Si el autor no existe, lo agregamos con su primera cita
                    datos.append({
                        'autor': autor,
                        'citas': [{
                            'cita': texto_cita,
                            'etiquetas': enlacesTexto
                        }]
                    })   

                # datos.append({
                #     'autor': autor,
                #     'cita': texto_cita,
                #     'etiquetas': enlacesTexto
                # })

                # with open("archivo.txt", 'a') as archivo:
                #     archivo.write(f"Autor: {autor}")
                #     archivo.write(f"Cita: {texto_cita}")
                #     archivo.write(f"Etiquetas: {', '.join(etiquetas_texto)}\n\n")

            # Buscar el enlace con el número de la página
            try:
                boton = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, "//a[contains(text(), 'Next')]")) # Busca un en lace (a) que contenga el tecto Next
                )
                boton.click()  # Hacer clic en el enlace
                time.sleep(3)  # Esperar a que cargue la página
            except Exception as e:
                print(f"No se pudo encontrar el enlace para la página {page_number}")  
        
        driver.quit()

        # ordenar por nombre de autor. El autor no sale repetido. LUego de su nombre salen las citas y luego de cada citas sus etiquetas
        agrupados = defaultdict(list)

        # for entrada in datos:
        #     autor = entrada['autor']
        #     agrupados[autor].append({
        #         'cita': entrada['cita'],
        #         'etiquetas': entrada['etiquetas']
        #     })

        # resultados = []
        # # Reorganizar los datos por autor y sus citas con etiquetas
        # for autor, citas in agrupados.items():
        #     resultado_autor = {'nombre': autor, 'citas': []}
            
        #     # Añadir las citas y etiquetas de cada autor
        #     for cita_info in citas:
        #         cita_con_etiquetas = {
        #             'Cita': cita_info['cita'],
        #             'Etiquetas': cita_info['etiquetas']
        #         }
        #         resultado_autor['citas'].append(cita_con_etiquetas)
            
        #     # Añadir el autor con sus citas y etiquetas a la lista de resultados
        #     resultados.append(resultado_autor)

        # # Ordenar por autor
        # resultados.sort(key=lambda x: x['nombre'])
        
        # # datos = sorted(datos, key=lambda x: x['autor'])
        # # Mostrar los resultados
        # pepe = {
        #     'Autores': resultados
        # }

        # Estructura para el archivo YAML
        yaml_data = {
            'Autores': []
        }

        # Llenamos la estructura de 'Autores' con los datos
        for autor in datos:
            autor_data = {
                'autor': autor['autor'],
                'citas': []
            }
            for cita in autor['citas']:
                autor_data['citas'].append({
                    'cita': cita['cita'],
                    'etiquetas': cita['etiquetas']
                })
            yaml_data['Autores'].append(autor_data)


        with open(nombre, 'w') as archivo:
             yaml.dump(yaml_data, archivo, default_flow_style=False,  allow_unicode=True)

        


# def main():
#     Selen().extraer_datos("archivo.yaml", 5)

# if __name__ == "__main__":
#     main()        
