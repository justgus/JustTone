import Testing
import JustToneCore
@testable import JustTone

struct JustToneTests {
    @Test func projectLoads() {
        #expect(JustToneCoreVersion.current == 1)
    }
}
