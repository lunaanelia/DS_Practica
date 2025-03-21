from Strategy import *
import yaml 


class context:
    def __init__(self, estrategia:Strategy):
        self.estrategia = estrategia
        self.datos = []

    def ejecutar(self, nombre, num):
        self.datos = self.estrategia.extraer_datos(nombre, num)

    def guardar(self, nombre):
        yaml_data = {
            'Autores': []
        }

        # Llenamos la estructura de 'Autores' con los datos
        for autor in self.datos:
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
#     BS = BeaSoup()
#     Sen = Selen()

    
#     contexto = context(Sen)
#     contexto.ejecutar("archivo.yaml", 2)

# if __name__ == "__main__":
#     main()