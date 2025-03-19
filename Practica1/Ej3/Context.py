import Strategy

class context:
    def __init__(self, estrategia:Strategy):
        self.estrategia = estrategia

    def ejecutar(self, nombre, num):
        return self.estrategia.extraerInformacio(nombre, num)
    


if __name__ == "__main__":
    main()