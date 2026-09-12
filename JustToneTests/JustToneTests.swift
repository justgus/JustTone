import Testing
import JustToneCore
@testable import JustTone

struct JustToneTests {
    @Test func sharedPitchFixturesRunInTheIPhoneHost() throws {
        for (pitch, expected) in PitchDomainFixtures.twelveToneEqualTemperament {
            let frequency = try Pitch.named(pitch).frequency()
            #expect(abs(frequency - expected) < 0.000_000_001)
        }

        let a4 = Pitch.named(NamedPitch(letter: .a, octave: 4))
        for tenths in PitchDomainFixtures.referenceTenthsOfHertz {
            let reference = try ReferencePitch(hertz: Double(tenths) / 10)
            #expect(try a4.frequency(using: reference) == reference.hertz)
        }
    }

    @Test func sharedTuningFixturesRunInTheIPhoneHost() throws {
        let values = try TuningDomainFixtures.qualificationSystem().resolvedFrequencies()
        #expect(values == TuningDomainFixtures.expectedDefaultFrequencies)

        let adjustedValues = try TuningDomainFixtures.qualificationSystem().resolvedFrequencies(
            using: ReferencePitch(hertz: 442)
        )
        #expect(adjustedValues[3] == 432)
        #expect(adjustedValues[1] == 663)
    }
}
