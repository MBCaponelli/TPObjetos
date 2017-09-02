import guitarras.*
import example.*
import albumes.*
class Cancion {
var titulo
var letra
var duracion=0
method titulo()=titulo
method titulo(nuevoTitulo){titulo=nuevoTitulo}
method letra()=letra
method letra(letraDeCancion){
	letra=letraDeCancion
}
method duracion()=duracion
method duracion(nuevaDuracion){
	duracion=nuevaDuracion
}

method esCorta()=self.duracion()<180
}
