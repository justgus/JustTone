# Monophonic Tone Renderer

`MonophonicToneRenderer` is the platform-neutral, deterministic render core for T-0002. It owns one sine-wave oscillator and accepts only `DirectFrequency` values from the shared pitch domain. It begins silent and has no audio-session, route, UI, persistence, or playback side effects.

Its control-path operations select a frequency, explicitly start playback, adjust level, and stop. Start, stop, frequency changes, and level changes use finite sample ramps. Phase is continuous while the frequency changes; stopping renders a final zero-amplitude sample before moving to the silent state.

The render method writes only to a caller-owned `UnsafeMutableBufferPointer<Float>`. It has no collection-returning convenience API, platform-framework calls, file I/O, synchronization, or UI-observable mutation, so an audio owner can use it in a real-time callback after establishing exclusive access. Session, route, interruption, and hardware-output policy remain the responsibility of SP-006.

The default normalized output level is 0.12; callers may choose any validated level from 0 through 1. The output is bounded to that range and clamped to `[-1, 1]` as a final clipping guard.
