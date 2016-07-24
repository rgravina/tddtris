import XCTest
import Nimble
import SpriteKit
@testable import TddTetris

class DefaultBlockGeneratorTest: XCTestCase {
    var blockGenerator: DefaultBlockGenerator!

    override func setUp() {
        blockGenerator = DefaultBlockGenerator()
    }

    func test_nextBlock_returnsBlock() {        expect(self.blockGenerator.nextBlock()).to(beAKindOf(Block))
    }
}
