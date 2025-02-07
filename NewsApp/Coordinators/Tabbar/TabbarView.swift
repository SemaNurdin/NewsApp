import UIKit

protocol TabbarView: AnyObject {
    var onMainNewsFlowSelect: ((BaseNC) -> Void)? { get set }
    var onSavedNewsFlowSelect: ((BaseNC) -> Void)? { get set }
}
