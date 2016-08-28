import XCTest
import Nimble
@testable import TddTetris

class DefaultActionSelectorTest: XCTestCase {
    var view: GameView!
    var tetrominoGenerator: SpyTetrominoGenerator!
    var actionSelector: DefaultActionSelector!
    var collisionDetector: SpyCollisionDetector!

    override func setUp() {
        view = SpyGameView()
        tetrominoGenerator = SpyTetrominoGenerator()
        collisionDetector = SpyCollisionDetector()
        actionSelector = DefaultActionSelector(
            view: view,
            tetrominoGenerator: tetrominoGenerator,
            collisionDetector: collisionDetector
        )
    }

    func test_next_returnsNextTetrominoActionWhenNoTetromino() {
        let gameState = GameState()
        let action = actionSelector.next(gameState)

        expect(action as? NextTetrominoAction).toNot(beNil())
    }

    func test_next_returnsMoveTetrominoDownOneRowActionWhenTetrominoExists() {
        var gameState = GameState()
        gameState.tetromino =  STetromino()
        let action = actionSelector.next(gameState)

        expect(action as? MoveTetrominoDownOneRowAction).toNot(beNil())
    }

    func test_next_returnsSettleTetrominoActionWhenTetrominoWillCollide() {
        collisionDetector.wouldCollide_returnValue = true
        var gameState = GameState()
        gameState.tetromino =  STetromino()
        let action = actionSelector.next(gameState)

        expect(action as? SettleTetrominoAction).toNot(beNil())
    }
}