import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*

class Banda{
	var musicos
	var representante
	
	constructor(unosMusicos , unRepresentante){
		musicos=unosMusicos
		representante = unRepresentante
	}
	method habilidad(){
		return self.sumatoriaDeHabilidades() * 1.1
	}
	method representante()=representante
	
	method sumatoriaDeHabilidades(){
		return self.musicos().sum({musico=>musico.habilidad()})
	}
	
	method musicos() = musicos
	
	method cobrarPor(unaPresentacion){
		return (self.cobroDeCantantes(unaPresentacion)) +( representante.cobra())
	}
	
	method cobroDeCantantes(unaPresentacion){
		return self.musicos().sum({musico => musico.cobrarPor(unaPresentacion)})
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
	
	method cobra()= dineroACobrar
}
