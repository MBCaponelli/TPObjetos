
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
	 
}

