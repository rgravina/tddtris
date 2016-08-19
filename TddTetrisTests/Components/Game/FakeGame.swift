import UIKit
import SpriteKit
@testable import TddTetris

class FakeGame: NSObject, Game, SKSceneDelegate {
    var view: UIView

    override init() {
        view = UIView()
        super.init()
    }

    func configure(frame: CGRect) {
    }

    func tick() {
    }

    func start() {
    }

    func update(currentTime: NSTimeInterval, forScene scene: SKScene) {
    }
}