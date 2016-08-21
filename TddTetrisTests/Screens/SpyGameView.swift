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
    var configure_args: (delegate: TickHandler, frame: CGRect)!
    func configure(game: TickHandler, frame: CGRect) {
        configure_wasCalled = true
        configure_args = (game, frame: frame)
    }

    var displayNext_wasCalled = false
    var displayNext_arg: Tetromino!
    func displayNext(tetromino: Tetromino) {
        displayNext_wasCalled = true
        displayNext_arg = tetromino
    }

    var moveDownOneRow_wasCalled = false
    var moveDownOneRow_arg: Tetromino!
    func moveDownOneRow(tetromino: Tetromino) {
        moveDownOneRow_wasCalled = true
        moveDownOneRow_arg = tetromino
    }

}
