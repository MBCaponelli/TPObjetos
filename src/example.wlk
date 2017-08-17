
object joaquin {
	var banda = "pimpinela"
	var habilidad = 20
	method sumarHabilidad(habilidadagregada){
		habilidad+=habilidadagregada}
	method habilidad(){
		if(banda==0)
		{return habilidad}
		else
		{self.sumarHabilidad(5)
			return habilidad
		}
	}
	method interpreta(cancion)= cancion.duracion()>300
	
}
