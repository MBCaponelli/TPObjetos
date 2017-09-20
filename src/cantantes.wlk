import Canciones.*
import guitarras.*

class Musico {
	var banda
	var habilidadBase
	var precioBase

	constructor(unaBanda, unaHabilidad, unPrecioBase) {
		banda = unaBanda habilidadBase = unaHabilidad precioBase = unPrecioBase
	}

	method habilidadBase() = habilidadBase

	method estaEnGrupo() {
		return banda.sosGrupo()
	}

	method habilidad() {
		return self.habilidadBase() + self.habilidadEnGrupo()
	}

	method habilidadEnGrupo() method cobrar(unaPresentacion) {
		return self.precioBase() + self.precioEspecial(unaPresentacion)
	}

	method precioBase() = precioBase

	method precioEspecial(unaPresentacion) method dejaElGrupo() {
		self.banda(solista)
	}

	method banda(nuevaBanda) {
		banda = nuevaBanda
	}
}

object joaquin inherits Musico ( pimpinela , 20 , 100 ) {

	override method habilidadEnGrupo() {
		if (self.estaEnGrupo()) {
			return 5
		} else {
			return 0
		}
	}

	method interpretaBien(unaCancion) {
		return unaCancion.duracion() > 300
	}

	override method precioEspecial(unaPresentacion) {
		if (self.estaEnGrupo()) {
			return - 50
		} else {
			return 0
		}
	}
}

object lucia inherits Musico ( pimpinela , 70 , 400 ) {

	override method habilidadEnGrupo() {
		if (self.estaEnGrupo()) {
			return - 20
		} else {
			return 0
		}
	}

	method interpretaBien(unaCancion) {
		return self.convertirEnMinusculas(unaCancion).contains("familia")
	}


	method convertirEnMinusculas(unaCancion) {
		return unaCancion.letra().toLowerCase()
		}
	

	override method precioEspecial(unaPresentacion) {
		if (unaPresentacion.esConcurrida()) {
			return 100
		} else {
			return 0
		}
	}
}

object luisAlberto {
	var guitarra = fender

	method tocarCon(unaGuitarra) {
		guitarra = unaGuitarra
	}

	method habilidad() {
		return self.habilidadDeLaGuitarra().min(100)
	}

	method habilidadDeLaGuitarra() {
		return 8 * guitarra.precio()
	}

	method interpretaBien(unaCancion) {
		return true
	}

	method cobrar(unaPresentacion) {
		if (unaPresentacion.fechaAnteriorASeptiembre()) {
			return 1000
		} else {
			return 1200
		}
	}
}

object pimpinela {
	method sosGrupo() {
		return true
	}
}

object solista {
	method sosGrupo() {
		return false
	}
}

 