import Foundation
import XCTest
import Nimble
@testable import TddTetris

class NextTetrominoActionTest: XCTestCase {
    var action: NextTetrominoAction!
    var tetrominoGenerator: SpyTetrominoGenerator!

    override func setUp() {
        tetrominoGenerator = SpyTetrominoGenerator()
        action = NextTetrominoAction(
            view: SpyGameView(),
            tetrominoGenerator: tetrominoGenerator
        )
    }

    func test_perform_generatesNewTetromino() {
        let gameState = GameState()
        let tetromino = STetromino()
        tetrominoGenerator.next_return = tetromino

        let nextState = action.perform(gameState)

        expect(self.tetrominoGenerator.next_wasCalled).to(beTrue())
        expect(nextState.tetromino as? STetromino).toNot(beNil())
    }

    func test_perform_updatesGameState() {
        let gameState = GameState()
        tetrominoGenerator.next_return = STetromino(
            position: (0, 0),
            blocks: [
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0)
            ]
        )

        let nextState = action.perform(gameState)

        expect(nextState.cells[3][0]).to(beFalse())
        expect(nextState.cells[3][1]).to(beTrue())
        expect(nextState.cells[4][0]).to(beTrue())
        expect(nextState.cells[4][1]).to(beTrue())
        expect(nextState.cells[5][0]).to(beTrue())
        expect(nextState.cells[5][1]).to(beFalse())
    }
}