object joaquin {
	var banda = "Pimpinela"
	var habilidad = 20
	var cobra= 50
	
	method banda()= banda
	method nuevaBanda(nuevaBanda) {
		banda=nuevaBanda
	}
	

	method cobra(lugar){
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
	method cobra(lugar){
		if(lugar.capacidad()>5000)
		{
			return cobra
		}
		else{
			return (cobra-100)
		}
	}
	method interpreta(cancion)=cancion.letra().contains("familia")
}
object lunaPark{
	var cantantes=[luisAlberto,joaquin, lucia]
	const fecha = "Jueves" 			/* 20/04/2017*/ 								
	var capacidad= 9290
	method cantantes() = cantantes
	method nuevosCantantes(losCantantes){cantantes = losCantantes}
	method fecha()=fecha
	method capacidad() = capacidad
	method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()
}
object trastienda{
	var cantantes=[luisAlberto,joaquin, lucia]
	const fecha = "Miercoles"		/*15/11/2017*/
	var capacidad=400
	method cantantes() = cantantes
	method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()
	method nuevosCantantes(losCantantes){cantantes = losCantantes}
	method fecha()=fecha
	method capacidad(){
		if(fecha!="Sabado")	
			{return capacidad}
		else return (capacidad+300)
		}
	method capacidad(dia){
		if(dia=="Sabado")
			{return capacidad+300}
		else return (capacidad)
		}
	
	
} 
object luisAlberto{
	var guitarra=fender
	var cobra=1000
	method guitarra()=guitarra
	method nuevaGuitarra(guitarraNueva){guitarra=guitarraNueva}
	method precioGuitarra()= guitarra.precio()
	method habilidad() {if((guitarra.precio()*8)<100) {return guitarra.precio()*8}
						else {return 100}}
	method interpreta(cancion)=true
	method cobra(lugar){
		if(lugar=="lunaPark")
		{return cobra}
		else{
			return (cobra+200)
		}
	}
	}
object fender{
	const precio = 10
	method precio()=precio
}
object gibson{
	var precio = 15
	var estado = "sana"
	method precio(){
		if(estado=="sana"){
			self.nuevoPrecio(15)
			return precio
		 } 
    else{ 
      self.nuevoPrecio(5) 
      return precio 
    } 
     
  } 
  method nuevoPrecio(nuevoprecio){ 
    precio=nuevoprecio 
  } 
  method estado()=estado 
  method nuevoEstado(estadoNuevo){estado=estadoNuevo} 
}