#ifndef FILTROCONTRACARAC
#define FILTROCONTRACARAC

#include "Filter.h"

//Tendra que tener un mínimo de 8 caracteres para que de la contraseña como correcta
class FiltroContraCarac : public Filter{

    public:

    bool comprueba(string texto);

};

#endif