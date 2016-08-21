import XCTest
import Nimble
@testable import TddTetris

class GameViewControllerTest: XCTestCase {
    var gameVC: GameViewController!
    var spyGameView: SpyGameView!
    var spyTetrominoGenerator: SpyTetrominoGenerator!
    var spyTimeKeeper: SpyTimeKeeper!

    override func setUp() {
        spyGameView = SpyGameView()
        let launcher = GameLauncher(
            view: spyGameView,
            tickHandler: SpyTickHandler()
        )
        gameVC = GameViewController(launcher: launcher)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(spyGameView.view))
    }
}
