import UIKit

protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
}


extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
extension UIViewController: Reusable {}

extension UITableView {
    
    func dequeueReusableCell<T>(ofType cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseID, for: indexPath) as? T else {  fatalError() }
        return cell
    }
}

