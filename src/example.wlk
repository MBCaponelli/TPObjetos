import Canciones.*
import guitarras.*
import estadios.*
class TipoDeMusico{
	var banda
	var habilidad=0
	var albumes=[]
	
method albumes()=albumes
method banda()= banda
	method banda(nuevaBanda) {
		banda=nuevaBanda
	}
	
	method habilidad(habilidadNueva){habilidad=habilidadNueva}	

	
}





class VocalistaPopular inherits TipoDeMusico{
	const tipoDeMusico="Vocalista popular"
	const cobra=500
	var plusDeHablidad=20
	
	method plusDeHablidad(nuevoPlus){plusDeHablidad=nuevoPlus}
	method plusDeHablidad()=plusDeHablidad
	method habilidad(){
		if(banda!=null)
		{
			return (habilidad-plusDeHablidad)
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
	method cobra()=cobra
	method tipoDeMusico()=tipoDeMusico
}


class DeGrupo  inherits TipoDeMusico{
		const tipoDeMusico ="de grupo"
		const cobra=50
 		
 		method habilidad()=habilidad
		method tipoDeMusico()=tipoDeMusico
		
		method cobra(lugar){
		if(banda==null)
		{return (cobra*2)}
		else 
		{return cobra}
	}
	
	
	method cobra()=cobra
	method interpreta(cancion)= cancion.duracion()>300
		
}


class Joaquin inherits DeGrupo {

	
		override method habilidad(){
		if(banda==null)
		{return habilidad}
		else
		{return (habilidad+ 5)
		}
	}
	
}
class Lucia inherits VocalistaPopular
{
	var palabraQueHaceQueCanteBien="familia"
	method palabraQueHaceQueCanteBien(nuevaPalabra)={palabraQueHaceQueCanteBien=nuevaPalabra}
	method palabraQueHaceQueCanteBien()=palabraQueHaceQueCanteBien
	method interpreta(cancion)=cancion.letra().contains("palabraQueHaceQueCanteBien")
}
 
 class LuisAlberto inherits TipoDeMusico{ 
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