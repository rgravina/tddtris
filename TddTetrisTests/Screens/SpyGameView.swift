import UIKit
@testable import TddTetris

class SpyGameView: GameView {
    var view: UIView!

    init() {
        view = UIView()
    }

    var presentScene_wasCalled = false
    func presentScene() {
        presentScene_wasCalled = true
    }

    var boundsSize = CGSize(width: 100, height: 200)
    func size() -> CGSize {
        return boundsSize
    }

    var configure_wasCalled = false
    var configure_args: (delegate: TickHandler, inputHandler: InputHandler, frame: CGRect)!
    func configure(_ game: TickHandler, inputHandler: InputHandler, frame: CGRect) {
        configure_wasCalled = true
        configure_args = (delegate: game, inputHandler: inputHandler, frame: frame)
    }

    var displayNext_wasCalled = false
    var displayNext_arg: Tetromino!
    func displayNext(_ tetromino: Tetromino) {
        displayNext_wasCalled = true
        displayNext_arg = tetromino
    }

    var move_wasCalled = false
    var move_arg: Tetromino!
    func move(_ tetromino: Tetromino) {
        move_arg = tetromino
        move_wasCalled = true
    }

    var display_wasCalled = false
    var display_arg: Tetromino!
    func display(_ tetromino: Tetromino) {
        display_arg = tetromino
        display_wasCalled = true
    }
}
