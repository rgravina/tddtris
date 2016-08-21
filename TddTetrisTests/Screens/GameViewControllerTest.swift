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

    func test_viewDidLoad_callsStart() {
        expect(self.spyLauncher.start_wasCalled).to(equal(true))
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(spyLauncher.view))
    }
}
