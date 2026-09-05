import XCTest

final class JustToneUITests: XCTestCase {
    func testLaunchesWithoutPlayback() {
        let app = XCUIApplication()
        app.launch()
        XCTAssertTrue(app.staticTexts["JustTone"].waitForExistence(timeout: 5))
    }
}
