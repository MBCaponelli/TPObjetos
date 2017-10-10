import cantantes.*
import presentaciones.*
import Canciones.*
import guitarras.*
import albums.*
import banda.*
import estadio.*
import formasDeCobrar.*
import tipoMusico.*

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

