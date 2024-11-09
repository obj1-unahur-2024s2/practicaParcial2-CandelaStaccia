import ejercitoClase.*
import personajesClase.*

class Localidad {
    var ejercito //el que la ocupa

    method potencialDefensivo() = ejercito.potencialTotal()

    method serOcupada(unEjercito)
}


class Aldea inherits Localidad {
    const property cantMaximaHabitantes

    override method serOcupada(unEjercito) {
        if(unEjercito.size() > cantMaximaHabitantes) {
            ejercito = unEjercito.nuevoEjercitoFuerte(10) //si hay menos de 10 no pasa nada
        }
    }
}


class Ciudad inherits Localidad {
    override method potencialDefensivo() = super() + 300

    override method serOcupada(unEjercito) {
        ejercito = unEjercito
    }
}

//falta test