import example.*

object trastienda
{
var cantantes =[]
var capacidad=400
const fecha =new Date(15,11,2017)
method cantantes() = cantantes

method cantantes(losCantantes){
	cantantes = losCantantes
}

method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()

method capacidad(nuevaCapacidad){
	capacidad=nuevaCapacidad
}
method fecha()=fecha
	
method capacidad(){
		if((self.fecha().dayOfWeek())!=6)	
			{return capacidad}
		else {return (capacidad+300)}
		}
}

object lunaPark {
var cantantes =[]
const capacidad=9290

method cantantes() = cantantes

method cantantes(losCantantes){
	cantantes = losCantantes
}

method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()

method fecha() {
    return new Date(04,09,2017)
}
method capacidad()=capacidad
}