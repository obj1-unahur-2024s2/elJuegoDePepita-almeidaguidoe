import extras.*
import wollok.game.*

object pepita {

    var property energia = 100
    var position = nido.position()

    method position() = position

    method position(arg){
        self.irA(arg)
//      game.say(pepita,"cambio posicion: " + position.x() + " - " + position.y())
        game.say(self,"energia actual: " + energia)

    }
    method image() =
        "pepita" + self.parteDelNombreDelArchivoSegunUbicacion() + self.parteDelNombreDelArchivoSegunCansancio() + ".png"
//      "pepita" + (if (self.estaEnElNido()) "-grande" else "") + ".png"
//      if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"

    method parteDelNombreDelArchivoSegunCansancio() = 
        if (self.estaCansada() or self.esAtrapada()) "-gris" else ""

    method parteDelNombreDelArchivoSegunUbicacion() = 
        if (self.estaEnElNido()) "-grande" else ""

    method come(comida) {
        energia = energia + comida.energiaQueOtorga()
        game.removeVisual(comida)
    }


    method vola(kms) {
        energia = energia - kms * 9
    }

    method irA(nuevaPosicion) {
        if(self.sePuedeMover() and self.seMantieneEnElMapa(nuevaPosicion)) {
            self.vola(position.distance(nuevaPosicion))
            position = nuevaPosicion
			if (self.estaEnElNido()) {
				energia = 100.max(energia)
				game.say(nido, "Energía recuperada")
			}
			if (self.esAtrapada()) {
				game.say(silvestre,"Te atrape!! - GAME OVER")
                //game.addVisual(gameOver)
			}
        }
    }

	method seMantieneEnElMapa(nuevaPosicion) {
        return nuevaPosicion.x().between(0, game.width()-1) and nuevaPosicion.y().between(0, game.height()-1)
	}

    method estaCansada() {
        return energia <= 0
    }

	method esAtrapada() {
		return self.position()==silvestre.position()
	}

	method sePuedeMover() {
		return not self.estaCansada() and not self.esAtrapada()
	}

    method estaEnElNido() {
        
        return position == nido.position()
    }
    method comeLoQueHayaSiEsQueHayAlgo() {
        if(not game.colliders(self).isEmpty())
            game.uniqueCollider(self).interactuar(self)
    }

    method caerPorGravedad() {
        game.onTick(1800, "caerPorGravedad", {self.caer()})
    }

    method caer() {
        if (position.y() != 0 and not self.estaEnElNido()) {
            position = position.down(1)
        }
    }

}