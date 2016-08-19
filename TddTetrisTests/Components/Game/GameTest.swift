import XCTest
import Nimble
@testable import TddTetris

class GameTest: XCTestCase {
    var game: Game!
    var frame: CGRect!
    var fakeGameViewer: FakeGameViewer!
    var fakeTetrominoGenerator: FakeTetrominoGenerator!
    var fakeTimeKeeper: FakeTimeKeeper!

    override func setUp() {
        fakeGameViewer = FakeGameViewer()
        fakeTetrominoGenerator = FakeTetrominoGenerator()
        fakeTimeKeeper = FakeTimeKeeper()
        game = TetrisGame(
            viewer: fakeGameViewer,
            tetrominoGenerator: fakeTetrominoGenerator,
            timeKeeper: fakeTimeKeeper
        )
        frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: 100, height: 100)
        )
        game.configure(frame)
        game.start()
    }

    func test_start_presentsSceme() {
        expect(self.fakeGameViewer.presentScene_wasCalled).to(equal(true))
    }

    func test_configure_configuresView() {
        expect(self.fakeGameViewer.configure_wasCalled).to(equal(true))
    }

    func test_start_displaysNextTetromino() {
        expect(self.fakeTetrominoGenerator.next_wasCalled).to(be(true))
        expect(self.fakeGameViewer.displayNext_wasCalled).to(be(true))
    }
}
