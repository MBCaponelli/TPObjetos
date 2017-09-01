import Canciones.*
import guitarras.*
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
  const fender = new Fender()
  var cobra=1000 
  method guitarra()=guitarra 
  method nuevaGuitarra(guitarraNueva){
  	guitarra=guitarraNueva
  } 
  method precioGuitarra()= guitarra.precio() 
  method habilidad() {if((guitarra.precio()*8)<100) {return guitarra.precio()*8} 
            else {return 100}} 
  method interpreta(cancion)=true 
  method cobra(lugar)=if((lugar.fecha().month())<10){return cobra}
  						else {return cobra+200}} 
/*CANCIONES */





      