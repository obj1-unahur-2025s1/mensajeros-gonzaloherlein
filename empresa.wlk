import mensajeros.*
import destinos.*

object empresa{
    const mensajeros = #{}

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

    method algunoPuedePasarABrooklyn(){
        mensajeros.any({
            mensajero => puenteDeBrooklyn.dejarPasar(mensajero)
        })
    }
}