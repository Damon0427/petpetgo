

import Foundation
import CoreData
import SwiftUI

class coreDataviewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var saveEntities: [UserEntity] = []
    @Published var animalEntities: [AnimalEntity] = []

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
        fetchAnimal()

    }
    func findLoggedInUserAnimals() -> [AnimalEntity] {
            guard let loginUser = saveEntities.first(where: { $0.islogin }) else {
                return []
            }
            
            let userAnimals = loginUser.animals?.allObjects as? [AnimalEntity] ?? []
            return userAnimals
        }
        func fetchAnimal() {
            let request = NSFetchRequest<AnimalEntity>(entityName: "AnimalEntity")
            do{
                animalEntities = try container.viewContext.fetch(request)
            }catch let error{
                print("Error fetching \(error)")
            }
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
    func findLoggedInUser() -> UserEntity? {
            return saveEntities.first(where: { $0.islogin })
        }
    func addAnimal(name: String, photo:String){
                let newAnimal = AnimalEntity(context: container.viewContext)
                newAnimal.name = name
                newAnimal.photo = photo
               
                //find the loginUser, and story the animal into User
            if let loginUser = findLoggedInUser() {
                    print("add animal success")
                    newAnimal.users = [loginUser]
                }
                
                saveData()
            }
    
    func deleteUser(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let entity = saveEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func refreshUserData() {
            fetchUser()
        }
    
    
    // update user first name
    func updateFirstName(entity: UserEntity, newFirstName: String) {
        entity.firstname = newFirstName
        saveData()
        fetchUser()
    }
    
    // update user last name
    func updateLastName(entity: UserEntity, newLastName: String) {
        entity.lastname = newLastName
        saveData()
        fetchUser()
    }
    
    //update user password
    func updatePassword(entity: UserEntity, newPassword: String) {
        entity.password = newPassword
        saveData()
        fetchUser()
    }
    func updateLoginStatus(userName: String){
            for entity in saveEntities {
                if entity.username == userName {
                    print("Login status set to false")
                    entity.islogin = false
                    break;
                }
            }
        saveData()
    }
    func saveData () {
        do{
            try container.viewContext.save()
            
        }catch let error{
            print("Error Saving the information. \(error)")
            
        }
    }
 
    func deleteAllAnimals() {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AnimalEntity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            let fetchUserRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserEntity")
            let deleteUserRequest = NSBatchDeleteRequest(fetchRequest: fetchUserRequest)
            do {
                try container.viewContext.execute(deleteRequest)
                try container.viewContext.execute(deleteUserRequest)
                animalEntities.removeAll()
                saveEntities.removeAll()
                saveData()
            } catch {
                print("Error deleting all animals: \(error)")
            }
        }
    
    func isValidLogin(username: String, password: String) -> Bool {
        for entity in saveEntities {
            if entity.username == username && entity.password == password{
                print("login status set to true")
                entity.islogin = true
                saveData()
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
