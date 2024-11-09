class Ejercito {
    const property integrantes = []

    method invadir(unaLocalidad) {
        if(self.potencialOfensivoTotal() > unaLocalidad.potencialOfensivoTotal())
            unaLocalidad.ocupar(self)
    }

    method potencialOfensivoTotal() = integrantes.sum({i => i.potencialOfensivo()})

    method nuevoEjercito(cantidad) {
        return 
        new Ejercito(integrantes = integrantes.sortedBy({a,b => a.potencialOfensivo()>b.potencialOfensivo()}).take(cantidad))
    }

    method cantidadIntegrantes() = integrantes.size()
}



class Localidad {
    var property ocupante
    const property potencialOfensivoTotal = ocupante.potencialOfensivoTotal() 
    
    method ocupar(ejercito) {
        if(self.esGrande(ejercito))
            ocupante = ejercito.nuevoEjercito(10)
        else
            ocupante = ejercito //para mi no tiene sentido
    }

    method esGrande(ejercito)
}


class Aldea inherits Localidad {
    const tamanio = 3

    method habitantesMax() = tamanio //?

    override method esGrande(ejercito) = ejercito.cantidadIntegrantes() > tamanio
}


class Ciudad inherits Localidad {
    //const habitantes = 500

    override method esGrande(ejercito) = false

    override method potencialOfensivoTotal() = super() + 300
}