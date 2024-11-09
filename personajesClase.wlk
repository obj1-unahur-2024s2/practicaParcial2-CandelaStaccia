class Personaje {
    const property fuerza
    const property inteligencia
    var rol

    method cambiarDeRol(unRol) {
        rol = unRol
    } //podria ser var property

    method rol() = rol

    method poderOfensivo() = fuerza * 10 + rol.extra()
    
    method esGroso() = self.esInteligente() || self.esGrosoEnSuRol()

    method esInteligente()
    method esGrosoEnSuRol() = rol.esGroso(self)
}


class Orco inherits Personaje {
    override method poderOfensivo() = super() * 1.1 //10% mas, 10% menos es 0.1; despues del punto es lo q se quiere aumentar/disminuir

    override method esInteligente() = false
}


class Humano inherits Personaje {
    override method esInteligente() = inteligencia > 50
}


class Rol {
    method extra()
    method esGroso(unPersonaje)
} // interfaz pq no tiene atributos //no necesario en parcial


object guerrero inherits Rol {
    override method extra() = 100

    override method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

class Cazador inherits Rol {
    const property mascota //ya domo la mascota, se pasa al instanciar

    override method extra() = mascota.extra()

    override method esGroso(unPersonaje) = mascota.esLongeva() //argumento para respetar el polimorfismo
}

object brujo inherits Rol {
    override method extra() = 0

    override method esGroso(unPersonaje) = true
}


class Mascota {
    const property fuerza
    var edad
    const property tieneGarras

    method edad() = edad
    method aumentarEdad() {
        edad = edad + 1
    }

    method extra() = if(tieneGarras) fuerza * 2 else fuerza

    method esLongeva() = edad > 10
}