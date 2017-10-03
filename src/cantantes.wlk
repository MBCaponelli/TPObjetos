import Canciones.*
import guitarras.*
import albums.*

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
	
	method habilidadBase(nuevaHabilidad){
		habilidadBase = nuevaHabilidad
	}

	method precioBase() = precioBase

	method precioEspecial(unaPresentacion) method habilidadBase() = habilidadBase

	method albums() = albums

	method estaEnGrupo() {
		return banda.sosGrupo()
	}

	method habilidad() {
		return self.habilidadBase() + self.habilidadEnGrupo()
	}

	method habilidadEnGrupo() method listaDeLetras() =
	self.listaDeCanciones().map({ cancion => cancion.letra() })
	method listaDeCanciones() = self.albums().map({ album => album.canciones()
	}).flatten()

	method dejaElGrupo() {
		self.banda(solista)
	}

	method duracionDeObra() {
		return self.albums().sum({ album => album.duracionDeAlbum() })

	}
	method banda(nuevaBanda) {
		banda = nuevaBanda
	}
	method esMinimalista() {
		return self.albums().all({ album => album.todasLasCancionesCortas() })
	}

	method tieneLaPalabra(unaPalabra) {
		return self.albums().map({ album => album.cancionesQueContienen(unaPalabra)
		}).flatten()
	}

	method duracionDeLaObra() = self.listaDeCanciones().sum({ cancion =>
	cancion.duracion() })

	method laPego() = self.albums().all({ album => album.seVendioBien() })

	method interpretaBien(unaCancion) {
		return self.esAutorTalentoso(unaCancion) || self.ejecutaBien(unaCancion)
	}

	method ejecutaBien(unaCancion) 
	
	method esAutorTalentoso(cancion){ 
    	return self.esDeAutoria(cancion) || self.habilidad()>60 
  	} 
  
	method esDeAutoria(unaCancion) {
		return self.albums().any({ album => album.tieneLaCancion(unaCancion) })
	}
	
	method tieneAlMenosUnCancion(){ 
    	return self.albums().any({album => album.tieneUnaCancion()}) 
  	}
}

class DeGrupo inherits Musico {
	var plusDeHabilidad

	constructor(unaBanda, unaHabilidad, unosAlbums, unPlusDeHabilidad) = super (
	unaBanda , unaHabilidad , unosAlbums ) {
		precioBase = 50 plusDeHabilidad = unPlusDeHabilidad
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

	override method ejecutaBien(unaCancion) {
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

	constructor(unaBanda, unaHabilidad, unosAlbums, unaPalabraElegida) = super (
	unaBanda , unaHabilidad , unosAlbums ) {
		palabraElegida = unaPalabraElegida precioBase = 400
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

	override method ejecutaBien(unaCancion) {
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
		return ( super() * self.habilidadDeLaGuitarra() ).min(100)
	}

	method habilidadDeLaGuitarra() {
		return guitarra.precio()
	}

	override method ejecutaBien(unaCancion) {
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

class Banda{
	var musicos=[]
	var representante
	
	constructor(unosMusicos , unRepresentante){
		musicos=unosMusicos
		representante = unRepresentante
	}
	method habilidad(){
		return self.sumatoriaDeHabilidades() + self.sumatoriaDeHabilidades() * 0.1
	}
	
	method sumatoriaDeHabilidades(){
		return self.musicos().sum({musico=>musico.habilidad()})
	}
	
	method musicos()=musicos
	
	method cobra(){
		return self.cobroDeCantantes() + representante.cobra()
	}
	
	method cobroDeCantantes(){
		return self.musicos().sum({musico => musico.cobrar()})
	}
	
	method puedeTocar(unaCancion){
		return self.musicos().all({musico => musico.interpretaBien(unaCancion)})
	}
}

class Representante{
	var dineroACobrar
	var nombre
	
	constructor(unNombre, unMonto){
		nombre = unNombre
		dineroACobrar = unMonto
	}
	method cobra()=dineroACobrar
}
object bandaX {
	method sosGrupo() {
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

 