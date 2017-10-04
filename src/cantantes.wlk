import Canciones.*
import guitarras.*
import albums.*
import presentaciones.*

class Musico {
	var banda
	var habilidadBase
	var albums = [ ]
	var precioBase = 0
	
	constructor(unaBanda, unaHabilidad, unosAlbums) {
		banda = unaBanda habilidadBase = unaHabilidad albums = unosAlbums
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
	
	method listaDeLetras() =
	self.listaDeCanciones().map({ cancion => cancion.letra() })
	method listaDeCanciones() = self.albums().map({ album => album.canciones()
	}).flatten()

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
	
	method duracionDeLaObra() = self.listaDeCanciones().sum({ cancion =>
	cancion.duracion() })
	
	method laPego() = self.albums().all({ album => album.seVendioBien() })
	
	method interpretaBien(unaCancion)=self.listaDeCanciones().contains(unaCancion) || self.interpretaBienSegunSuTipo(unaCancion) || self.habilidad()>60	
	method interpretaBienSegunSuTipo(unaCancion)
	method musicoConHabilidadMayorA70()=self.habilidad()>70
	method compusoPorLoMenosUna()=self.listaDeCanciones().size()>0
	method interpretaBienAliciaEnElPais()=self.interpretaBien(aliciaEnElPais)
	method cumpleLosRequisitosPdpalooza()=self.musicoConHabilidadMayorA70()&& self.compusoPorLoMenosUna() && self.interpretaBienAliciaEnElPais()
}

class DeGrupo inherits Musico {
	var plusDeHabilidad

	constructor(unaBanda, unaHabilidad, unosAlbums, unPlusDeHabilidad) =
	super ( unaBanda , unaHabilidad , unosAlbums ) {
		precioBase = 50 
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
	
	constructor(unaBanda, unaHabilidad, unosAlbums,unaPalabraElegida)=super(unaBanda, unaHabilidad, unosAlbums){
		palabraElegida=unaPalabraElegida
		precioBase=400
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
		return self.convertirEnMinusculas(unaCancion).contains(palabraElegida)
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

object luisAlberto inherits Musico ( solista , 8 , [
paraLosArboles, justCrisantemo ] ) {
	var guitarra = fender
	

	method tocarCon(unaGuitarra) {
		guitarra = unaGuitarra
	}

	override method habilidadEnGrupo() {
		return 0
	}
	override method habilidad() {
		return (super()*self.habilidadDeLaGuitarra()).min(100)
	}

	method habilidadDeLaGuitarra() {
		return guitarra.precio()
	}

	override method interpretaBienSegunSuTipo(unaCancion) {
		return true
	}

	override method precioBase() = 1000

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

 