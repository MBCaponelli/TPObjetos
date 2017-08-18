
object joaquin {
	var banda = "Pimpinela"
	var habilidad = 20
	var cobra= 50
	
	method banda()= banda
	method nuevaBanda(nuevaBanda) {
		banda=nuevaBanda
	}
	

	method cobra(){
		if(banda==null)
		{return (cobra*2)}
		else 
		{return cobra}
	}
	

	method sumarHabilidad(habilidadagregada){
		habilidad+=habilidadagregada}
	method habilidadNueva(habilidadNueva){habilidad=habilidadNueva} 
	method habilidad(){
		if(banda==null)
		{return habilidad}
		else
		{return (habilidad+5)
		}
	}
	method interpreta(cancion)= cancion.duracion()>300
	
}


object cisne{
	method letra() ="Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar"
	method duracion() =312
}

object laFamilia{
	method letra()="Quiero brindar por mi gente sencilla, por el amor brindo por la familia"
	method duracion()=264
}

object lucia
{
	var banda = "Pimpinela"
	var habilidad = 70
	var cobra=500
	method banda()= banda
	method nuevaBanda(nuevaBanda) {
		banda=nuevaBanda
	}
	method habilidad(){
		if(banda!=null)
		{
			return (habilidad-20)
		}else{
			return habilidad
		}
	}
	method cobro(lugar){
		if(lugar.capacidad()>5000)
		{
			return 500
		}
		else{
			return 400
		}
	}
	method interpreta(cancion)=cancion.letra().coleccioncontains("familia")
}