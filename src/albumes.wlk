
class Album {
	const canciones=[]
	var titulo
	var fechaDeLanzamiento = new Date()
	var unidadesQueSalieronALaVenta=0
	var unidadesQueSeVendieron=0


	method canciones() = canciones
	method agregaCanciones(unasCanciones){
		self.canciones().addAll(unasCanciones)
	}
	method agregaCancion(unaCancion){
		self.agregaCanciones([unaCancion])
	}
	
	method eliminaTodasLasCanciones(){
		self.canciones().clear()
	}

	method cancionesNuevas(nuevasCanciones){
		self.eliminaTodasLasCanciones()
		self.agregaCanciones(nuevasCanciones)
	}
	
	method titulo()=titulo
	method titulo(nuevoTitulo){titulo=nuevoTitulo}
	
	method fechaDeLanzamiento()=fechaDeLanzamiento
	method fechaDeLanzamiento(nuevaFecha){fechaDeLanzamiento=nuevaFecha}
	
	method unidadesQueSalieronALaVenta()=unidadesQueSalieronALaVenta
	method unidadesQueSalieronALaVenta(cantidad){unidadesQueSalieronALaVenta=cantidad}
	
	method unidadesQueSeVendieron()=unidadesQueSeVendieron
	method unidadesQueSeVendieron(cantidad){unidadesQueSeVendieron=cantidad}


}