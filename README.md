# Deutsch Daily

A local-first, vocabulary-first SwiftUI iPhone prototype for an English-speaking
learner returning after A1. Everyday communication comes first; B1 is a direction,
not a promised outcome. No account, analytics, ads, external API, or third-party
runtime dependencies.

## Run on an iPhone or Simulator

Requires **macOS, Xcode 16 or newer, and iOS 17 or newer**. Linux can test the
shared learning logic, but cannot build SwiftUI, AVFoundation, or Speech.

1. Open `DeutschDaily.xcodeproj` in Xcode. The shared **DeutschDaily** scheme
   includes the local **LearningCore** Swift package; no project generation or
   package downloads are needed.
2. Select an installed iPhone simulator, then Product → Run.
3. For a real iPhone, choose your development team under Signing & Capabilities,
   replace `com.example.DeutschDaily` with your own unique bundle identifier,
   enable Developer Mode on the phone if prompted, and Run.
4. Start with the short knowledge check, or skip it. The default is five new
   items and a flexible 35-minute target. Change either in Settings; zero new
   items gives a review-only day.

Command-line simulator build (from the checkout directory):

```sh
xcodebuild -project DeutschDaily.xcodeproj -scheme DeutschDaily \
  -configuration Debug -sdk iphonesimulator \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath /tmp/DeutschDailyDerivedData CODE_SIGNING_ALLOWED=NO build
```

Choose a concrete installed simulator in Xcode to launch the built app.
Signing is needed only for a physical device. This is a development prototype,
not an App Store distribution: release artwork, distribution signing, and
store submission are out of scope.

## What to try

- **Starting check:** listening recognition, meaning recognition, then independent
  German recall. Familiar recognition delays an item's next review without
  claiming it was recalled. This is a three-item self-check, not an A1/B1
  placement examination. It uses today's new-item allowance: lower allowances
  shorten the check, and zero skips new samples.
- **Today:** oldest due reviews, new vocabulary, prepared speaking, then a short
  personal writing/listening activity. The 30–40 minute plan is a suggested
  routine, not a measured duration. More time comes from reusing phrases, not
  unlocking large amounts of new vocabulary.
- **Course:** seven learning steps, not seven calendar deadlines:

  | Step | Theme |
  | --- | --- |
  | 1 | Introductions |
  | 2 | Daily routine |
  | 3 | Shopping |
  | 4 | Appointments |
  | 5 | Transport |
  | 6 | Problems and requests |
  | 7 | Review and use of earlier vocabulary |

- **Appointment lesson:** `der Termin / die Termine`, `einen Termin vereinbaren`,
  `verschieben`, `Zeit haben`, and `Es passt mir.` with English meanings, natural
  examples, audio, cues, editable personal associations, and recall practice.
  You may choose this lesson first through Course. The daily allowance still
  applies; set it to ten in Settings if the starting check used some of today's
  allowance and you want to explore all five appointment cards immediately.
- **Recall:** translate into German, recognize audio in English, and a prepared
  appointment sentence completion. Try before revealing; compare with suggested
  answers, then choose Again / Hard / Good. Matching tolerates punctuation, case
  and common German keyboard spellings, but cannot assess every valid paraphrase.
  You make the final meaning-based assessment. Listening recognition, hints and
  card visits do not inflate successful independent recall totals.
- **Speaking:** repeat → guided answer → unaided prompt → prepared receptionist
  dialogue. Choose make-an-appointment or change-an-appointment paths. The next
  receptionist line follows that explicit choice, not AI interpretation. Hints
  and suggested responses remain available. Edit a transcript or type instead.
- **Progress:** encountered items, items recalled at least once, total successful
  attempts, completed lessons, difficult vocabulary, and recent learning
  activity. Visiting every card enables lesson completion; this is not mastery.

## Scheduling and persistence

The shared core implements a small deterministic spaced-recall scheduler, not a
validated adaptive-learning algorithm. Again brings an item back soon; Hard
uses a shorter interval than Good. Every independent review rating and its date
is persisted locally. Recognition and hinted practice are not independent
recalls. The daily new-item allowance counts first encounters, so reopening the
app does not reset it. Backlogs prioritize the oldest 20 due items and reduce
new learning; remaining due items are left safely waiting. No streak penalty,
automatic bulk completion, or compounded punishment for missed days.

