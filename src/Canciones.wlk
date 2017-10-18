
class Cancion {
	var nombre
	var duracion
	var letra

	constructor(unNombre, unaDuracion, unaLetra) {
		nombre = unNombre duracion = unaDuracion letra = unaLetra
	}

	method duracion() = duracion
    method nombre()=nombre
	method letra() = letra.toLowerCase()
    method esCorta()=duracion<180
	method letra(nuevaLetra) {
		letra = nuevaLetra
	}
	
	method contieneUnaPalabra(unaPalabra){
		return self.letra().words().contains(unaPalabra)
	}
	
	method longitudCancion(){
		return self.letra().words().size()
	}
	 
	method esDeDuracionImpar() {
		return self.duracion().odd()
	} 
}
class Remix inherits Cancion {
	constructor(unaCancion)=super(unaCancion.nombre(), unaCancion.duracion(), unaCancion.letra()){
		duracion=unaCancion.duracion()*3
		letra="mueve tu cuelpo baby "+unaCancion.letra() +" yeah oh yeah"
	}
}
class Mashup inherits Cancion {
	constructor(unasCanciones)=super("",0 , ""){
		nombre = unasCanciones.map({cancion=>cancion.nombre()}).fold("",{nombre1,bloque=>nombre1+" "+bloque}).drop(1)
		duracion = unasCanciones.max({cancion=>cancion.duracion()}).duracion()
		letra = unasCanciones.map({cancion=>cancion.letra()}).fold("",{unaletra,unbloque=>unaletra+" "+unbloque}).drop(1)
	}
	
}

object cisne inherits Cancion("Cisne", 312, "Hoy el viento se abri� qued� vac�o el aire una vez m�s y el manantial brot� y nadie est� aqu� y puedo ver que solo estallan las hojas al brillar"){}
object almaDeDiamante inherits Cancion("Alma de diamante",216,"Ven a m� con tu dulce luz alma de diamante. Y aunque el sol se nuble despu�s sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven as� con la humanidad alma de diamante"){}
object crisantemo inherits Cancion("Crisantemo",175,"T�came junto a esta pared, yo quede por aqu�... cuando no hubo m�s luz... quiero mirar a trav�s de mi piel... Crisantemo, que se abri�... encuentra el camino hacia el cielo"){}
object aliciaEnElPais inherits Cancion("Cancion de Alicia en el Pais",510,"Qui�n sabe Alicia, este pa�s no estuvo hecho porque s�. Te vas a ir, vas a salir pero te quedas, �d�nde m�s vas a ir? Y es que aqu�, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acab� ese juego que te hac�a feliz"){}

