import XCTest
import Nimble
@testable import TddTetris

class GameViewControllerTest: XCTestCase {
    var gameVC: GameViewController!
    var fakeGameViewer: FakeGameViewer!
    var fakeTetrominoGenerator: FakeTetrominoGenerator!
    var fakeTimeKeeper: FakeTimeKeeper!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        let launcher = GameLauncher(
            view: fakeGameViewer,
            tickHandler: FakeTickHandler()
        )
        gameVC = GameViewController(launcher: launcher)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(fakeGameViewer.view))
    }
}
