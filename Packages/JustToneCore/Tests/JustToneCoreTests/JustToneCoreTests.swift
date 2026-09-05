import Testing
@testable import JustToneCore

struct JustToneCoreTests {
    @Test func versionIsPositive() {
        #expect(JustToneCoreVersion.current > 0)
    }
}
