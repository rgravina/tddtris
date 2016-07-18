import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameViewControllerTest: XCTestCase {
    var gameVC: GameViewController!
    var fakeGameViewer: FakeGameViewer!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        gameVC = GameViewController(viewer: fakeGameViewer)
        gameVC.viewDidLoad()
    }

    func test_viewDidLoad_createsGameScene() {
        expect(self.gameVC.scene).to(beAKindOf(GameScene))
    }

    func test_viewDidLoad_setsScaleModeToAspectFill() {
        expect(self.gameVC.scene.scaleMode).to(equal(SKSceneScaleMode.AspectFill))
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

    func test_viewDidLoad_createsSceneBoundToScreenSize() {
        expect(self.gameVC.scene.size).to(equal(CGSizeMake(100, 200)))
    }
}
