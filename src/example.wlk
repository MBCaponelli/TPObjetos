import Canciones.*
import guitarras.*
import estadios.*
class Persona{
	var banda
	var habilidad=0
	

method banda()= banda
	method banda(nuevaBanda) {
		banda=nuevaBanda
	}
	
	method habilidad(habilidadNueva){habilidad=habilidadNueva}	

	
}

class Joaquin inherits Persona {
	const cobra=50
	method cobra()=cobra

	method cobra(lugar){
		if(banda==null)
		{return (cobra*2)}
		else 
		{return cobra}
	}
	

 
	method habilidad(){
		if(banda==null)
		{return habilidad}
		else
		{return (habilidad+5)
		}
	}
	method interpreta(cancion)= cancion.duracion()>300
	
}
class Lucia inherits Persona
{
	const cobra=500
	method cobra()=cobra
	
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
class LuisAlberto inherits Persona{ 
	const cobra=1000
	 const fender = new Fender()
  var guitarra=fender
 
  method cobra()=cobra
   
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






      