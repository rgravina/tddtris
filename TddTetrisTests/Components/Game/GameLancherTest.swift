import XCTest
import Nimble
@testable import TddTetris

class GameLancherTest: XCTestCase {
    var launcher: Launcher!
    var frame: CGRect!
    var spyGameView: SpyGameView!
    var spyTetrominoGenerator: SpyTetrominoGenerator!
    var spyTimeKeeper: SpyTimeKeeper!

    override func setUp() {
        spyGameView = SpyGameView()
        spyTimeKeeper = SpyTimeKeeper()
        launcher = GameLauncher(
            view: spyGameView,
            tickHandler: SpyTickHandler()
        )
        frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 100, height: 100)
        )
        launcher.configure(frame)
        launcher.start()
    }

    func test_start_presentsSceme() {
        expect(self.spyGameView.presentScene_wasCalled).to(equal(true))
    }

    func test_configure_configuresView() {
        expect(self.spyGameView.configure_wasCalled).to(equal(true))
    }
}
