import XCTest
import Nimble
@testable import TddTetris

class DefaultActionSelectorTest: XCTestCase {
    var view: GameView!
    var tetrominoGenerator: TetrominoGenerator!

    override func setUp() {
        view = SpyGameView()
        tetrominoGenerator = SpyTetrominoGenerator()
    }

    func test_next_returnsNextTetrominoActionWhernNoTetromino() {
        let gameState = GameState()
        let actionSelector = DefaultActionSelector(view: view, tetrominoGenerator: tetrominoGenerator)
        let action = actionSelector.next(gameState)

        expect(action as? NextTetrominoAction).toNot(beNil())
    }


    func test_next_returnsMoveTetrominoDownOneRowActionWhenTetrominoExists() {
        let gameState = GameState(tetromino: STetromino(position: (0, 0)))
        let actionSelector = DefaultActionSelector(view: view, tetrominoGenerator: tetrominoGenerator)
        let action = actionSelector.next(gameState)

        expect(action as? MoveTetrominoDownOneRowAction).toNot(beNil())
    }

    func test_next_returnsSettleTetrominoActionWhenTetrominoReacheesBottom() {
        let tetromino = STetromino(position: (0, 20))
        let gameState = GameState(tetromino: tetromino)
        let actionSelector = DefaultActionSelector(view: view, tetrominoGenerator: tetrominoGenerator)
        let action = actionSelector.next(gameState)

        expect(action as? SettleTetrominoAction).toNot(beNil())
    }
}