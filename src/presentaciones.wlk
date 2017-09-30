import Canciones.*

object lunaPark {
	method capacidadEn(unDia) = 9290

	method esConcurrido(fecha) {
		return self.capacidadEn(fecha) > 5000
	}
}
object trastienda {
	method capacidadEn(unDia) {
		if (unDia.dayOfWeek() != 6) {
			return 400
		} else {
			return 700
		}
	}

	method esConcurrido(fecha) {
		return self.capacidadEn(fecha) > 5000
	}
}

class Presentacion {
	var cantantes
	var lugar
	var fecha

	constructor(unosCantantes, unLugar, unaFecha) {
		cantantes = unosCantantes lugar = unLugar fecha = unaFecha
	}

	method costo() {
		return cantantes.sum({ cantante => cantante.cobrar(self) })
	}

	method esConcurrida() {
		return lugar.esConcurrido(fecha)
	}
	
	method cantantes(nuevosCantantes){
		cantantes=nuevosCantantes
	}
	
	method cantantes()=cantantes
	
	method fecha()=fecha
	
	method fecha(nuevaFecha){
		fecha=nuevaFecha
	}
	
	method fechaAnteriorASeptiembre(){
		return fecha.month()<9
	}
}
class UserException inherits Exception { }

object pdpalooza inherits Presentacion([],lunaPark, new Date(15,12,2017)){
	
	method agregarCantante (unCantante){
		self.tienenHabilidadMayorA(70, unCantante)
		self.tieneAlMenosUnaCancion(unCantante)
		self.cantanBienAliciaEnElPais(cancionDeAliciaEnElPais,unCantante)
			
		cantantes.add(unCantante)			
	}
		
		
	
	method tienenHabilidadMayorA(numero,unCantante){
		if(unCantante.habilidad() <= numero)
			throw new UserException("La habiidad de cada uno de los cantantes tiene que ser mayor a 70")
	}
	
	
	method cantanBienAliciaEnElPais(cancion, unCantante){
		if(!unCantante.interpretaBien(cancion))
 			throw new presentaciones.UserException("todos los cantantes tiene que cantar bien Cancion de Alicia en el pais")
	}
	
	method tieneAlMenosUnaCancion(unCantante){
		if(!unCantante.tieneAlMenosUnCancion())
			throw new presentaciones.UserException("cada cantante tiene que tenr al menos unca cancion")
	}
}