State is atomically saved as JSON in the app sandbox's Application Support
directory after changes. Save failures are shown and can be retried. Unreadable
state is not silently replaced; restore a backup rather than discarding it.
There is no account, app-managed cloud synchronization, or export/import UI.

## Audio, microphone, and privacy

- Pronunciation uses Apple's German system speech-synthesis voice. German text
  is bundled. If a voice is unavailable, the app explains the reading/typing
  fallback. Install a German voice through iPhone Accessibility → Spoken Content
  (or Read & Speak, depending on iOS) before offline use; voice downloads are
  managed by iOS. Check audio in airplane mode on your device.
- Only tapping **Record on device** initiates speech/microphone permission
  requests. Reading, listening and typing require neither permission.
- The app checks German `supportsOnDeviceRecognition` and availability, and
  always sets `requiresOnDeviceRecognition = true` on the recognition request.
  There is **no server recognition fallback**. Unsupported devices/languages,
  denied permissions, missing resources, or recognition failures lead to clear
  typing instructions. Simulator speech support is not representative of a
  physical iPhone.
- Audio buffers and editable transcripts are transient; neither is written to
  app storage. Recording stops when leaving practice or when the app becomes
  inactive. The app has no network client or analytics SDK.
- Local files are protected by the iOS app sandbox and the device's system data
  protection; this is not an independently encrypted vault. Avoid putting
  sensitive information in notes.
- Progress, notes, settings and review history remain in the app's local
  container. **Apple iCloud/Finder device backups may include them**, depending
  on your backup settings. This app does not control Apple's backup transport.
  Deleting the app, losing the phone, or changing devices without a restorable
  backup can lose all progress. Review device backup settings yourself.

There is **no unconstrained offline AI conversation, grammar tutor, or reliable
pronunciation score**. A transcript is not evidence of good pronunciation. The
prepared answer matcher is deliberately limited; alternative valid German can
be self-assessed.

## Tests and verification

The Foundation-only package can be tested on macOS or Linux with Swift 6:

```sh
swift test
```

Tests cover course integrity, answer normalization, recall scheduling, daily
budgets, backlogs/missed days, notes and progress, and local persistence including
corrupt-data handling. UI and platform audio need the manual device checks below.

### Device acceptance checklist

1. Fresh install: no permission prompts. Complete/skip starting check; adjust
   target and allowance. Confirm recognized items do not count as recalled.
2. Open appointment cards; check meanings, article/plural, English examples,
   audio and notes. Relaunch and verify saved notes and settings.
3. Recall an item with Again, Hard, and Good; inspect progress and next due
   reviews. Hints/listening should not add independent successful recalls.
4. Practice both appointment paths with typing and corrected transcripts.
   Deny microphone/speech permissions; verify typing still works. On a device
   without German on-device recognition, verify no recording/server fallback.
5. In airplane mode with installed German voice/recognition resources, try audio
   and recording. Interrupt with a call/backgrounding or navigate away; the
   recording indicator should stop. Return and start a fresh recording.
6. Increase Dynamic Type, enable VoiceOver, use dark mode and landscape.
   Check scrollable content, labeled controls, and text that does not rely on
   color alone.
7. Leave due items waiting, then return after a missed day; check oldest-first
   capped reviews, lower new workload and no loss of existing progress.

### Implementation environment limitations

This repository was implemented in a Linux environment with Swift 6.4 and no
Xcode/iOS SDK or Simulator. The shared-core test results are recorded in the PR.
App Swift syntax and project/plist structure can be checked here, but **a
successful iOS build, launch, VoiceOver layout, and physical-device audio and
permission checks cannot be claimed from this environment**. Run the build and
acceptance checklist above on macOS/iPhone before relying on the prototype.
The CodeQL Swift check was attempted but could not create a database without
the iOS build dependencies; it did not provide completed security analysis.

## B1 and telc

This first week supports practical vocabulary refresh. It is not a complete
three-month curriculum, an official telc product, or a guarantee of telc Deutsch
B1 readiness. Combine it with official model tests, timed writing and reading,
broader listening, and conversation with a teacher or partner.
