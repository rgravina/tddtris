import UIKit
@testable import TddTetris

class FakeLauncher: Launcher {
    var view: UIView

    init () {
        view = UIView()
    }

    func configure(frame: CGRect) {
    }

    func start() {
    }
}