//
//  DatabaseConnectionService.swift
//  Uzimmie
//
//  Created by SEAN BLAKE on 2/22/24.
//

import Firebase
import FirebaseDatabase

class DatabaseConnectionService {
    private let dbRef = Database.database().reference()
    
    static let shared = DatabaseConnectionService() // Singleton instance
    
    private init() {} // Private initializer to ensure singleton usage
    
    // Fetch data from a specified path
    func fetchData(fromPath path: String, completion: @escaping (Result<DataSnapshot, Error>) -> Void) {
        dbRef.child(path).observeSingleEvent(of: .value, with: { snapshot in
            completion(.success(snapshot))
        }) { error in
            completion(.failure(error))
        }
    }
    
    // Add data to a specified path
    func addData(toPath path: String, data: [String: Any], completion: @escaping (Error?) -> Void) {
        dbRef.child(path).setValue(data) { error, _ in
            completion(error)
        }
    }
    
    // Update data at a specified path
    func updateData(atPath path: String, withData data: [String: Any], completion: @escaping (Error?) -> Void) {
        dbRef.child(path).updateChildValues(data) { error, _ in
            completion(error)
        }
    }
    
    // Delete data from a specified path
    func deleteData(fromPath path: String, completion: @escaping (Error?) -> Void) {
        dbRef.child(path).removeValue { error, _ in
            completion(error)
        }
    }
}

