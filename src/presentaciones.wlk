import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*


class Presentacion {
	var cantantes
	var lugar
	var fecha

	constructor(unosCantantes, unLugar, unaFecha) {
		cantantes = unosCantantes lugar = unLugar fecha = unaFecha
	}


	
	method costo() {
		return self.cantantes().sum({ cantante => cantante.cobrarPor(self)})
	}

	method esConcurrida() {
		return self.lugar().esConcurrido(fecha)
	}
	
	method lugar() = lugar

	method cantantes(nuevosCantantes) {
		cantantes = nuevosCantantes
	}

	method cantantes() = cantantes

	method fecha() = fecha

	method fecha(nuevaFecha) {
		fecha = nuevaFecha
	}

	method fechaAnteriorASeptiembre() {
		return fecha.month() < 9
	}
	
	method cantaSolo(musico){
		return self.cantantes() ==[musico] 
	}
	
	method cantidadDeCantantes(){
		return self.cantantes().size()
	}
	
	method magia(){
		return self.cantantes().sum({cantante => cantante.habilidad()})
	}
	
	method capacidad(){
		return self.lugar().capacidadEn(fecha)
	}
	
}
class UserException inherits Exception {
}

object pdpalooza inherits Presentacion ( [ ] , lunaPark ,
new Date(15, 12, 2017) ) {

	method agregarCantante(unCantante) {
		self.tieneHabilidadMayorA(70, unCantante)
		self.tieneAlMenosUnaCancion(unCantante)
		self.cantanBienAliciaEnElPais(cancionDeAliciaEnElPais, unCantante)

		cantantes.add(unCantante)
	}

	method tieneHabilidadMayorA(numero, unCantante) {
		if (unCantante.habilidad() <= numero) throw
		new Exception("La habilidad de cada uno de los cantantes tiene que ser mayor a 70")
	}

	method cantanBienAliciaEnElPais(cancion, unCantante) {
		if (! unCantante.interpretaBien(cancion)) throw
		new Exception("todos los cantantes tiene que cantar bien Cancion de Alicia en el pais")
	}

	method tieneAlMenosUnaCancion(unCantante) {
		if (! unCantante.tieneAlMenosUnCancion()) throw
		new Exception("cada cantante tiene que tenr al menos unca cancion")
	}
}


