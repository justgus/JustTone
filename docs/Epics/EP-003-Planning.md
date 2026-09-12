# EP-003 — Audio Synthesis and Playback Planning

Status: PLAN-003 establishes proposed SP-004 through SP-006 and their Tasks. Approval of this plan does not activate a Sprint or authorize implementation.

## Delivery sequence

EP-003 is divided into three sequential Sprints because a deterministic render engine, its timbre qualification, and operating-system session behavior have different failure modes and evidence. Rendering can be measured repeatably; route, interruption, lock, background, Low Power Mode, and listening obligations require host and physical-device evidence later. Combining them would defer feedback on the realtime engine and obscure residual platform qualification.

| Sprint | Outcome | Rationale |
| --- | --- | --- |
| SP-004 | Monophonic realtime render engine | Establish one selected fundamental, click-free ramps, conservative level control, and deterministic buffer analysis before adding timbre variety. |
| SP-005 | Timbre definitions and signal qualification | Define the eight approved timbres and qualify pitch, sustain, clipping, aliasing, level, and transition properties against the established engine. |
| SP-006 | Audio session, route, interruption, and lifecycle behavior | Integrate iPhone and Watch playback with AVAudioSession/Watch audio behavior, truthful failures, explicit recovery, background/lock policy, and route qualification. |

The sprints are sequential. SP-005 requires SP-004 render evidence; SP-006 requires the selected-engine and timbre behavior from SP-004 and SP-005. No UI authoring, profile persistence, synchronization, catalog persistence, or microphone behavior is included.

## SP-004 — Monophonic Render Engine

Refine T-0002 to establish the isolated synthesis core and deterministic render qualification.

- Render exactly one selected fundamental at a time from the shared pitch-domain frequency input; never allocate, block, perform file I/O, or mutate UI-observed state on the render path.
- Define audio-command/state boundaries outside the render callback. Start, stop, pitch, and level transitions must apply finite ramps or crossfades that prevent discontinuities.
- Use a conservative default output level with explicit control. Do not begin playback implicitly.
- Begin with a baseline synthesized waveform; defer the approved timbre inventory to SP-005.
- Add deterministic buffer tests for requested fundamental frequency, monophony, amplitude bounds, ramp continuity, transition latency budget contribution, and no clipping.

Success criteria: a reviewable engine satisfies the deterministic portions of JT-AC-011 and JT-AC-012, plus the render contribution to JT-AC-010. JT-TEST-001, JT-TEST-018, JT-TEST-020, JT-TEST-021, JT-TEST-023 through JT-TEST-030, JT-TEST-102, JT-TEST-131 through JT-TEST-134 provide the primary evidence trace. Listening, route, and lifecycle acceptance remain downstream.

## SP-005 — Timbre Qualification

T-0016 defines and qualifies the eight approved synthesized timbres against the SP-004 engine.

- Represent timbre identifiers and parameters in a platform-neutral, versionable form shared by iPhone and Watch; do not introduce sampled instruments or bundled audio resources.
- Preserve the selected pitch as the fundamental throughout attack and sustained output. Where complexity cannot be maintained at the requested frequency, simplify without shifting the fundamental or introducing unstable artifacts.
- Qualify deterministic signal properties across the supported range: frequency accuracy, sustain stability, peak/clipping headroom, aliasing/bandwidth, stereo balance where applicable, normalized level comparison, and pitch/timbre transitions.
- Record physical-device and representative-route listening obligations separately. They are required for later verification, not claims made by automated tests.

Success criteria: JT-AC-011 and the signal-quality portions of JT-AC-012 have deterministic evidence for every approved timbre. JT-TEST-019, JT-TEST-022, JT-TEST-025, JT-TEST-030, JT-TEST-104 through JT-TEST-116, and JT-TEST-137 provide the primary trace.

## SP-006 — Session and Playback Lifecycle

T-0017 integrates the qualified engine with iPhone and Watch audio-session behavior.

- Configure the minimum required platform audio-session behavior, with no microphone access and no unapproved background mode or network service.
- Define deterministic state transitions for start/stop, interruptions, route changes, media-control actions, session activation failure, engine failure, and recovery. Route or failure handling must stop truthfully, retain the requested selection, and never restart unexpectedly.
- Qualify supported routes, Silent Mode, mixing, lock/background behavior, Low Power Mode, thermal behavior, audio-format adaptation, endurance, and playback energy. Simulator checks are distinct from required physical-device evidence.
- Document external-audio recommendations for unsupported or extreme pitch/route combinations without silently changing the requested pitch.

Success criteria: JT-AC-013 through JT-AC-015 have implementation evidence where simulation is meaningful, with residual physical-device qualification explicitly recorded. JT-TEST-032 through JT-TEST-040, JT-TEST-122, and JT-TEST-135 through JT-TEST-143 provide the primary trace.

## Acceptance boundaries

This plan does not mark EP-003 or any product acceptance criterion verified. Physical listening, all required device/route matrices, energy and thermal measurements, and background behavior must be carried as explicit evidence through implementation and user review. The following responsibilities remain outside this Epic:

| Obligation | Later owner |
| --- | --- |
| Profile selection, browsing, and authoring controls | EP-004 / EP-005 |
| Watch synchronization and independent Watch presentation | EP-006 |
| Hearing-safety copy, accessibility, and resilience acceptance | EP-007 |
| Full device listening and release qualification | EP-008 and user review |

## Verification plan

For authorized implementation, use `/Applications/Xcode-beta.app/Contents/Developer`. Run deterministic shared-package tests first, inspect schemes and destinations before selecting iPhone and paired Watch simulators or devices, and record actual commands and results in each Task. Do not represent simulator output as physical listening, route, energy, or thermal qualification.
