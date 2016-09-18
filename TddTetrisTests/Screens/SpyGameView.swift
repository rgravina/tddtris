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

    var boundsSize = CGSizeMake(100, 200)
    func size() -> CGSize {
        return boundsSize
    }

    var configure_wasCalled = false
    var configure_args: (delegate: TickHandler, inputHandler: InputHandler, frame: CGRect)!
    func configure(game: TickHandler, inputHandler: InputHandler, frame: CGRect) {
        configure_wasCalled = true
        configure_args = (delegate: game, inputHandler: inputHandler, frame: frame)
    }

    var displayNext_wasCalled = false
    var displayNext_arg: Tetromino!
    func displayNext(tetromino: Tetromino) {
        displayNext_wasCalled = true
        displayNext_arg = tetromino
    }

    var move_wasCalled = false
    var move_arg: Tetromino!
    func move(tetromino: Tetromino) {
        move_arg = tetromino
        move_wasCalled = true
    }

    var rotate_wasCalled = false
    func rotate() {
        rotate_wasCalled = true
    }
}
