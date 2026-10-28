# Deutsch Daily

A local-first, vocabulary-first SwiftUI iPhone app with a **90-day German course**
for an English-speaking learner returning after A1. Everyday communication comes
first; B1 is a direction, not a promised outcome. No account, analytics, ads,
external API, or third-party runtime dependencies.

The full course is bundled: **90 learning days, 385 vocabulary entries, 13
consolidation/reflection days, and prepared speaking, reading, writing and grammar
support for every day**. This is an original guided course, not an official telc
curriculum or a substitute for human language feedback. A learning day can take
more than one calendar day, especially with a low new-item allowance or backlog.

## Run on an iPhone or Simulator

Requires **macOS, Xcode 16 or newer, and iOS 17 or newer**. Linux can test the
shared learning logic, but cannot build SwiftUI, AVFoundation, or Speech.

Clone the repository on your Mac. Until the pull request is merged, switch to
the pull request's **head branch** in Xcode's source-control navigator or your Git
client; the default branch may not contain the app yet. After merging, use the
default branch. No signing certificates or Apple credentials belong in Git.

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
5. Course is organized by week and is searchable by topic, German phrase, or
   English meaning. Today opens the next incomplete day. Each day has vocabulary
   cards, a prepared speaking path, and a workbook. Visit the cards, finish the
   dialogue, and self-check the reading and writing before marking it completed.

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
- **Today:** oldest due reviews, new vocabulary, prepared speaking, and the day's
  reading/writing workbook. The 30–40 minute plan is a suggested routine, not a
  measured duration. Change the target or take a review-only day when necessary.
- **Course:** 12 full weeks plus a six-day final block. Weekly consolidation
  reuses earlier vocabulary IDs instead of counting the same words as new:

  | Week / days | Focus |
  | --- | --- |
  | 1 / 1–7 | Introductions, routine, shopping, appointments, transport, requests |
  | 2 / 8–14 | Family, home, food, café, clothes/weather, weekend plans |
  | 3 / 15–21 | Neighbourhood, directions, dates, health communication, invitations |
  | 4 / 22–28 | Housing, repairs, phone calls, parcels, payments, travel bookings |
  | 5 / 29–35 | Past experiences, work, applications, education, learning strategies |
  | 6 / 36–42 | Habits, sport, preferences, celebrations, suggestions and opinions |
  | 7 / 43–49 | Office messages, formal emails, complaints, returns and documents |
  | 8 / 50–56 | Media, technology, safety, environment, transport and cooperation |
  | 9 / 57–63 | Reasons, comparisons, experiences, plans and organising an outing |
  | 10 / 64–70 | Moving, interviews, family arrangements, volunteering and disruption |
  | 11 / 71–77 | Notices, listening details, emails, descriptions and joint planning |
  | 12 / 78–84 | Problem solving, compromise, summaries, opinions and reflection |
  | 13 / 85–90 | Reading/writing and speaking rehearsal, repair strategies, final plan |

  Month 1 refreshes practical A1/A2 foundations (days 1–28); month 2 connects
  ideas and situations (29–56); month 3 adds B1-oriented communicative tasks
  (57–90). Every seventh day and day 90 consolidate rather than introduce new
  vocabulary. Each other day has five words or useful phrases with English,
  examples, audio and memory cues.

- **Appointment lesson:** `der Termin / die Termine`, `einen Termin vereinbaren`,
  `verschieben`, `Zeit haben`, and `Es passt mir.` with English meanings, natural
  examples, audio, cues, editable personal associations, and recall practice.
  You may choose this lesson first through Course. The daily allowance still
  applies; set it to ten in Settings if the starting check used some of today's
  allowance and you want to explore all five appointment cards immediately.
- **Recall:** translate into German, optionally recognize audio in English, and a prepared
  appointment sentence completion. Try before revealing; compare with suggested
  answers, then choose Again / Hard / Good. Matching tolerates punctuation, case
  and common German keyboard spellings, but cannot assess every valid paraphrase.
  You make the final meaning-based assessment. Listening recognition, hints and
  card visits do not inflate successful independent recall totals.
- **Speaking:** every lesson has its own repeat → guided answer →
  unaided prompt → prepared everyday dialogue. Today follows the current lesson;
  open any other theme from Course. Appointments has make-an-appointment and
  change-an-appointment paths. The next
  partner line follows that explicit choice, not AI interpretation. Hints
  and suggested responses remain available. Edit a transcript or type instead.
- **Workbook:** a grammar pattern with an English explanation, an original German
  passage with optional English support and audio, a comprehension question,
  and a writing prompt with a checklist and a German model. Type first, then
  compare meaning; natural alternatives are welcome. Reading responses, writing
  drafts and self-checks persist per day. Editing a response clears its completed
  self-check. Grammar and writing are not automatically graded.
- **Progress:** encountered items, items recalled at least once, total successful
  attempts, completed lessons, difficult vocabulary, and recent learning
  activity, plus weekly completion totals. Lesson completion requires cards,
  reading and writing self-checks, and prepared dialogue participation; it does
  not count those activities as independent vocabulary recalls or certify mastery.

At the end, day 90 remains available as a reflection and reuse day while due
reviews continue. The app does not reset progress or declare an exam pass.
Use your final personal plan to identify gaps and arrange further practice.

## Scheduling and persistence

The shared core implements a small deterministic spaced-recall scheduler, not a
validated adaptive-learning algorithm. Again brings an item back soon; Hard
uses a shorter interval than Good. Every independent review rating and its date
is persisted locally. Recognition and hinted practice are not independent
recalls. The daily new-item allowance counts first encounters, so reopening the
app does not reset it. Backlogs prioritize the oldest 20 due items and reduce
new learning; remaining due items are left safely waiting. No streak penalty,
automatic bulk completion, or compounded punishment for missed days.

