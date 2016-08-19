import UIKit
@testable import TddTetris

class FakeGame: Game {
    var view: UIView

    init () {
        view = UIView()
    }

    func configure(frame: CGRect) {
    }

    func update(currentTime: NSTimeInterval) {
    }

    func tick() {
    }

    func start() {
    }
}