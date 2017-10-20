import Canciones.*
import guitarras.*
import albums.*
import presentaciones.*
import bandas.*

class Musico {
	var banda
	var habilidadBase
	var albums = [ ]
	var categoria
	var formaDeCobro
	constructor(unaBanda, unaHabilidad, unosAlbums,unaCategoria,unaFormaDeCobro) {
		banda = unaBanda habilidadBase = unaHabilidad albums = unosAlbums  categoria=unaCategoria formaDeCobro=unaFormaDeCobro
	}

	method cobrar(unaPresentacion){
		return formaDeCobro.cobroEspecial(unaPresentacion)
	}

	method categoria() = categoria
	method categoria(nuevaCategoria){
		categoria=nuevaCategoria
	}
	
	
	

	
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
	
	method interpretaBienSegunSuTipo(unaCancion){
		return categoria.interpretacion(unaCancion)
	}
	method interpretaBienDeLaListaDeCanciones(unasCanciones){
		return unasCanciones.filter({cancion => self.interpretaBien(cancion)})
	}
	
}


class CobroPorCantantes {
	var cantidadDePesos
	constructor(unaCantidadDePesos){
	cantidadDePesos=unaCantidadDePesos	
	}
	 method cobroEspecial(unaPresentacion) {
		if (unaPresentacion.masDeUnCantante()) {
			return cantidadDePesos/2
		} else {
			
			return  cantidadDePesos
		}
	}
}

class CobroPorCapacidad{
	var cantidadDePesos
	var cantidadDePersonas
	
	constructor(unaCantidadDePesos,unaCantidadDePersonas){
		cantidadDePesos=unaCantidadDePesos
		cantidadDePersonas=unaCantidadDePersonas
	}
	method cobroEspecial(unaPresentacion) {
		if(unaPresentacion.capacidadEn(unaPresentacion.fecha())>cantidadDePersonas){
			return cantidadDePesos
		}else{
			return cantidadDePesos-100
		}
	}
}

class CobroPorExpectativaInflacionaria {
 var cantidadDePesos
 var fecha
 var porcentajeAdicional
 constructor(unaCantidadDePesos,unaFecha,unPorcentajeAdicional){
 	cantidadDePesos = unaCantidadDePesos
 	fecha = unaFecha
 	porcentajeAdicional = unPorcentajeAdicional
 }	
 method fecha()=fecha
 method cobrar(unaPresentacion){
 if(self.fecha() < unaPresentacion.fecha()){
 	return cantidadDePesos
 }else{
 	return cantidadDePesos+(cantidadDePesos*porcentajeAdicional)
 }
 }
}

class Larguero {
	var cantidadDeSegundos
	constructor(unaCantidadDeSegundos){
		cantidadDeSegundos=unaCantidadDeSegundos
	}
	 method interpretacion(unaCancion) {
		return unaCancion.duracion() > cantidadDeSegundos
	}
}

class Palabrero {
	var palabraElegida
	
	constructor(unaPalabraElegida){
		palabraElegida=unaPalabraElegida
	}
   method interpretacion(unaCancion) {
		return unaCancion.contieneUnaPalabra(palabraElegida)
	}
  
}

class Imparero {
	 method interpretacion(unaCancion){
		return unaCancion.esDeDuracionImpar()
	}
	
}


class DeGrupo inherits Musico {
	var plusDeHabilidad

	constructor(unaBanda, unaHabilidad, unosAlbums,unaCategoria,unaFormaDeCobro, unPlusDeHabilidad) =
	super(unaBanda, unaHabilidad, unosAlbums,unaCategoria,unaFormaDeCobro) { 
		plusDeHabilidad = unPlusDeHabilidad
		
	}

	

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

	
	
}

class VocalistaPopular inherits Musico {
	
   

	
	override method habilidadEnGrupo() {
		if (self.estaEnGrupo()) {
			return - 20
		} else {
			return 0
		}
	}

	

}



object luisAlberto inherits Musico ( solista , 8 , [
paraLosArboles, justCrisantemo ],"","") {
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

   
	override method cobrar(unaPresentacion) {
		if (unaPresentacion.fechaAnteriorASeptiembre()) {
			return 1000
		} else {
			return 1200
		}
	}
	
}




 