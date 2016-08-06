import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameTest: XCTestCase {
    var game: Game!
    var frame: CGRect!
    var fakeGameViewer: FakeGameViewer!
    var fakeBlockGenerator: FakeBlockGenerator!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        fakeBlockGenerator = FakeBlockGenerator()
        game = Game(
            viewer: fakeGameViewer,
            blockGenerator: fakeBlockGenerator
        )
        frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 100, height: 100)
        )
        game.configure(frame)
    }
    func test_configure_presentsSceme() {
        expect(self.fakeGameViewer.presentScene_wasCalled).to(equal(true))
    }

    func test_configure_configuresView() {
        expect(self.fakeGameViewer.configure_wasCalled).to(equal(true))
        expect(self.fakeGameViewer.configure_arg).to(equal(frame))
    }

    func test_viewDidLoad_displaysNextBlock() {
        expect(self.fakeBlockGenerator.nextBlock_wasCalled).to(be(true))
        expect(self.fakeGameViewer.displayNextBlock_wasCalled).to(be(true))
    }
}
