import UIKit
import SpriteKit
@testable import TddTetris

class FakeGame: NSObject, Game, SKSceneDelegate {
    var viewer: GameView!
    func configure(frame: CGRect) {
    }

    func tick() {
    }

    func update(currentTime: NSTimeInterval, forScene scene: SKScene) {
    }
}