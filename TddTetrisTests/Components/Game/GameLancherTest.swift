import XCTest
import Nimble
@testable import TddTetris

class GameLancherTest: XCTestCase {
    var launcher: Launcher!
    var frame: CGRect!
    var fakeGameViewer: FakeGameViewer!
    var fakeTetrominoGenerator: FakeTetrominoGenerator!
    var fakeTimeKeeper: FakeTimeKeeper!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        fakeTimeKeeper = FakeTimeKeeper()
        launcher = GameLauncher(
            view: fakeGameViewer,
            tickHandler: FakeTickHandler()
        )
        frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 100, height: 100)
        )
        launcher.configure(frame)
        launcher.start()
    }

    func test_start_presentsSceme() {
        expect(self.fakeGameViewer.presentScene_wasCalled).to(equal(true))
    }

    func test_configure_configuresView() {
        expect(self.fakeGameViewer.configure_wasCalled).to(equal(true))
    }
}
