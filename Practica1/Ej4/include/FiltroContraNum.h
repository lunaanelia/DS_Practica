#ifndef FILTROCONTRANUM
#define FILTROCONTRANUM

#include "Filter.h"
using namespace std;

//Tendra que tener al menos un caracter numérico para que de la contraseña como correcta
class FiltroContraNum : public Filter{

    public:

    bool comprueba(string texto);

};

#endif