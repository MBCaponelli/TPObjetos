import Canciones.*

class Album {
	var canciones=[]
	var titulo
	var fechaDeLanzamiento = new Date()
	var unidadesQueSalieronALaVenta=0
	var unidadesQueSeVendieron=0


   constructor(unTitulo,unasCanciones,unaFechaDeLanzamiento,unasunidadesQueSalieronALaVenta,unasunidadesQueSeVendieron) {
   	canciones=unasCanciones
    titulo=unTitulo
	fechaDeLanzamiento=unaFechaDeLanzamiento
	unidadesQueSalieronALaVenta=unasunidadesQueSalieronALaVenta
	unidadesQueSeVendieron=unasunidadesQueSeVendieron
   }
   method canciones()=canciones
   method canciones(nuevasCanciones) {
   	self.canciones().addAll(nuevasCanciones)
   }
	method eliminaTodasLasCanciones(){
		self.canciones().clear()
	}

	method cancionesNuevas(nuevasCanciones){
		self.eliminaTodasLasCanciones()
		self.canciones(nuevasCanciones)
	}
	
	method titulo()=titulo
	
	method titulo(nuevoTitulo){
		titulo=nuevoTitulo
	}
	
	method fechaDeLanzamiento()=fechaDeLanzamiento
	
	method fechaDeLanzamiento(nuevaFecha){
		fechaDeLanzamiento=nuevaFecha
	}
	
	method unidadesQueSalieronALaVenta()=unidadesQueSalieronALaVenta
	
	method unidadesQueSalieronALaVenta(cantidad){
		unidadesQueSalieronALaVenta=cantidad
	}
	
	method unidadesQueSeVendieron()=unidadesQueSeVendieron
	
	method unidadesQueSeVendieron(cantidad){
		unidadesQueSeVendieron=cantidad
	}

    method laCancionMasLarga()=self.canciones().max({cancion=>cancion.duracion()})
    method seVendioBien()= (unidadesQueSeVendieron*100/unidadesQueSalieronALaVenta)>75
}
object paraLosArboles inherits Album("Para los Arboles",[cisne,almaDeDiamante],new Date(31,03,2003),50000,49000) {}
object justCrisantemo inherits Album("justCrisantemo",[crisantemo],new Date(05,12,2007),28000,27500) {}