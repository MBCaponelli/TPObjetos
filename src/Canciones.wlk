import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*

class Cancion {
	var nombre
	var duracion
	var letra

	constructor(unNombre, unaDuracion, unaLetra) {
		nombre = unNombre duracion = unaDuracion letra = unaLetra
	}

	method duracion() = duracion
    method nombre()=nombre
	method letra() = letra
    method esCorta()=duracion<180
	method letra(nuevaLetra) {
		letra = nuevaLetra
	}
	
	method contieneUnaPalabra(unaPalabra){
		return self.letra().toLowerCase().words().contains(unaPalabra)
	}
	
	method longitudCancion(){
		return self.letra().words().size()
	}
	
	method duracionMayorA(xSegundos){
		return self.duracion()>xSegundos
	}
	
	method tieneCantidadImparDeSegundos(){
		return self.duracion().odd()
	}
	 
}

class Remix inherits Cancion{
	var cancion
	
	constructor(unaCancion)=super(unaCancion.nombre(),unaCancion.duracion(),unaCancion.letra()){
		cancion=unaCancion
		duracion=unaCancion.duracion()*3
		letra= "mueve tu cuelpo baby " + unaCancion.letra() + " yeah oh yeah"
	}
}

class Mashup inherits Cancion{
	var canciones
	
	constructor(unasCanciones, unNombre)=super(unNombre, 0, ""){
		canciones=unasCanciones
		duracion=self.canciones().max({cancion => cancion.duracion()}).duracion()
   		letra = self.canciones().map({cancion=> cancion.letra()}).fold("",{semilla , unaLet =>  semilla + unaLet + " " }).drop(1) 
		
	}
	
	method canciones()=canciones
		
	
}

object cisne inherits Cancion("Cisne", 312, "Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar"){}
object almaDeDiamante inherits Cancion("Alma de diamante",216,"“Ven a mí con tu dulce luz alma de diamante. Y aunque el sol se nuble después sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven así con la humanidad alma de diamante"){}
object crisantemo inherits Cancion("Crisantemo",175,"Tócame junto a esta pared, yo quede por aquí... cuando no hubo más luz... quiero mirar a través de mi piel... Crisantemo, que se abrió... encuentra el camino hacia el cielo"){}
object cancionDeAliciaEnElPais inherits Cancion("Canción de Alicia en el país", 510, "Quién sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabó ese juego que te hacía feliz."){}