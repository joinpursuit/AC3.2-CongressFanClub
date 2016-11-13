//
//  CongressionalData.swift
//  (Elected) Officials
//
//  Created by Harichandan Singh on 11/7/16.
//  Copyright © 2016 Harichandan Singh. All rights reserved.
//

import Foundation

enum ParsingErrors: Error {
<<<<<<< HEAD
    case partyError, personError, firstnameError, genderError, idError, lastnameError, nameError, stateError, roleTypeError, twitterNameError
=======
    case partyError, personError, firstnameError, genderError, idError, lastnameError, nameError, stateError, roleTypeError, twitterIDError
>>>>>>> 24fbaae74200a0e4684bd97c9c4cdb6ac60b72cf
}

class CongressionalData {
    
    //MARK: - Properties
    static let apiEndpoint: String = "https://www.govtrack.us/api/v2/role?current=true&limit=540"
    var party: String
    var firstname: String
    var gender: String
    var id: Int
    var lastname: String
    var name: String
    var state: String
    var roleType: String
<<<<<<< HEAD
    var twitterName: String
=======
    var twitterID: String
>>>>>>> 24fbaae74200a0e4684bd97c9c4cdb6ac60b72cf
    var imageURL: String {
        return "https://www.govtrack.us/data/photos/\(id)-200px.jpeg"
    }
    
    
    //MARK: - Initializers
<<<<<<< HEAD
    init(party: String, firstname: String, gender: String, id: Int, lastname: String, name: String, state: String, roleType: String, twitterName: String ) {
=======
    init(party: String, firstname: String, gender: String, id: Int, lastname: String, name: String, state: String, roleType: String, twitterID: String) {
>>>>>>> 24fbaae74200a0e4684bd97c9c4cdb6ac60b72cf
        self.party = party
        self.firstname = firstname
        self.gender = gender
        self.id = id
        self.lastname = lastname
        self.name = name
        self.state = state
        self.roleType = roleType
<<<<<<< HEAD
        self.twitterName = twitterName
=======
        self.twitterID = twitterID
>>>>>>> 24fbaae74200a0e4684bd97c9c4cdb6ac60b72cf
    }
    
    
    //MARK: - Methods
    static func createCongressionalDataArray(from data: Data) -> [CongressionalData]? {
        do {
            let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard let dict = jsonData as? [String: Any] else {
                print("There was an error while parsing the JSON Data.")
                return nil
            }
            print("Successfully casted data from JSON Data.")
            
            guard let objectsArray = dict["objects"] as? [[String: Any]] else {
                print("There was an error creating the array of objects.")
                return nil
            }
            print("Successfully parsed data into objects array.")
            
            var allCongressMembers: [CongressionalData] = []
            
            for dict in objectsArray {
                
                guard let party = dict["party"] as? String else {
                    throw ParsingErrors.partyError
                }
                
                guard let personDict = dict["person"] as? [String: Any] else {
                    throw ParsingErrors.personError
                }
                
                guard let firstname = personDict["firstname"] as? String else {
                    throw ParsingErrors.firstnameError
                }
                
                guard let gender = personDict["gender"] as? String else {
                    throw ParsingErrors.genderError
                }
                
                guard let id = personDict["id"] as? Int else {
                    throw ParsingErrors.idError
                }
                
                guard let lastname = personDict["lastname"] as? String else {
                    throw ParsingErrors.lastnameError
                }
                
                guard let name = personDict["name"] as? String else {
                    throw ParsingErrors.nameError
                }
                guard let twitter = personDict["twitterid"] as? String else {
                    throw ParsingErrors.twitterNameError
                }
                
                guard let state = dict["state"] as? String else {
                    throw ParsingErrors.stateError
                }
                
                guard let roleType = dict["role_type"] as? String else {
                    throw ParsingErrors.roleTypeError
                }
                
<<<<<<< HEAD
               
                
                
                let congressPerson: CongressionalData = CongressionalData(party: party, firstname: firstname, gender: gender, id: id, lastname: lastname, name: name, state: state, roleType: roleType, twitterName: twitter)
=======
                let twitterID = personDict["twitterid"] as? String
                
                let congressPerson: CongressionalData = CongressionalData(party: party, firstname: firstname, gender: gender, id: id, lastname: lastname, name: name, state: state, roleType: roleType, twitterID: twitterID ?? "")
>>>>>>> 24fbaae74200a0e4684bd97c9c4cdb6ac60b72cf
                
                allCongressMembers.append(congressPerson)
            }
            return allCongressMembers
        }
        catch ParsingErrors.partyError {
            print("Could not find the party key.")
        }
        catch ParsingErrors.personError {
            print("Could not find the person key.")
        }
        catch ParsingErrors.firstnameError {
            print("Could not find the firstname key.")
        }
        catch ParsingErrors.genderError {
            print("Could not find the gender key.")
        }
        catch ParsingErrors.lastnameError {
            print("Could not find the lastname key.")
        }
        catch ParsingErrors.nameError {
            print("Could not find the name key.")
        }
        catch ParsingErrors.stateError {
            print("Could not find the state key.")
        }
        catch ParsingErrors.roleTypeError {
            print("Could not find role_type key.")
        }
<<<<<<< HEAD
        catch ParsingErrors.twitterNameError {
             print("Could not find twitterid key.")
=======
        catch ParsingErrors.twitterIDError {
            print("Could not find twitterid key.")
>>>>>>> 24fbaae74200a0e4684bd97c9c4cdb6ac60b72cf
        }
        catch {
            print("Unknown error encountered!")
        }
        return nil
    }
    
}
