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

object cisne inherits Cancion("Cisne", 312, "Hoy el viento se abri� qued� vac�o el aire una vez m�s y el manantial brot� y nadie est� aqu� y puedo ver que solo estallan las hojas al brillar"){}
object almaDeDiamante inherits Cancion("Alma de diamante",216,"�Ven a m� con tu dulce luz alma de diamante. Y aunque el sol se nuble despu�s sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven as� con la humanidad alma de diamante"){}
object crisantemo inherits Cancion("Crisantemo",175,"T�came junto a esta pared, yo quede por aqu�... cuando no hubo m�s luz... quiero mirar a trav�s de mi piel... Crisantemo, que se abri�... encuentra el camino hacia el cielo"){}
object cancionDeAliciaEnElPais inherits Cancion("Canci�n de Alicia en el pa�s", 510, "Qui�n sabe Alicia, este pa�s no estuvo hecho porque s�. Te vas a ir, vas a salir pero te quedas, �d�nde m�s vas a ir? Y es que aqu�, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acab� ese juego que te hac�a feliz."){}