import XCTest
import Nimble
@testable import TddTetris

class DefaultActionSelectorTest: XCTestCase {

    func test_next_returnsNextTetrominoActionWhenNoTetromino() {
        let gameState = GameState()
        let actionSelector = DefaultActionSelector()
        let action = actionSelector.next(gameState)

        expect(action as? NextTetrominoAction).toNot(beNil())
    }


    func test_next_returnsMoveTetrominoDownOneRowActionWhenTetrominoExists() {
        let gameState = GameState(tetromino: STetromino())
        let actionSelector = DefaultActionSelector()
        let action = actionSelector.next(gameState)

        expect(action as? MoveTetrominoDownOneRowAction).toNot(beNil())
    }
}