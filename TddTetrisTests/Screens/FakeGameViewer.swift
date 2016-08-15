import UIKit
import SpriteKit
@testable import TddTetris

class FakeGameViewer: GameView {
    var view: UIView!
    var scene: SpriteKitGameScene!

    init() {
        view = UIView()
        scene = SpriteKitGameScene(game: FakeGame(), size: boundsSize, timeKeeper: FakeTimeKeeper())
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
    var configure_args: (delegate: Game, frame: CGRect, timeKeeper: TimeKeeper)!
    func configure(game: Game, frame: CGRect, timeKeeper: TimeKeeper) {
        configure_wasCalled = true
        configure_args = (game, frame: frame, timeKeeper: timeKeeper)
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
