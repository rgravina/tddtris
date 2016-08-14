import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class GameTest: XCTestCase {
    var game: Game!
    var frame: CGRect!
    var fakeGameViewer: FakeGameViewer!
    var fakeBlockGenerator: FakeBlockGenerator!
    var fakeTimeKeeper: FakeTimeKeeper!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        fakeBlockGenerator = FakeBlockGenerator()
        fakeTimeKeeper = FakeTimeKeeper()
        game = TetrisGame(
            viewer: fakeGameViewer,
            blockGenerator: fakeBlockGenerator,
            timeKeeper: fakeTimeKeeper
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
    }

    func test_viewDidLoad_displaysNextBlock() {
        expect(self.fakeBlockGenerator.nextBlock_wasCalled).to(be(true))
        expect(self.fakeGameViewer.displayNextBlock_wasCalled).to(be(true))
    }
}
