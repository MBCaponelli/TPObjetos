import Canciones.*
import guitarras.*
import albums.*
import presentaciones.*

class Musico {
	var banda
	var habilidadBase
	var albums = [ ]
	var precioBase = 0
	
	constructor(unaBanda, unaHabilidad, unosAlbums, unPrecioBase) {
		banda = unaBanda habilidadBase = unaHabilidad albums = unosAlbums precioBase=unPrecioBase
	}

	method cobrar(unaPresentacion) {
		return self.precioBase() + self.precioEspecial(unaPresentacion)
	}

	method precioBase() = precioBase
	
	method precioEspecial(unaPresentacion)
	
	method habilidadBase() = habilidadBase
	method habilidadBase(nuevaHabilidadBase){
		habilidadBase=nuevaHabilidadBase
	}

	method albums() = albums

	method estaEnGrupo() {
		return banda.sosGrupo()
	}

	method habilidad() {
		return self.habilidadBase() + self.habilidadEnGrupo()
	}

	method habilidadEnGrupo()
	
	

	method dejaElGrupo() {
		self.banda(solista)
	}

	method duracionDeObra(){
		return self.albums().sum({album=>album.duracionDeAlbum()})
		
		}
	method banda(nuevaBanda) {
		banda = nuevaBanda
	}
	method esMinimalista() {
		return self.albums().all({ album =>album.todasLasCancionesCortas()})	
	}
	
	method tieneLaPalabra(unaPalabra){
		return self.albums().map({album => album.cancionesQueContienen(unaPalabra)}).flatten()
	}
	
	
	method laPego() = self.albums().all({ album => album.seVendioBien() })
	
	method interpretaBien(unaCancion) {
		return self.esAutorDe(unaCancion) || self.interpretaBienSegunSuTipo(unaCancion) || self.habilidad()>60
		}	
	
	method esAutorDe(unaCancion){
		return self.albums().any({album => album.contieneAUnaCancion(unaCancion)})
	}
	
	method interpretaBienSegunSuTipo(unaCancion)
	
}

class DeGrupo inherits Musico {
	var plusDeHabilidad

	constructor(unaBanda, unaHabilidad, unosAlbums,unPrecioBase, unPlusDeHabilidad) =
	super ( unaBanda , unaHabilidad , unosAlbums,unPrecioBase ) { 
		plusDeHabilidad = unPlusDeHabilidad
	}

	override method precioBase() = precioBase

	method plusdehabilidad(nuevoPlusDeHabilidad) {
		plusDeHabilidad = nuevoPlusDeHabilidad
	}

	override method habilidadEnGrupo() {
		if (self.estaEnGrupo()) {
			return plusDeHabilidad
		} else {
			return 0
		}
	}

	override method interpretaBienSegunSuTipo(unaCancion) {
		return unaCancion.duracion() > 300
	}

	override method precioEspecial(unaPresentacion) {
		if (self.estaEnGrupo()) {
			return 0
		} else {
			return 50
		}
	}
}

class VocalistaPopular inherits Musico {
	var palabraElegida
	
	constructor(unaBanda, unaHabilidad, unosAlbums,unPrecioBase,unaPalabraElegida)=super(unaBanda, unaHabilidad, unosAlbums,unPrecioBase){
		palabraElegida=unaPalabraElegida
	}
	
	method palabraElejida() = palabraElegida
	method palabraElejida(nuevaPalabraElegida) {
		palabraElegida = nuevaPalabraElegida
	}

	override method precioBase() = precioBase

	override method habilidadEnGrupo() {
		if (self.estaEnGrupo()) {
			return - 20
		} else {
			return 0
		}
	}

	override method interpretaBienSegunSuTipo(unaCancion) {
		return unaCancion.contieneUnaPalabra(palabraElegida)
	}

	

	override method precioEspecial(unaPresentacion) {
		if (unaPresentacion.esConcurrida()) {
			return 100
		} else {
			return 0
		}
	}
}

object luisAlberto inherits Musico ( solista , 8 , [
paraLosArboles, justCrisantemo ],1000 ) {
	var guitarra = fender
	

	method tocarCon(unaGuitarra) {
		guitarra = unaGuitarra
	}

	override method habilidad() {
		return (super()*self.habilidadDeLaGuitarra()).min(100)
	}

	override method habilidadEnGrupo() {return 0}
	method habilidadDeLaGuitarra() {
		return guitarra.precio()
	}

	override method interpretaBienSegunSuTipo(unaCancion) {
		return true
	}

   
	override method precioEspecial(unaPresentacion) {
		if (unaPresentacion.fechaAnteriorASeptiembre()) {
			return 0
		} else {
			return 200
		}
	}
	
}

object bandaX{
	method sosGrupo(){
		return true
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

 