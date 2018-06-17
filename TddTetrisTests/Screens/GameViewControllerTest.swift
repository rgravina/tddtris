import XCTest
import Nimble
@testable import TddTetris

class GameViewControllerTest: XCTestCase {
    var gameVC: GameViewController!
    var spyLauncher: SpyLauncher!

    override func setUp() {
        spyLauncher = SpyLauncher()
        gameVC = GameViewController(launcher: spyLauncher)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_passesFrameToConfigure() {
        expect(self.spyLauncher.configure_arguments).to(equal(gameVC.view.frame))
    }

    func test_viewDidLoad_callsStart() {
        expect(self.spyLauncher.start_wasCalled).to(equal(true))
    }
}
