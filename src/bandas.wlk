class Banda{
	var cantantes
	var representante
	constructor(unosCantantes,unRepresentante){
		cantantes = unosCantantes representante = unRepresentante
	} 
	method cantantes()=cantantes
	method sosGrupo(){
		return true
	}
	method habilidadTotalDeLosCantantes(){
		return self.cantantes().sum({cantante=>cantante.habilidad()})
	}
	method habilidad(){
		return self.habilidadTotalDeLosCantantes()+(self.habilidadTotalDeLosCantantes()*0.1)
	}
	method cobrar(unaPresentacion){
		return (self.cantantes().sum({cantante=>cantante.cobrar(unaPresentacion)}))+representante.sueldo()
	}
	method interpretaBien(unaCancion){
		return self.cantantes().all({cantante => cantante.interpretaBien(unaCancion)})
	}
}


object pimpinela inherits Banda([],""){
	
}


object solista  {
  method sosGrupo() {
		return false
	}
}
class Representante {
	var sueldo
	var nombre
	constructor(unNombre,unSueldo){
		sueldo=unSueldo
	    nombre=unNombre
	}
	method nombre()=nombre
	method sueldo()=sueldo
}