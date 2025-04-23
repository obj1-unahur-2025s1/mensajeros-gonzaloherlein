import mensajeros.*
import destinos.*

object empresa{
    const mensajeros = #{}

    method getMensajeros(){
        return mensajeros
    }

    method contratarMensajero(unMensajero){
        mensajeros.add(unMensajero)
    }

    method despedirMensajero(unMensajero){
        mensajeros.remove(unMensajero)
    }
    method despedirATodos(){
        mensajeros.clear()
    }
    method esGrande(){
        return mensajeros.size() > 2
    }

    method paquetePuedeSerEntregadoPorElPrimerMensajero(){
        const primero = mensajeros.asList().first()
        return puenteDeBrooklyn.dejarPasar(primero) ||
                laMatrix.dejarPasar(primero)
    }

    method pesoDelUltimoMensajero(){
        const ultimo = mensajeros.asList().last()
        return ultimo.peso()
    }
}