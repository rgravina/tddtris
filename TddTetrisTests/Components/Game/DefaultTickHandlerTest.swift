import XCTest
import Nimble
@testable import TddTetris

class DefaultTickHandlerTest: XCTestCase {
    var tickHandler: DefaultTickHandler!
    let view = SpyGameView()
    let tetrominoGenerator = SpyTetrominoGenerator()
    let timeKeeper = SpyTimeKeeper()

    override func setUp() {
        tickHandler = DefaultTickHandler(
            view: view,
            tetrominoGenerator: tetrominoGenerator,
            timeKeeper: timeKeeper
        )
    }

    func test_tick_generatesNewTetrominoWhenBlank() {
        tickHandler.tick()

        expect(self.tetrominoGenerator.next_wasCalled).to(equal(true))
    }

    
    func test_tick_movesTetrominoWhenNotBlank() {
        let tetromino = STetromino()
        tetrominoGenerator.next_return = tetromino

        tickHandler.tick()
        tickHandler.tick()

        expect(self.view.moveDownOneRow_arg as! STetromino === tetromino).to(equal(true))
    }
}
