import mensajeros.*
import destinos.*

object empresa{
    const mensajeros = #{}
    const paquetesPendientes = []
    var facturacion = 0

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

    method puedeEntregar(destino,paquete) =
        mensajeros.any({
            m => paquete.sePuedeEntregar(m,destino)
        })
    
    method obtenerTodosLosMensajerosQuePuedenLlevarUnPaquete(paquete,destino) =
        mensajeros.filter({
            m => paquete.sePuedeEntregar(m,destino)
        })

    method saberSiMensajeriaTieneSobrepeso() =
        mensajeros.sum({
            m => m.peso()
        }) / mensajeros.size() > 500

    method enviarPaquete(paquete,destino){
        if(self.puedeEntregar(destino, paquete)){
            facturacion += paquete.precio()
        } else {
            paquetesPendientes.add(paquete)
        }
    }

    method enviarTodosLosPaquetes(conjuntoDePaquetes,destino){
        conjuntoDePaquetes.forEach({
            p => self.enviarPaquete(p, destino)
        })
    }

    method encontrarElPaquetePendienteMasCaroYEnviarlo(destino){
        const paqueteMasCaro = paquetesPendientes.max({
            p => p.precio()
        })
        if(self.puedeEntregar(destino, paqueteMasCaro)){
            self.enviarPaquete(paqueteMasCaro, destino)
            paquetesPendientes.remove(paqueteMasCaro)
        }
    }
}