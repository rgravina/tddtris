import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameViewerTest: XCTestCase {
    var gameViewer: GameViewer!

    override func setUp() {
        gameViewer = GameViewer()
        gameViewer.configure(
            CGRectMake(0, 0, 100, 200)
        )
    }

    func test_configure_createsGameScene() {
        expect(self.gameViewer.scene).to(beAKindOf(GameScene))
    }

    func test_configure_setsScaleModeToAspectFill() {
        expect(self.gameViewer.scene.scaleMode).to(equal(SKSceneScaleMode.AspectFill))
    }

    func test_configure_createsSceneBoundToScreenSize() {
        expect(self.gameViewer.scene.size).to(equal(CGSizeMake(100, 200)))
    }
}
