import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*

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