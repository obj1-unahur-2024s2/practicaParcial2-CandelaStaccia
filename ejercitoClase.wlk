class Ejercito {
    const property personajes = []

    method potencialTotal() = personajes.sum({p => p.poderOfensivo()}) 

    method invadir(unaLocalidad) {
        if(self.puedeTomarLocalidad(unaLocalidad)) {
            unaLocalidad.serOcupada(self)
        }

    }

    method puedeTomarLocalidad(unaLocalidad) = self.potencialTotal() > unaLocalidad.potencialDefensivo()

    method nuevoEjercitoFuerte(unaCantidad) {
        const nuevoEjercito = personajes.sortBy({p1, p2 => p1.poderOfensivo() > p2.poderOfensivo()}).take(unaCantidad)
        personajes.removeAll(nuevoEjercito) //los saca de la lista original
        return new Ejercito(personajes = nuevoEjercito)  
    } //ordena la lista de acuerdo a los potenciales ofensivos (mayor a menor)
    //toma dos y los compara: el primero con el 2do. Produce un efecto en la lista, la modifica
}