German recall is the default for **all** review items. At the start of a session
you may choose listening recognition instead. Listening successes and hinted
answers are logged as `practice` and return in ten minutes without raising
independent recall counts or learned intervals. Again still brings a missed
item back in ten minutes. A session snapshots its queue so saving an answer does
not skip another item.

State is atomically saved as JSON in the app sandbox's Application Support
directory after changes. Save failures are shown and can be retried. Unreadable
state is not silently replaced; restore a backup rather than discarding it.
There is no account, app-managed cloud synchronization, or export/import UI.
Upgrading from the first-week version preserves the original vocabulary IDs,
notes, review history, settings and completed days. Missing workbook fields in
older save files default to an empty workbook; previously completed lessons
remain completed. New completions use the fuller participation checklist.

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
- Progress, notes, workbook drafts, self-checks, settings and review history remain in the app's local
  container. **Apple iCloud/Finder device backups may include them**, depending
  on your backup settings. This app does not control Apple's backup transport.
  Deleting the app, losing the phone, or changing devices without a restorable
  backup can lose all progress. Review device backup settings yourself.

There is **no unconstrained offline AI conversation, automated grammar tutor, or reliable
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
Prepared-dialogue integrity and supported-practice scheduling have focused tests.
Full-course tests check all 90 days, canonical vocabulary reuse on review days,
reading/writing coverage, week grouping, legacy-save migration, workbook
persistence, completion requirements and an end-to-end progression simulation.

### Automated Mac build

The **iOS build and core tests** GitHub Actions workflow runs on a macOS runner
for pushes and pull requests, or manually from Actions → Run workflow (once the
workflow exists on the default branch). It runs `swift test` and builds the
unsigned iPhone Simulator app with Xcode. This checks SwiftUI type checking and
linking without any Apple account, device registration, or signing secrets.
A green build is not a substitute for launching the app and checking
microphone, speech, VoiceOver and offline behavior on your iPhone.
If the checks fail, open the failed step and share its Xcode error output.
GitHub may require an owner to approve workflows proposed by Copilot. If a run
shows **Action required**, review the workflow in the PR and use GitHub's
workflow approval control; no build jobs have run until that approval. The first
runs for this development pass were gated this way, so adding the workflow
does not itself establish a successful iOS build.

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
8. Open days 8, 29, 57, 84 and 90. Read/listen to the text, answer and compare,
   write a draft and self-check, and complete a prepared dialogue. Relaunch and
   confirm the draft/checklist is preserved. Edit a draft and confirm its
   writing self-check resets without changing recall totals.
9. Browse all 13 week sections and search for a late-course topic. Complete all
   activities on a day and mark it complete; verify Today advances only then.
   If upgrading an earlier install, verify earlier notes and reviews survive.

### Implementation environment limitations

This repository was implemented in a Linux environment with Swift 6.4 and no
Xcode/iOS SDK or Simulator. The shared-core test results are recorded in the PR.
App Swift syntax and project/plist structure can be checked here, but **a
successful iOS build, launch, VoiceOver layout, and physical-device audio and
permission checks cannot be claimed from this environment**. Run the build and
acceptance checklist above on macOS/iPhone before relying on the prototype.
The CodeQL Swift check was attempted but could not create a database without
the iOS build dependencies; it did not provide completed security analysis.

## App icon

The original icon combines an open vocabulary book and a speech-bubble tail,
with an ivory/teal palette and a black-red-gold bookmark. It uses no text, fonts,
stock artwork, or external services. Editable artwork is in `Design/AppIcon.svg`;
the bundled image is `App/Assets.xcassets/AppIcon.appiconset/AppIcon.png`.
The PNG is a full-bleed, opaque, 8-bit RGB, sRGB **1024 × 1024** image without an
alpha channel or pre-rounded corners. The iOS universal single-size catalog
(supported by the project's Xcode 16+/iOS 17+ baseline) lets Xcode generate
home-screen, Spotlight, Settings, notification, and App Store sizes. The catalog
is in the app target's Resources phase; Debug and Release both select `AppIcon`.
The same artwork is used for all appearances; no separate dark/tinted artwork
is supplied.

This branch incorporates PR #1's app snapshot at `ba1865c` by merge, without
editing its implementation. PR #1's head branch is not changed. For coordinated
integration, merge PR #1 first, then this icon PR into `main` (shared commits
will not duplicate the app), or cherry-pick only the icon commit onto PR #1's
head. Do not replace newer app files with this snapshot.

The export used local CairoSVG 2.9.0 at 4× resolution, then Pillow 13.0.0 Lanczos
downsampling to 1024 and RGB conversion with a PNG `sRGB` chunk (rendering intent
0). These are artwork tooling only, not app dependencies. `swift test --filter
AppIconTests` checks the catalog, PNG header/color metadata, and target wiring.
The PNG was also decoded and visually inspected at launcher sizes on Linux.
Xcode/`actool`, Simulator, device installation, and an App Store archive cannot
be verified here. On macOS, run the simulator build above in Debug and Release,
check for asset compiler warnings, then install and inspect the home-screen icon.
PR #1's iOS workflow was `action_required` with no jobs at inspection time;
a repository owner must approve it before it can establish an iOS build result.

## B1 and telc

The 90-day course supports practical vocabulary refresh and progressively longer
communication tasks. It is not an official telc product, a complete inventory of
all B1 vocabulary/grammar, a full exam simulator, or a guarantee of telc Deutsch
B1 readiness in three months. Later rehearsal activities are original support
tasks: they do not reproduce official papers, assign official scores, or replace
timed model tests. Combine the course with official practice, broader listening,
and conversation and writing feedback from a teacher or partner.
