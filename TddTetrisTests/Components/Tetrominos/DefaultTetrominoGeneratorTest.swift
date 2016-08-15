import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class DefaultTetrominoGeneratorTest: XCTestCase {
    var generator: DefaultTetrominoGenerator!

    override func setUp() {
        generator = DefaultTetrominoGenerator()
    }
}
