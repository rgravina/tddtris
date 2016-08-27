import XCTest
import Nimble
@testable import TddTetris

class DefaultTickHandlerTest: XCTestCase {
    var tickHandler: DefaultTickHandler!
    let view = SpyGameView()
    let tetrominoGenerator = SpyTetrominoGenerator()
    let timeKeeper = SpyTimeKeeper()
    let actionSelector = SpyActionSelector()

    override func setUp() {
        tickHandler = DefaultTickHandler(
            view: view,
            tetrominoGenerator: tetrominoGenerator,
            timeKeeper: timeKeeper,
            actionSelector: actionSelector
        )
    }

    func test_tick_performsNextAction() {
        let nextAction = SpyAction()
        actionSelector.next_returnValue = nextAction

        tickHandler.tick()

        expect(self.actionSelector.next_wasCalled).to(equal(true))
        expect(nextAction.perform_wasCalled).to(equal(true))
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
