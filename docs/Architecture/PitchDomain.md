# Pitch Domain Semantics

`JustToneCore` represents named pitch identity separately from calculated frequency. `NamedPitch` retains its note letter, accidental, and octave verbatim, so enharmonic spellings such as C♯4 and D♭4 calculate to the same sounding frequency without becoming the same value.

The default calculation is twelve-tone equal temperament with A4 at 440.0 Hz. `ReferencePitch` stores valid A4 values as an integer number of tenths of a hertz (3,500 through 5,000), while `DirectFrequency` stores its valid range (160 through 120,000 tenths) the same way. This avoids locale-dependent parsing and prevents entry/display precision from reducing calculation precision.

Invalid non-finite values, values outside the supported ranges, and values not exactly representable to a tenth of a hertz are rejected with `PitchValidationError`; they are never silently normalized. Named-pitch frequency calculation keeps `Double` precision and reports arithmetic overflow deterministically.

`WrittenSoundingPitch` retains its written `NamedPitch` and records the sounding displacement in semitones. Transposition changes only that displacement, so applying an inverse displacement round-trips exactly and the musician's original spelling remains available throughout.

`PitchDomainFixtures` provides independently calculated twelve-tone frequency points and the complete supported reference range to the package, iPhone, and Watch test hosts. It keeps cross-platform calculation checks on the same inputs without coupling the domain to a UI or test framework.
