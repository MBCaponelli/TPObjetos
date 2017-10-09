import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*

class Musico {
	var banda
	var habilidadBase
	var albums = [ ]
	var precioBase = 0
	var tipoDeMusico
	var formaDeCobrar
	
	

	constructor(unaBanda, unaHabilidad, unosAlbums,unTipoDeMusico, unaFormaDeCobrar) {
		banda = unaBanda habilidadBase = unaHabilidad albums = unosAlbums  tipoDeMusico=unTipoDeMusico formaDeCobrar = unaFormaDeCobrar
	}
	
	method precioBase(unPrecio){
		precioBase=unPrecio
	}

	method cobroBase(unaPresentacion) {
		return self.precioBase() + self.precioEspecial(unaPresentacion)
	}
	
	method cobrarPor(unaPresentacion){
		return self.formaDeCobrar().modificarCobro(self.cobroBase(unaPresentacion), unaPresentacion)
	}
	
	method formaDeCobrar() = formaDeCobrar
	
	method formaDeCobrar(nuevaForma){
		formaDeCobrar= nuevaForma
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

	method ejecutaBien(unaCancion) {
		return self.tipoDeMusico().ejecutaBien(unaCancion)
	}
	
	method esAutorTalentoso(cancion){ 
    	return self.esDeAutoria(cancion) || self.habilidad() > 60
  	} 
  
	method esDeAutoria(unaCancion) {
		return self.albums().any({ album => album.tieneLaCancion(unaCancion) })
	}
	
	method tieneAlMenosUnCancion(){ 
    	return self.albums().any({album => album.tieneUnaCancion()}) 
  	}
  	
  	method tipoDeMusico() = tipoDeMusico
  	
  	method tipoDeMusico(nuevoTipo){
  		tipoDeMusico = nuevoTipo
  	}
  	
  	method cualesInterpretaBien(unasCanciones){
  		return unasCanciones.filter({unaCancion => self.interpretaBien(unaCancion)}	)		// ??????
  	}
}

class CantidadQueSePresentan{
	var musico
	
	constructor(unMusico){
		musico = unMusico
	}
	method modificarCobro(monto,presentacion){
		if(presentacion.cantaSolo(musico)){
			return monto
		}
		else{
			return (monto / 2)
		}
	}
}

class CapacidadDelLugar{
	var cantidadDePersonas
	
	
	constructor( unaCantidadDePersonas ){
		cantidadDePersonas = unaCantidadDePersonas
		
	}
	
	method modificarCobro(monto, unRecital){
		if(unRecital.capacidad() > cantidadDePersonas){
			return monto
		}
		else{
			return monto - 100
		}
	}
	
}
class ExpectativaInflacionaria{
	
	var fechaLimite
	var porcentaje
	
	
	constructor ( unaFechaLimite, unPorcentaje){
		
		fechaLimite = unaFechaLimite
		porcentaje = unPorcentaje
		
	}
	
	method modificarCobro(monto, unRecital){
		
		if(unRecital.fecha() < fechaLimite){
			return monto
		}
		else{
			return self.factor() * monto
		}
		
	}
	
	method factor(){
		return 1 + porcentaje/100
	}
}

object cobroTradicional{
	method modificarCobro(monto, unRecital){
		return monto
	}
}

class Palabrero{
	var palabra
	
	constructor(unaPalabra){
		palabra=unaPalabra
	}
	method ejecutaBien(unaCancion){
		return unaCancion.contieneUnaPalabra(palabra)
		
	}
	
}
class Larguero{
	var xSegundos
	constructor(unosSegundos){
		xSegundos=unosSegundos
	}
	method ejecutaBien(unaCancion){
		return unaCancion.duracionMayorA(xSegundos)
	}
}
class Imparero{
	method ejecutaBien(unaCancion){
		return unaCancion.tieneCantidadImparDeSegundos()
	}
}

object musicoLuisAlberto{
	method ejecutaBien(unaCancion){
		return true
	}
} 

class DeGrupo inherits Musico {
	var plusDeHabilidad

	constructor(unaBanda, unaHabilidad, unosAlbums, unPlusDeHabilidad, unTipoDeMusico,unaFormaDeCobrar, unPrecioBase) = super (
	unaBanda , unaHabilidad , unosAlbums,unTipoDeMusico,unaFormaDeCobrar) {
		precioBase = unPrecioBase
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

	override method precioEspecial(unaPresentacion) {
		return 0
	}

	
}

class VocalistaPopular inherits Musico {
	var palabraElegida

	constructor(unaBanda, unaHabilidad, unosAlbums, unaPalabraElegida,unTipoDeMusico,unaFormaDeCobrar, unPrecioBase) = super (
	unaBanda , unaHabilidad , unosAlbums,unTipoDeMusico,unaFormaDeCobrar ) {
		palabraElegida = unaPalabraElegida 
		precioBase = unPrecioBase
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

	///override method ejecutaBien(unaCancion) {
		///return self.convertirEnMinusculas(unaCancion).contains(palabraElegida)
	//}

	method convertirEnMinusculas(unaCancion) {
		return unaCancion.letra().toLowerCase()
	}

	override method precioEspecial(unaPresentacion) {
	return 0
	}
}



object luisAlberto inherits Musico ( solista , 8 , [
paraLosArboles, justCrisantemo ], musicoLuisAlberto, cobroTradicional) {
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

 