import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modeldata = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modeldata)
        }
#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
        
#if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
#endif
        
#if os(macOS)
        Settings {
            LandmarkSettings()
        }
#endif
    }
}
