import Realm
import RealmSwift

class RealmDatabaseManager {
    var realm: Realm
    
    init(configuration: Realm.Configuration) throws {
        self.realm = try Realm(configuration: configuration)
    }
    
    func save<T: Sequence>(objects: T, _ update: Realm.UpdatePolicy = .modified) throws where T.Element == Object {
        try realm.write {
            realm.add(objects, update: update)
        }
    }
    
    func get<T: Object>(for model: T.Type) -> Results<T> {
        realm.objects(T.self)
    }
    
    func delete<T: Sequence>(objects: T) throws where T.Element == Object {
        try realm.write {
            realm.delete(objects)
        }
    }
    
    func realmDeleteAll() throws {
        try realm.write {
            realm.deleteAll()
        }
    }
    
    func getObject<T: Object, KeyType>(for model: T.Type, primaryKey: KeyType) -> T? {
        return realm.object(ofType: model, forPrimaryKey: primaryKey)
    }
}
