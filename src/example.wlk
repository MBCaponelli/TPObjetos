
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
	method letra() ="Hoy el viento se abri� qued� vac�o el aire una vez m�s y el manantial brot� y nadie est� aqu� y puedo ver que solo estallan las hojas al brillar"
	method duracion() =312
}

object laFamilia{
	method letra()="Quiero brindar por mi gente sencilla, por el amor brindo por la familia"
	method duracion()=264
}
