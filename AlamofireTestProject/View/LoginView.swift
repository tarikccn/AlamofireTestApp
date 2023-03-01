//
//  LoginView.swift
//  AlamofireTestProject
//
//  Created by Bhop on 28.02.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var uvm = UserViewModel()
    
    
    @State private var valid = false
    @State private var usernameText : String = ""
    @State private var passwordText : String = ""
    @State var index = 0
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    RadialGradient(gradient: Gradient(colors: [.accentColor, .black]), center: .center, startRadius: 2, endRadius: 650)
                    VStack{
                        AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/5087/5087579.png")){
                            image in
                            image.image?.resizable()
                                .aspectRatio(contentMode: .fit)
                        }.frame(width: UIScreen.width / 1.5,height: UIScreen.height / 3)
                            .opacity(0.7)
                        //Divider().overlay(.white)
                        
                        ZStack(alignment: .leading){
                            TextField("", text: $usernameText)
                            
                                .padding()
                                .background(.black.opacity(0.1))
                                .cornerRadius(20)
                                .padding([.leading,.trailing],40)
                                .foregroundColor(.white)
                            if(usernameText.isEmpty){
                                Text("Username")
                                    .foregroundColor(.white).opacity(0.6)
                                    .padding(.leading,60)
                            }
                        }
                        ZStack(alignment: .leading){
                            TextField("", text: $passwordText)
                                .padding()
                                .background(.black.opacity(0.1))
                                .cornerRadius(20)
                                .padding([.leading,.trailing],40)
                                .foregroundColor(.white)
                            if(passwordText.isEmpty){
                                Text("Password")
                                    .foregroundColor(.white).opacity(0.6)
                                    .padding(.leading,60)
                            }
                        }
                        Button("Login") {
                            login(username: usernameText, password: passwordText)
                        }
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        NavigationLink(destination: MainView(index: index-1), isActive: $valid, label: {
                            EmptyView()
                        })
                    }
                }
            }.ignoresSafeArea()
        }.navigationBarHidden(true)
    }
    func login(username: String, password: String){
        for i in uvm.userList {
            if username.lowercased() == i.username{
                index = i.id
                if(password.lowercased() == "123"){
                    valid = true
                }else{
                    
                }
            }else{
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
