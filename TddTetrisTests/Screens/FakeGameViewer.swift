import UIKit
import SpriteKit
@testable import TddTetris

class FakeGameViewer: GameView {
    var view: UIView!
    var scene: SpriteKitGameScene!

    init() {
        view = UIView()
        scene = SpriteKitGameScene(size: boundsSize)
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
    var configure_arg: CGRect!
    func configure(frame: CGRect) {
        configure_wasCalled = true
        configure_arg = frame
    }

    var displayNextBlock_wasCalled = false
    var displayNextBlock_arg: Block!
    func displayNextBlock(block: Block) {
        displayNextBlock_wasCalled = true
        displayNextBlock_arg = block
    }
}
