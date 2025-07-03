import XCTest

final class CounterAppUITests: XCTestCase {
    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 5))
    }
}
