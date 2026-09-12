import Testing
import JustToneCore
@testable import JustToneWatch

struct JustToneWatchTests {
    @Test func sharedPitchFixturesRunInTheWatchHost() throws {
        for (pitch, expected) in PitchDomainFixtures.twelveToneEqualTemperament {
            let frequency = try Pitch.named(pitch).frequency()
            #expect(abs(frequency - expected) < 0.000_000_001)
        }

        let a4 = Pitch.named(NamedPitch(letter: .a, octave: 4))
        for tenths in PitchDomainFixtures.referenceTenthsOfHertz {
            let reference = try ReferencePitch(hertz: Double(tenths) / 10)
            #expect(try a4.frequency(using: reference) == reference.hertz)
        }

        let written = NamedPitch(letter: .g, accidental: .flat, octave: 4)
        let sounding = try WrittenSoundingPitch(written: written).transposed(by: -2)

        #expect(sounding.written == written)
        #expect(try sounding.soundingFrequency() > 0)
    }

    @Test func sharedTuningFixturesRunInTheWatchHost() throws {
        let values = try TuningDomainFixtures.qualificationSystem().resolvedFrequencies()
        #expect(values == TuningDomainFixtures.expectedDefaultFrequencies)

        let adjustedValues = try TuningDomainFixtures.qualificationSystem().resolvedFrequencies(
            using: ReferencePitch(hertz: 442)
        )
        #expect(adjustedValues[3] == 432)
        #expect(adjustedValues[1] == 663)
    }
}
