import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*

class Estadio{
	var nombre
	var capacidadBase
	
	constructor(unNombre, unaCapacidad){
		nombre = unNombre
		capacidadBase = unaCapacidad
	}
	method capacidadEn(unDia) = capacidadBase
	
	method esConcurrido(fecha){
		return self.capacidadEn(fecha) > 5000
	}
	
	
}

object lunaPark inherits Estadio("luna park", 9290) {}

object trastienda inherits Estadio("trastienda", 400){
	override method capacidadEn(unDia) {
		if (unDia.dayOfWeek() != 6) {
			return capacidadBase
		} else {
			return capacidadBase + 300
		}
	}

}
object prixDAmi inherits Estadio("Prix D’Ami", 150){}

object laCueva inherits Estadio("la cueva", 14000){}