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
        fakeTetrominoGenerator = FakeTetrominoGenerator()
        fakeTimeKeeper = FakeTimeKeeper()
        let game = TetrisGame(
            viewer: fakeGameViewer,
            tetrominoGenerator: fakeTetrominoGenerator,
            timeKeeper: fakeTimeKeeper
        )
        gameVC = GameViewController(game: game)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(fakeGameViewer.view))
    }
}
