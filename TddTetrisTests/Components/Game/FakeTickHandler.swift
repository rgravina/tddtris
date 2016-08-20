import UIKit
@testable import TddTetris

class FakeTickHandler: TickHandler {
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