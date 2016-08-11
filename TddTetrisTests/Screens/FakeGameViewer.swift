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

    var displayNextBlock_wasCalled = false
    var displayNextBlock_arg: Block!
    func displayNextBlock(block: Block) {
        displayNextBlock_wasCalled = true
        displayNextBlock_arg = block
    }

    var moveBlockDownOneRow_wasCalled = false
    var moveBlockDownOneRow_arg: Block!
    func moveBlockDownOneRow(block: Block) {
        moveBlockDownOneRow_wasCalled = true
        moveBlockDownOneRow_arg = block
    }

}
