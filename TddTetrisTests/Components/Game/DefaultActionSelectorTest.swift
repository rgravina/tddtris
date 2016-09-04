import XCTest
import Nimble
@testable import TddTetris

class DefaultActionSelectorTest: XCTestCase {
    var view: GameView!
    var tetrominoGenerator: SpyTetrominoGenerator!
    var collisionDetector: SpyCollisionDetector!

    override func setUp() {
        view = SpyGameView()
        tetrominoGenerator = SpyTetrominoGenerator()
        collisionDetector = SpyCollisionDetector()
    }

    func test_next_returnsNextTetrominoActionWhenNoTetromino() {
        let gameState = GameState()
        let actionSelector = DefaultActionSelector(
            view: view,
            state: gameState,
            tetrominoGenerator: tetrominoGenerator,
            collisionDetector: collisionDetector
        )

        let action = actionSelector.next()

        expect(action as? NextTetrominoAction).toNot(beNil())
    }

    func test_next_returnsMoveTetrominoDownOneRowActionWhenTetrominoExists() {
        let gameState = GameState()
        gameState.tetromino =  STetromino(
            position: (0, 0),
            blocks: [
                (column: 0, row: 0),
                (column: 0, row: 0),
                (column: 0, row: 0),
                (column: 0, row: 0)
            ]
        )

        let actionSelector = DefaultActionSelector(
            view: view,
            state: gameState,
            tetrominoGenerator: tetrominoGenerator,
            collisionDetector: collisionDetector
        )

        let action = actionSelector.next()

        expect(action as? MoveTetrominoDownOneRowAction).toNot(beNil())
    }

    func test_next_returnsSettleTetrominoActionWhenTetrominoWillCollide() {
        collisionDetector.wouldCollide_returnValue = true
        let gameState = GameState()
        gameState.tetromino = STetromino(
            position: (0, 0),
            blocks: [
                (column: 0, row: 0),
                (column: 0, row: 0),
                (column: 0, row: 0),
                (column: 0, row: 0)
            ]
        )

        let actionSelector = DefaultActionSelector(
            view: view,
            state: gameState,
            tetrominoGenerator: tetrominoGenerator,
            collisionDetector: collisionDetector
        )

        let action = actionSelector.next()

        expect(action as? SettleTetrominoAction).toNot(beNil())
    }
}