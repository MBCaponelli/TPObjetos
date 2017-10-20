class Banda{
	var cantantes
	var representante
	constructor(unosCantantes,unRepresentante){
		cantantes = unosCantantes representante = unRepresentante
	} 
	method sosGrupo(){
		return true
	}
	method habilidad(){
		return unosCantantes.map({cantante=>cantante.habilidad()}).fold(0,{habilidad1,seed=>habilidad1+seed})
	}
}



object solista  {
  method sosGrupo() {
		return false
	}
}