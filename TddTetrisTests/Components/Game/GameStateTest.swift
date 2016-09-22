import Foundation
import XCTest
import Nimble
@testable import TddTetris

class GameStateTest: XCTestCase {
    var state: GameState!

    override func setUp() {
        state = GameState()
    }

    func test_creates_arrayForGameBoard() {
        expect(self.state.cells.count).to(equal(GameState.COLUMNS))
        expect(self.state.cells[0].count).to(equal(GameState.ROWS))
    }

    func test_setAndGetCellStatus() {
        expect(self.state.cell(column: 0, row: 0)).to(equal(false))
        state.allocate(column: 0, row: 0)
        expect(self.state.cell(column: 0, row: 0)).to(equal(true))
    }

    func test_freeAnAllocatedCell() {
        state.allocate(column: 0, row: 0)
        state.free(column: 0, row: 0)
        expect(self.state.cell(column: 0, row: 0)).to(equal(false))
    }


    func test_getCellOutOfBounds() {
        expect(self.state.cell(column: GameState.COLUMNS+1, row: GameState.ROWS+1)).to(equal(false))
    }
}
