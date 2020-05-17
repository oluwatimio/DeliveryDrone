//
//  Session.swift
//  Delivery Drone Swift UI
//
//  Created by Timi Owoturo on 2020-01-06.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import Foundation
import Firebase

class Session {
    var email: String;
    var displayName: String;
    var uid: String;
    static var session: Session? = nil;
    static var cartSession: [Product] = [];
    private init(email: String, displayName: String, uid: String){
        self.email = email;
        self.displayName = displayName;
        self.uid = uid;
    }
    
    
    static func instance() -> Session? {
        let user = Auth.auth().currentUser
        if (user != nil) {
            session = Session(email: user?.email ?? "", displayName: user?.displayName ?? "", uid: user?.uid ?? "")
        }
        return session;
    }
    
    static func setSession(email: String, displayName: String, uid: String) -> Session {
        session = Session(email: email, displayName: displayName, uid: uid)
        
        return session!
    }
    
    static func clearSession(){
        session = nil
    }
}
