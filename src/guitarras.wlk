
object fender {
                method precio() = 10
}

object gibson {
                var estado = sana

                method estado() = estado

                method seRompe() {
                               self.estado(mal)
                }

                method estado(estadoNuevo) {
                               estado = estadoNuevo
                }

                method precio() = self.estado().precio()

}
object sana {
                method precio() = 15
}

object mal {
                method precio() = 5
}

