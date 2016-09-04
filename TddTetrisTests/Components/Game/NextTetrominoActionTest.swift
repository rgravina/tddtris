import Foundation
import XCTest
import Nimble
@testable import TddTetris

class NextTetrominoActionTest: XCTestCase {
    var tetrominoGenerator: SpyTetrominoGenerator!

    override func setUp() {
        tetrominoGenerator = SpyTetrominoGenerator()
    }

    func test_perform_generatesNewTetromino() {
        let gameState = GameState()
        let tetromino = STetromino()
        tetrominoGenerator.next_return = tetromino

        let action = NextTetrominoAction(
            view: SpyGameView(),
            state: gameState,
            tetrominoGenerator: tetrominoGenerator
        )

        action.perform()

        expect(self.tetrominoGenerator.next_wasCalled).to(beTrue())
        expect(gameState.tetromino as? STetromino).toNot(beNil())
    }

    func test_perform_updatesGameState() {
        let gameState = GameState()
        tetrominoGenerator.next_return = STetromino(
            position: (3, 0),
            blocks: [
                (column: 3, row: 1),
                (column: 4, row: 0),
                (column: 4, row: 1),
                (column: 5, row: 0)
            ]
        )

        let action = NextTetrominoAction(
            view: SpyGameView(),
            state: gameState,
            tetrominoGenerator: tetrominoGenerator
        )

        action.perform()

        expect(gameState.cells[3][0]).to(beFalse())
        expect(gameState.cells[3][1]).to(beTrue())
        expect(gameState.cells[4][0]).to(beTrue())
        expect(gameState.cells[4][1]).to(beTrue())
        expect(gameState.cells[5][0]).to(beTrue())
        expect(gameState.cells[5][1]).to(beFalse())
    }
}