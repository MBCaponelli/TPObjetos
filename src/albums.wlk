import Canciones.*

class Album {
	var canciones
	var titulo
	var fechaDeLanzamiento
	var unidadesQueSalieronALaVenta
	var unidadesQueSeVendieron


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
	method cancionesQueContienen(unaPalabra){
		return self.canciones().filter({cancion=>cancion.contieneUnaPalabra(unaPalabra)})
	}
	

	
	method duracionDeAlbum(){
		return self.canciones().sum({cancion=>cancion.duracion()})
	}
	method todasLasCancionesCortas(){
		return canciones.all({cancion=>cancion.esCorta()})
	}
    method laCancionMasLarga(){
    	return self.canciones().max({cancion=>cancion.longitudCancion()})
    }
    method porcentajeBuenaVenta()=0.75
     
    method seVendioBien() = unidadesQueSeVendieron > (unidadesQueSalieronALaVenta * self.porcentajeBuenaVenta())
    method obtenerMayorCancionSegunSu(unCriterio)=self.canciones().sortedBy({cancion1 , cancion2=>unCriterio.compara(cancion1, cancion2)}).first() 
}
object paraLosArboles inherits Album("Para los Arboles",[cisne,almaDeDiamante],new Date(31,03,2003),50000,49000) {}
object justCrisantemo inherits Album("justCrisantemo",[crisantemo],new Date(05,12,2007),28000,27500) {}
class Comparador {
	
    method transformar(unaCancion)
    method compara(unaCancionLarga,unaCancionCorta) = self.transformar(unaCancionLarga)>self.transformar(unaCancionCorta)
}
object segunSuDuracion inherits Comparador
{
	override method transformar(unaCancion)= unaCancion.duracion() 
}