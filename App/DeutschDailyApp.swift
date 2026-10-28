import SwiftUI
import LearningCore

@MainActor
final class LearningModel: ObservableObject {
    @Published var state = LearnerState()
    @Published var storageError: String?
    private let store: LocalStore
    private var canSave = false

    init() {
        let directory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("DeutschDaily", isDirectory: true)
        store = LocalStore(directory: directory)
        do {
            state = try store.load()
            canSave = true
        } catch {
            storageError = "Your saved data could not be opened. It has not been overwritten. Close the app and restore a device backup or contact support before continuing."
        }
    }

    var plan: DailyPlan { DailyPlan(state: state) }

    func update(_ change: (inout LearnerState) -> Void) {
        guard canSave else { return }
        change(&state)
        do {
            try store.save(state)
            storageError = nil
        } catch {
            storageError = "Changes could not be saved. Keep the app open and free some device storage, then tap Retry saving."
        }
    }

    func retrySave() {
        if canSave {
            update { _ in }
        } else {
            do {
                state = try store.load()
                canSave = true
                storageError = nil
            } catch {
                storageError = "Saved data is still unreadable and has not been overwritten. Restore a device backup before continuing."
            }
        }
    }
}

@main
struct DeutschDailyApp: App {
    @StateObject private var model = LearningModel()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(model)
                .tint(.teal)
        }
    }
}

struct RootView: View {
    @EnvironmentObject private var model: LearningModel
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        TabView {
            NavigationStack { TodayView() }
                .tabItem { Label("Today", systemImage: "sun.max") }
            NavigationStack { CourseView() }
                .tabItem { Label("Course", systemImage: "books.vertical") }
            NavigationStack { ProgressScreen() }
                .tabItem { Label("Progress", systemImage: "chart.bar") }
            NavigationStack { SettingsView() }
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .safeAreaInset(edge: .top) {
            if let error = model.storageError {
                VStack(alignment: .leading) {
                    Label(error, systemImage: "exclamationmark.triangle")
                    Button("Retry saving") { model.retrySave() }
                }
                .font(.callout)
                .padding()
                .background(.regularMaterial)
            }
        }
        .fullScreenCover(isPresented: Binding(
            get: { !model.state.onboardingComplete && model.storageError == nil },
            set: { _ in }
        )) { StartingCheckView().environmentObject(model) }
        .onReceive(Timer.publish(every: 60, on: .main, in: .common).autoconnect()) { _ in
            model.objectWillChange.send()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active { model.objectWillChange.send() }
        }
    }
}
