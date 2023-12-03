

import Foundation
import CoreData
import SwiftUI
class coreDataviewModel: ObservableObject {
    
    
    let container: NSPersistentContainer
    @Published var saveEntities: [UserEntity] = []
    init () {
        container = NSPersistentContainer(name: "userCoreData")
        container.loadPersistentStores { description, error in
            if let error = error  {
                
                print("ERROR LOADING CORE DATA\(error)")
            }
            else {
                print("Successfully loaded core data ")
            }
        }
        fetchUser()
    }
    func fetchUser (){
        let request = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        do{
            saveEntities = try container.viewContext.fetch(request)
        }catch let error{
            print("Error fetching \(error)")
        }
    }
    func addUser (userName: String, passWord: String, firstName: String, lastName: String){
        let newUser = UserEntity(context: container.viewContext)
        
        newUser.username = userName
        newUser.password = passWord
        newUser.firstname = firstName
        newUser.lastname = lastName
        print("added user success")
        saveData()
    }
    
    func deleteUser(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let entity = saveEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
//    func updateUser(entity: UserEntity) {
//        let currentFristName = entity.firstname ?? ""
//        let newFristName = currentFristName
//        entity.firstname = newFristName
//        saveData()
//    }
    
    func saveData () {
        do{
            try container.viewContext.save()
            fetchUser()
        }catch let error{
            print("Error Saving the information. \(error)")
            
        }
    }
    
    func isValidLogin(username: String, password: String) -> Bool {
        for entity in saveEntities {
            if entity.username == username && entity.password == password{
                return true
            }
        }
        return false
    }
    func isPasswordValid(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

}
