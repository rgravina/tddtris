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
        gameVC = GameViewController(
            viewer: fakeGameViewer,
            blockGenerator: fakeBlockGenerator
        )
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_presentsSceme() {
        expect(self.fakeGameViewer.presentScene_wasCalled).to(equal(true))
    }

    func test_viewDidLoad_configuresView() {
        expect(self.fakeGameViewer.configure_wasCalled).to(equal(true))
        expect(self.fakeGameViewer.configure_arg).to(equal(gameVC.view.frame))
    }

    func test_viewDidLoad_addsSubviews() {
        expect(self.gameVC.view).to(containSubview(fakeGameViewer.view))
    }

    func test_viewDidLoad_displaysNextBlock() {
        expect(self.fakeBlockGenerator.nextBlock_wasCalled).to(be(true))
        expect(self.fakeGameViewer.displayNextBlock_wasCalled).to(be(true))
    }
}
