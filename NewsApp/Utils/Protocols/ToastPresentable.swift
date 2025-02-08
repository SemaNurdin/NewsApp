import UIKit

protocol ToastPresentable {
    func presentToast(with message: String, duration: Double, messageType: Toast.MessageType, on position: Toast.Position)
}

extension ToastPresentable where Self: UIViewController {
    func presentToast(with message: String, duration: Double = 5, messageType: Toast.MessageType, on position: Toast.Position = .top) {
        guard !message.isEmpty else { return }
        let toast = Toast(text: message, duration: duration)
        var backgroundColor: UIColor
        var iconImage: UIImage
        var titleLabelText: String
        switch messageType {
        case .success:
            backgroundColor = .green
            iconImage = UIImage(systemName: "exclamationmark.triangle.fill")!
            titleLabelText = "Success"
        case .error:
            backgroundColor = .red
            iconImage = UIImage(systemName: "exclamationmark.triangle.fill")!
            titleLabelText = "Error"
        case .warning:
            backgroundColor = .orange
            iconImage = UIImage(systemName: "exclamationmark.triangle.fill")!
            titleLabelText = "Warning"
        }
        toast.showToast(
            on: view,
            duration: duration,
            on: position,
            backgroundColor: backgroundColor,
            iconImage: iconImage,
            titleLabelText: titleLabelText
        )
    }
}
