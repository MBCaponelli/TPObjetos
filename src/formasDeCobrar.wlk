import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*

class CantidadQueSePresentan{
	var musico
	
	constructor(unMusico){
		musico = unMusico
	}
	
	method musico()=musico
	method modificarCobro(monto,unRecital){
		if(unRecital.cantaSolo(self.musico())){
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
			return ( monto - 100)
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