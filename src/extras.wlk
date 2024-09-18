import pepita.*
import wollok.game.*

object nido {

    method position() = game.at(5,8)
    method image() = "nido.png"
    method energiaQueOtorga() = 0

    method interactuar(algo){
        
    }

}

object silvestre {

    method position() = game.at(pepita.position().x().max(3),0)
    method image() = "silvestre.png"
    method interactuar(algo){
    }
}

object gameOver {
    method position() = game.center()
    method image() = "game-over.png"
}