import UIKit
@testable import TddTetris

class SpyLauncher: Launcher {
    var view: UIView

    init () {
        view = UIView()
    }

    func configure(frame: CGRect) {
    }

    var start_wasCalled = false
    func start() {
        start_wasCalled = true
    }
}