class SpyInputHandler: InputHandler {
    var didSwipeLeft_wasCalled = false
    func didSwipeLeft() {
        didSwipeLeft_wasCalled = true
    }

    var didSwipeRight_wasCalled = false
    func didSwipeRight() {
        didSwipeRight_wasCalled = true
    }
}