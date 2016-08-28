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

    func test_next_returnsNextTetrominoActionWhenNoTetromino() {
        let gameState = GameState()
        let actionSelector = DefaultActionSelector(view: view, tetrominoGenerator: tetrominoGenerator)
        let action = actionSelector.next(gameState)

        expect(action as? NextTetrominoAction).toNot(beNil())
    }


    func test_next_returnsMoveTetrominoDownOneRowActionWhenTetrominoExists() {
        var gameState = GameState()
        gameState.tetromino =  STetromino()
        let actionSelector = DefaultActionSelector(view: view, tetrominoGenerator: tetrominoGenerator)
        let action = actionSelector.next(gameState)

        expect(action as? MoveTetrominoDownOneRowAction).toNot(beNil())
    }

    func test_next_returnsSettleTetrominoActionWhenTetrominoReacheesBottom() {
        var tetromino = STetromino()
        tetromino.position = (0, 20)
        var gameState = GameState()
        gameState.tetromino = tetromino
        let actionSelector = DefaultActionSelector(view: view, tetrominoGenerator: tetrominoGenerator)
        let action = actionSelector.next(gameState)

        expect(action as? SettleTetrominoAction).toNot(beNil())
    }
}