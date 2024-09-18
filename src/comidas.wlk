import wollok.game.*
import extras.*


object manzana {

    method energiaQueOtorga() = 40

    method position() = game.at(2,8)
    method image() = "manzana.png"

    method interactuar(algo){
        algo.come(self)
    }


}

object alpiste {

    method position() = game.at(2,2)
    method image() = "alpiste.png" 

    method energiaQueOtorga() = 50

    method interactuar(algo){
        algo.come(self)
    }

}