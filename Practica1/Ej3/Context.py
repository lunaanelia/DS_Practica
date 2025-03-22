from Strategy import *
import yaml     # Para convertir  objetos de python a formato yaml

class context:
    def __init__(self, estrategia:Strategy):
        self.estrategia = estrategia
        self.datos = []

    # Ejecuta la extrategia
    def ejecutar(self, nombre, num):
        self.datos = self.estrategia.extraer_datos(nombre, num)

    # Guarda los datos en el archivo nombre
    def guardar(self, nombre):
        
        # Creamos un nuevo diccionario
        yaml_data = {
            'Autores': []
        }

        # Llenamos la estructura de 'Autores' con los datos de datos
        for autor in self.datos:
            # Cremos estructura del autor
            autor_data = {
                'autor': autor['autor'],
                'citas': []
            }
            # Agregamos las citas del autro con sus etiquetas
            for cita in autor['citas']:
                autor_data['citas'].append({
                    'cita': cita['cita'],
                    'etiquetas': cita['etiquetas']
                })
            # Agregamos al autor a la yaml_data
            yaml_data['Autores'].append(autor_data)

        # Una vez que la estructura es la que queremos 
        # abrimos el fichero nombre, en el caso de que exista se sobreescribe
        # en el caso de que no exista lo crea
    
        with open(nombre, 'w') as archivo:
            yaml.dump(yaml_data, archivo, default_flow_style=False,  allow_unicode=True)
            # Con la funcion yaml.dump convertimos el diccionario de yaml_data a un fichero .yaml
            # y las guardamos en archivo. Para que no sea solo una sola line ponemos el default_flow_style a false
            # para quenos lso caracteres salgan legibles y no no en codigo ponemos allow_unicode = true