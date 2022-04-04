//
//  ContentView.swift
//  UI-529
//
//  Created by nyannyan0328 on 2022/04/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Press"){
            
            AletTF(title: "Login", message: "Enter Your pass", hintText: "123456", primaryTitle: "Login", secondaryTitle: "Cancel") { text in
                
            } secondaryAction: {
                print("Cancel")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View{
    
    func AletTF(title : String,message : String,hintText : String,primaryTitle : String,secondaryTitle : String,primariAction : @escaping(String) -> (),secondaryAction : @escaping()->()){
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField { filed in
            
            filed.placeholder = hintText
        }
        
        alert.addAction(.init(title: secondaryTitle, style: .cancel, handler: { _ in
            
            
        }))
        
        alert.addAction(.init(title: primaryTitle, style: .default, handler: { _ in
            
            
            if let text = alert.textFields?[0].text{
                
                
                primariAction(text)
            }
            else{
                
                primariAction("")
                
                
            }
            
        }))
        
        getRootView().present(alert, animated: true, completion: nil)
        
        
        
    }
    
    func getRootView()->UIViewController{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return .init()}
        
        guard let rootView = screen.windows.first?.rootViewController else{return .init()}
        return rootView
    }
}
