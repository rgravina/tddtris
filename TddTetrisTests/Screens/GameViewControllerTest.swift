import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameViewControllerTest: XCTestCase {
    var gameVC: GameViewController!
    var fakeGameViewer: FakeGameViewer!
    var fakeBlockGenerator: FakeBlockGenerator!
    var fakeTimeKeeper: FakeTimeKeeper!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        fakeBlockGenerator = FakeBlockGenerator()
        fakeTimeKeeper = FakeTimeKeeper()
        let game = DefaultGame(
            viewer: fakeGameViewer,
            blockGenerator: fakeBlockGenerator,
            timeKeeper: fakeTimeKeeper
        )
        gameVC = GameViewController(game: game)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(fakeGameViewer.view))
    }
}
