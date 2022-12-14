import Foundation

class userSettings: ObservableObject {
    @Published var firstTime: Bool {
        didSet {
            UserDefaults.standard.setValue(firstTime, forKey: "firstTime")
        }
    }
    @Published var openState: Bool {
        didSet {
            UserDefaults.standard.setValue(openState, forKey: "state")
        }
    }
    
    init() {
        firstTime = UserDefaults.standard.object(forKey: "firstTime") as? Bool ?? false
        openState = UserDefaults.standard.object(forKey: "state") as? Bool ?? true
    }
}
