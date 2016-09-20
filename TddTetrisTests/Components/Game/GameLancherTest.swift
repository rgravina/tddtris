import XCTest
import Nimble
@testable import TddTetris

class GameLancherTest: XCTestCase {
    var launcher: Launcher!
    var frame: CGRect!
    var spyGameView: SpyGameView!
    var spyTickHandler: SpyTickHandler!
    var spyInputHandler: SpyInputHandler!

    override func setUp() {
        spyGameView = SpyGameView()
        spyTickHandler = SpyTickHandler()
        spyInputHandler = SpyInputHandler()
        launcher = GameLauncher(
            view: spyGameView,
            tickHandler: spyTickHandler,
            inputHandler: spyInputHandler
        )
        frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 100, height: 100)
        )
        launcher.configure(frame)
        launcher.start()
    }

    func test_configure_configuresGameView() {
        let args = self.spyGameView.configure_args
        expect(args?.delegate as! SpyTickHandler === self.spyTickHandler).to(equal(true))
        expect(args?.frame).to(equal(frame))
    }

    func test_start_presentsScene() {
        expect(self.spyGameView.presentScene_wasCalled).to(equal(true))
    }
}
