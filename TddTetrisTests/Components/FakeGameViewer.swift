import UIKit
import SpriteKit
@testable import TddTetris

class FakeGameViewer: GameView {
    var view: SKView!

    init() {
        view = SKView()
    }

    var presentScene_wasCalled = false
    func presentScene(scene: GameScene) {
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
}
