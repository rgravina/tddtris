import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameViewControllerTest: XCTestCase {
    var gameVC: GameViewController!
    var fakeGameViewer: FakeGameViewer!
    var fakeBlockGenerator: FakeBlockGenerator!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        fakeBlockGenerator = FakeBlockGenerator()
        let game = Game(
            viewer: fakeGameViewer,
            blockGenerator: fakeBlockGenerator
        )
        gameVC = GameViewController(game: game)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(fakeGameViewer.view))
    }
}
