import Canciones.*
/*PERSONAS */
object joaquin {
	var banda = "Pimpinela"
	var habilidad = 20
	var cobra= 50
	
	method banda()= banda
	method banda(nuevaBanda) {
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
object lucia
{
	var banda = "Pimpinela"
	var habilidad = 70
	var cobra=500
	method banda()= banda
	method banda(nuevaBanda) {
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
object luisAlberto{ 
  var guitarra=fender 
  var cobra=1000 
  method guitarra()=guitarra 
  method nuevaGuitarra(guitarraNueva){guitarra=guitarraNueva} 
  method precioGuitarra()= guitarra.precio() 
  method habilidad() {if((guitarra.precio()*8)<100) {return guitarra.precio()*8} 
            else {return 100}} 
  method interpreta(cancion)=true 
  method cobra(lugar)=if((lugar.fecha().month())<10){return cobra}
  						else {return cobra+200}} 
/*CANCIONES */



/*ESPECTACULOS */
object lunaPark{
	var cantantes=[luisAlberto,joaquin, lucia]
	const fecha = new Date (20,04,2017) 									
	var capacidad= 9290
	method cantantes() = cantantes
	method cantantes(losCantantes){cantantes = losCantantes}
	method fecha()=fecha
	method capacidad() = capacidad
	method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()
}
object trastienda{
	var cantantes=[luisAlberto,joaquin, lucia]
	const fecha =new Date(15,11,2017)	/*15/11/2017*/
	var capacidad=400
	method cantantes() = cantantes
	method cantantes(losCantantes){cantantes = losCantantes}
	method fecha()=fecha
	method capacidad(){
		if((self.fecha().dayOfWeek())!=6)	
			{return capacidad}
		else return (capacidad+300)
		}
	method cobra()=return cantantes.map({persona =>persona.cobra(self)}).sum()
	

} 

/*GUITARRAS */
object fender{ 
  var precio = 10 
  method precio()=precio 
  method precio(nuevoPrecio){
  	precio=nuevoPrecio
  }
} 
object gibson{ 
  var precio = 15 
  var estado = "sana" 
  method precio(){ 
    if(estado=="sana"){ 
      self.precio(15) 
      return precio 
    } 
    else{ 
      self.precio(5) 
      return precio 
         } 
     
  } 
  method precio(nuevoprecio){ 
    precio=nuevoprecio 
  } 
  method estado()=estado 
  method estado(estadoNuevo){estado=estadoNuevo} 
}
      
      