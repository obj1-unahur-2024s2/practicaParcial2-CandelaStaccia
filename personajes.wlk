class Personaje {
  const property fuerza
  const property inteligencia = 100
  var property rol

  method potencialOfensivo() = fuerza * 10 + rol.extra()

  method esGroso() = self.esInteligente() || rol.esGroso(self)

  method esInteligente()
}


class Orco inherits Personaje(inteligencia = 0) {
  override method potencialOfensivo() = super() * 1.1

  override method esInteligente() = false
}


class Humano inherits Personaje {
  override method esInteligente() = inteligencia > 50
}



object guerrero {
  const property extra = 100 
  method esGroso(unPersonaje) = unPersonaje.fuerza() > 50 
}

class Cazador {
  const mascota
  method extra() = mascota.potencialOfensivo()
  method esGroso(unPersonaje) = mascota.esLongeva()
}

object brujo {
  const property extra = 0 
  method esGroso(unPersonaje) = true
}

class Mascota {
  const property fuerza
  var edad
  var property tieneGarras = true

  method potencialOfensivo() {
    return if(tieneGarras) fuerza * 2 else fuerza
  }

  method esLongeva() = edad > 10

  method cumplirAnios() {
    edad = edad + 1
  } 
}