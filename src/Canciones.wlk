
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
	 
}

class Remix{
	var cancion
	var duracion
	var letra
	constructor(unaCancion){
		cancion=unaCancion
		duracion=unaCancion.duracion()
		letra= "mueve tu cuerpo baby " + unaCancion.letra() + "yeah oh yeah"
	}
}

class Mashup{
	var canciones
	var duracion
	var letra
	constructor(unasCanciones){
		canciones=unasCanciones
		duracion=self.duracion()
		
	}
	method canciones()=canciones
	
	method duracion(){
		return self.canciones().max({cancion=>cancion.duracion()}).duracion()
	}
	
	//hacer letra
	
	
}
object cisne inherits Cancion("Cisne", 312, "Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar"){}
object almaDeDiamante inherits Cancion("Alma de diamante",216,"“Ven a mí con tu dulce luz alma de diamante. Y aunque el sol se nuble después sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven así con la humanidad alma de diamante"){}
object crisantemo inherits Cancion("Crisantemo",175,"Tócame junto a esta pared, yo quede por aquí... cuando no hubo más luz... quiero mirar a través de mi piel... Crisantemo, que se abrió... encuentra el camino hacia el cielo"){}
