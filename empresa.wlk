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

    method paquetePuedeSerEntregadoPorElPrimerMensajero(paquete,destino){
        const primero = mensajeros.asList().first()
        return paquete.sePuedeEntregar(primero, destino)
    }

    method pesoDelUltimoMensajero(){
        const ultimo = mensajeros.asList().last()
        return ultimo.peso()
    }

    method puedeEntregar(destino,tipoDePaquete) =
        mensajeros.any({
            m => tipoDePaquete.sePuedeEntregar(m,destino)
        })
    
    method obtenerTodosLosMensajerosQuePuedenLlevarUnPaquete(paquete,destino) =
        mensajeros.filter({
            m => paquete.sePuedeEntregar(m,destino)
        })
}