
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
class Remix inherits Cancion {
	constructor(unaCancion)=super(unaCancion.nombre(), unaCancion.duracion(), unaCancion.letra()){
		duracion=unaCancion.duracion()*3
		letra="mueve tu cuelpo baby "+unaCancion.letra() +" yeah oh yeah"
	}
}
class Mashup inherits Cancion {
	constructor(unasCanciones)=super(unasCanciones.map({cancion => cancion.nombre()}), unasCanciones.map({cancion=>cancion.duracion()}), unasCanciones.map({cancion=>cancion.letra()})){
		duracion=unasCanciones.map({cancion=>cancion.duracion()}).max()
		nombre=unasCanciones.map({cancion=>cancion.nombre()}).fold("",{nombre1,bloque=>nombre1+" "+bloque}).drop(1)
		letra=unasCanciones.map({cancion=>cancion.letra()}).fold("",{unaletra,unbloque=>unaletra+" "+unbloque}).drop(1)
	}
	
}

object cisne inherits Cancion("Cisne", 312, "Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar"){}
object almaDeDiamante inherits Cancion("Alma de diamante",216,"Ven a mí con tu dulce luz alma de diamante. Y aunque el sol se nuble después sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven así con la humanidad alma de diamante"){}
object crisantemo inherits Cancion("Crisantemo",175,"Tócame junto a esta pared, yo quede por aquí... cuando no hubo más luz... quiero mirar a través de mi piel... Crisantemo, que se abrió... encuentra el camino hacia el cielo"){}
object aliciaEnElPais inherits Cancion("Cancion de Alicia en el Pais",510,"Quién sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabó ese juego que te hacía feliz"){}

