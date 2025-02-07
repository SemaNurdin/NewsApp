import DeviceKit
import UIKit

public enum ScreenType {
    case small
    case normal
    case large
}

public enum DeviceScreenSize {
    public static var current: ScreenType {
        switch Device.current {
        case .iPhone4, 
                .iPhone4s,
                .iPhone5,
                .iPhone5s,
                .iPhone5c,
                .iPhoneSE,
                .simulator(.iPhone4),
                .simulator(.iPhone4s),
                .simulator(.iPhone5),
                .simulator(.iPhone5s),
                .simulator(.iPhoneSE):
            return .small
        case .iPhone6, 
                .iPhone6s,
                .iPhone7,
                .iPhone8,
                .iPhoneSE2,
                .iPhoneSE3,
                .simulator(.iPhone6),
                .simulator(.iPhone6s),
                .simulator(.iPhone7),
                .simulator(.iPhone8),
                .simulator(.iPhoneSE2),
                .simulator(.iPhoneSE3):
            return .normal
        default:
            return .large
        }
    }
}
