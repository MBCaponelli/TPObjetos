import albumes.*

object fender{
	
	method precio()=10
}
object gibson{
	
  var estado= new Sana()

  method estado()=estado 
  
  method seRompe() {
     self.estado(new Mal())
}
  
  
  method estado(estadoNuevo){
  	estado=estadoNuevo
  }
  
  method precio()= self.estado().precio()
    
      
}
class Sana{
	method precio()=15
}

class Mal{
	method precio()=5
}
