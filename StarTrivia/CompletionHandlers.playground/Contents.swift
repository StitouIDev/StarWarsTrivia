import UIKit


struct Person {
    let name: String
}

typealias PersonResponseCompletion = (Bool, Person)->()



class PersonApi {
    
    func  getRandomPerson(url: String, completion: @escaping PersonResponseCompletion) {
        
        // Perform time consuming network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("Network request completed")
            completion(true , Person(name: "jonnyB"))
        }
    }
}

class VC {
    
    let personApi = PersonApi()
    
    func randomButtonPressed(){
 //       print("About to start request")
 //       personApi.getRandomPerson(url: "www.sawpi.com") { Succes, person in
            
 //           if Succes == true {
 //               print(person.name)
  //          }
  //      }
        personApi.getRandomPerson(url: "url") { (succes, person) in
            if succes {
                             print(person.name)
                        }
        }
        print("Network request has started")
    }
    
  
    
    
}

let vc = VC()

vc.randomButtonPressed()

