import UIKit
@testable import TddTetris

class SpyLauncher: Launcher {
    var view: UIView

    init () {
        view = UIView()
    }

    var configure_arguments: CGRect!
    func configure(frame: CGRect) {
        configure_arguments = frame
    }

    var start_wasCalled = false
    func start() {
        start_wasCalled = true
    }
}