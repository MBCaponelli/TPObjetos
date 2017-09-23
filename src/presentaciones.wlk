
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
	
	method canantes()=cantantes
	
	method fecha()=fecha
	
	method fecha(nuevaFecha){
		fecha=nuevaFecha
	}
	
	method fechaAnteriorASeptiembre(){
		return fecha.month()<9
	}
}


