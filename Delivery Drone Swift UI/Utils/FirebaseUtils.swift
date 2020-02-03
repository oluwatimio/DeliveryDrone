//
//  FirebaseUtils.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-06.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import Foundation
import FirebaseAuth
import Promise

class FirebaseUtils {
    static func login(email: String, password: String) -> Promise<Bool> {
        return Promise<Bool> (work: {fulfill, reject in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if ((authResult) != nil) {
                    Session.setSession(email: authResult?.user.email ?? "", displayName: authResult?.user.displayName ?? "", uid: authResult?.user.uid ?? "")
                    fulfill(true)
                } else {
                    fulfill(false)
                }
            }
        })
    }
    
    static func createAccount(email: String, password: String, displayName: String) -> Promise<Bool> {
        return Promise<Bool> (work: {fulfill, reject in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if ((authResult) != nil) {
                    let changeRequest = authResult?.user.createProfileChangeRequest()
                    changeRequest?.displayName = displayName
                    changeRequest?.commitChanges() { error in
                        if (error == nil){
                            fulfill(true)
                        } else {
                            fulfill(false)
                        }
                    }
                }
            }
        })
    }
    
    func logout(){
//        Auth.auth().signOut()
    }
}
