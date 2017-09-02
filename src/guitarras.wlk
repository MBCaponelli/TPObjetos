import albumes.*
class Guitarra {

var precio =10
method precio(nuevoPrecio){
	precio=nuevoPrecio
}

}
class Fender inherits Guitarra{
	method precio()=precio
}
class Gibson inherits Guitarra{
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

  method estado()=estado 
  method estado(estadoNuevo){estado=estadoNuevo} 
}