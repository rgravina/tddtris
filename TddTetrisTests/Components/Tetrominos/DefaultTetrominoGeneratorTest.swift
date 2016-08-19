import XCTest
import Nimble
@testable import TddTetris

class DefaultTetrominoGeneratorTest: XCTestCase {
    var generator: DefaultTetrominoGenerator!

    override func setUp() {
        generator = DefaultTetrominoGenerator()
    }
}
