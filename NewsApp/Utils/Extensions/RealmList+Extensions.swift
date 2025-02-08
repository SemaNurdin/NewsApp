import RealmSwift

extension RealmCollection {
    func toArray<T>() -> [T] {
        return self.compactMap { $0 as? T }
    }
}

extension List {
    convenience init(_ array: [Element]) {
        self.init()
        self.append(objectsIn: array)
    }
}
