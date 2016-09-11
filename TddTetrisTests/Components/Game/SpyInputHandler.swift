@testable import TddTetris

class SpyInputHandler: InputHandler {
    var didSwipeLeft_wasCalled = false
    func didSwipeLeft() {
        didSwipeLeft_wasCalled = true
    }

    var didSwipeRight_wasCalled = false
    func didSwipeRight() {
        didSwipeRight_wasCalled = true
    }

    var didSwipeDown_wasCalled = false
    func didSwipeDown() {
        didSwipeDown_wasCalled = true
    }

    var didTap_wasCalled = false
    func didTap() {
        didTap_wasCalled = true
    }
}