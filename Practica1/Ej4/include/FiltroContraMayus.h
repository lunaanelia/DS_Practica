#ifndef FILTROCONTRAMAYUS
#define FILTROCONTRAMAYUS

#include "Filter.h"

//Tendra que tener al menos una mayúscula para que de la contraseña como correcta
class FiltroContraMayus : public Filter{

    public:

    bool comprueba(string texto);

};

#endif