#ifndef FILTROCORREO
#define FILTROCORREO

#include "Filter.h"

//Tendra que tener texto antes del @ y continuar con gmail.com o hotmail.com para que lo interprete como correcto
class FiltroCorreo : public Filter{

    private:

    bool Dominio(string cad, string dominio);

    public:

    bool comprueba(string texto);

};

#endif