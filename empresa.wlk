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

    method paquetePuedeSerEntregadoPorElPrimerMensajero(paquete){
        const primero = mensajeros.asList().first()
        return puenteDeBrooklyn.dejarPasar(primero,paquete) ||
                laMatrix.dejarPasar(primero,paquete)
    }

    method pesoDelUltimoMensajero(){
        const ultimo = mensajeros.asList().last()
        return ultimo.peso()
    }

    method obtenerMensajerosQuePuedanLlevarUnPaquete(paquete){
        const lista = []
        const listaDeMensajeros = mensajeros.asList()
        listaDeMensajeros.forEach({
            mensajero => if(self.puedeLlevarPaquete(mensajero, paquete)){
                lista.add(mensajero)
            }
        })
        return lista
    }

    method puedeLlevarPaquete(mensajero,paquete){
        return puenteDeBrooklyn.dejarPasar(mensajero,paquete) ||
                laMatrix.dejarPasar(mensajero,paquete)
    }
}