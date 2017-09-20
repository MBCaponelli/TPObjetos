import Canciones.*
import guitarras.*

class Musico{
                var banda
                var habilidadBase
                var albums=[]
                constructor(unaBanda, unaHabilidad,unosAlbums){
                               banda=unaBanda
                               habilidadBase=unaHabilidad       
                               albums=unosAlbums
                }
               
                method habilidadBase()=habilidadBase
               
                method albums()=albums
               
                method estaEnGrupo(){
                               return banda.sosGrupo()
                }
               
                method habilidad(){
                               return self.habilidadBase()+self.habilidadEnGrupo()
                }
               
                method habilidadEnGrupo()
               
                method listaDeLetras()=self.listaDeCanciones().map({cancion=>cancion.letra()})
                method listaDeCanciones()=self.albums().map({album=>album.canciones()}).flatten()
                	             
                method dejaElGrupo(){
                               self.banda(solista)
                }
               
                method banda(nuevaBanda){
                               banda=nuevaBanda
                }
                method esMinimalista()=self.listaDeCanciones().all({cancion=>cancion.esCorta()})
                method duracionDeLaObra()=self.listaDeCanciones().sum({cancion=>cancion.duracion()})
                method laPego()=self.albums().all({album=>album.seVendioBien()})
                method contieneLaPalabra(palabra)=self.listaDeLetras().map({letra=>letra.words()}).flatten().contains(palabra)
}

class DeGrupo inherits Musico {
                 var precioBase=100
                 var plusDeHabilidad=5
                 method cobrar(unaPresentacion){
                               return self.precioBase()+self.precioEspecial(unaPresentacion)
                }
               
                method precioBase()=precioBase
                method plusdehabilidad(nuevoPlusDeHabilidad) {
                	plusDeHabilidad= nuevoPlusDeHabilidad
                }
                
                override method habilidadEnGrupo(){
                               if(self.estaEnGrupo()){
                                               return plusDeHabilidad
                               }else {
                                               return 0
                               }
                }
               
                method interpretaBien(unaCancion){
                               return unaCancion.duracion()>300
                }
               
                method precioEspecial(unaPresentacion){
                               if(self.estaEnGrupo()){
                                               return -50
                               }else{
                                               return 0
                               }
                }
               
}

class VocalistaPopular inherits Musico{
                 var precioBase=400
                 var palabraElegida="familia"
                 method palabraElejida()=palabraElegida
                 method palabraElejida(nuevaPalabraElegida) {
                 palabraElegida = nuevaPalabraElegida
                 }
                 method cobrar(unaPresentacion){
                               return self.precioBase()+self.precioEspecial(unaPresentacion)
                }
               
                method precioBase()=precioBase
    
               
               
                override method habilidadEnGrupo(){
                               if(self.estaEnGrupo()){
                                               return -20
                               }else{
                                               return 0
                               }
                }
               
                method interpretaBien(unaCancion){
                               return self.convertirEnMinusculas(unaCancion).contains(palabraElegida)
                }
               
               
                method convertirEnMinusculas(unaCancion) {
                               return unaCancion.letra().toLowerCase()
                }
               
                method precioEspecial(unaPresentacion){
                               if(unaPresentacion.esConcurrida()){
                                               return 100
                               }else{
                                               return 0
                               }
                }
               
}

object luisAlberto inherits Musico(solista,8,[paraLosArboles,justCrisantemo]){
                var guitarra=fender
               
                method tocarCon(unaGuitarra){
                               guitarra=unaGuitarra
                }
               
                override method habilidadEnGrupo() {
                	
                }
                override method habilidad(){
                               return self.habilidadDeLaGuitarra().min(100)
                }
               
                method habilidadDeLaGuitarra(){
                               return 8*guitarra.precio()
                }
               
                method interpretaBien(unaCancion){
                               return true
                }
               
                method cobrar(unaPresentacion){
                               if(unaPresentacion.fechaAnteriorASeptiembre()){
                                               return 1000
                               }else{
                                               return 1200
                               }
                }
}

object pimpinela {
	method sosGrupo() {
		return true
	}
}

object solista {
	method sosGrupo() {
		return false
	}
}

 