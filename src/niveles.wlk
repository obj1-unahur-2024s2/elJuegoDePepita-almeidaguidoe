import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

    method iniciar() {
        game.addVisual(nido)
        game.addVisual(silvestre)
        game.addVisualCharacter(pepita)
    }

}

object tutorial2 {

    method iniciar() {
        game.addVisual(manzana)
        game.addVisual(alpiste)
        game.addVisual(nido)
        game.addVisual(silvestre)
        game.addVisualCharacter(pepita)
        pepita.caerPorGravedad()
        config.configurarTeclas()
    }

}

object tutorial3 {

    method iniciar() {
        game.addVisual(manzana)
        game.addVisual(alpiste)
        game.addVisual(nido)
        game.addVisual(silvestre)
        game.addVisual(pepita)
        config.configurarTeclas()
        config.configurarColisiones()
    }

}

object config {

    method configurarTeclas() {
        // Completar para que se pueda mover arriba y abajo
        keyboard.c().onPressDo( {pepita.comeLoQueHayaSiEsQueHayAlgo()}  )

    }

    method configurarColisiones() {
        game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
    }

}