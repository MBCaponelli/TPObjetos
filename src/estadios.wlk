import example.*

class Estadio {
var cantantes =[]
var capacidad=0

method cantantes() = cantantes

method cantantes(losCantantes){
	cantantes = losCantantes
}

method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()

method capacidad(nuevaCapacidad){
	capacidad=nuevaCapacidad
}
}

class LunaPark inherits Estadio{
	
	const fecha = new Date (20,04,2017) 
										
	method fecha()=fecha
	
	method capacidad() = capacidad
	
}
class Trastienda inherits Estadio{
	const fecha =new Date(15,11,2017)
	method fecha()=fecha
	
	method capacidad(){
		if((self.fecha().dayOfWeek())!=6)	
			{return capacidad}
		else {return (capacidad+300)}
		}
	

} 
