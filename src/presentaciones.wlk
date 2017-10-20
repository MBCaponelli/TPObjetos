import Canciones.*
object lunaPark {
	method capacidadEn(unDia) = 9290

	method esConcurrido(fecha) {
		return self.capacidadEn(fecha) > 5000
	}
}
object trastienda {
	method capacidadEn(unDia) {
		if (unDia.dayOfWeek() != 6) {
			return 400
		} else {
			return 700
		}
	}

	method esConcurrido(fecha) {
		return self.capacidadEn(fecha) > 5000
	}
}

class Presentacion {
	var cantantes
	var lugar
	var fecha

	constructor(unosCantantes, unLugar, unaFecha) {
		cantantes = unosCantantes lugar = unLugar fecha = unaFecha
	}

	method costo() {
		return cantantes.sum({ cantante => cantante.cobrar(self) })
	}

	method esConcurrida() {
		return lugar.esConcurrido(fecha)
	}
	
	method cantantes(nuevosCantantes){
		cantantes=nuevosCantantes
	}
	
	method cantantes()=cantantes
	
	method fecha()=fecha
	
	method fecha(nuevaFecha){
		fecha=nuevaFecha
	}
	
	method masDeUnCantante()= self.cantantes().size()>1
	method fechaAnteriorASeptiembre(){
		return fecha.month()<9
	}
}

object pdpalooza inherits Presentacion([],lunaPark,new Date(15,12,2017)) {
	var condiciones=[habilidadMayorA70,compusoPorLoMenosUna,interpretaBienAlicia]
	method agregarCantante(unCantante) {
		if(condiciones.all({condicion => condicion.seCumplePara(unCantante)})){
			self.cantantes().add(unCantante)
		}
	}
}
class CondicionesPdpalooza{
	method seCumplePara(unCantante)
}

object habilidadMayorA70 inherits CondicionesPdpalooza{
	override method seCumplePara(unCantante) {
		if(unCantante.habilidad()<70) {
			throw new Exception("habilidad menor a 70")
		}else {return true}
		}
}
object compusoPorLoMenosUna inherits CondicionesPdpalooza{
	override method seCumplePara(unCantante) {
		if(unCantante.albums().size()==0) {
			throw new Exception("no compuso nada")
		}else {return true}
		}
}
object interpretaBienAlicia inherits CondicionesPdpalooza{
	override method seCumplePara(unCantante) {
		if(!unCantante.interpretaBien(aliciaEnElPais)) {
			throw new Exception("no interpreta bien Alicia")
		}else {return true}
		}
}