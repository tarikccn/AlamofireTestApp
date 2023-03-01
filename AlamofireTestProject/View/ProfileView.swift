//
//  ProfileView.swift
//  AlamofireTestProject
//
//  Created by Bhop on 1.03.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var uvm = UserViewModel()
    var index : Int
    var body: some View {
        NavigationView {
            if !uvm.userList.isEmpty{
                VStack{
                    HStack{
                        Spacer()
                        AsyncImage(url: URL(string: uvm.userList[index].image)){
                            image in
                            image.image?.resizable()
                                .aspectRatio(contentMode: .fit)
                                .background(.black)
                                .clipShape(Circle())
                                .frame(width: UIScreen.width/3)
                        }
                        Spacer()
                        VStack{
                            Text("First Name: \(uvm.userList[index].firstName)")
                                .font(.system(size: UIScreen.width / 20))
                            Text("Last Name: \(uvm.userList[index].lastName)")
                                .font(.system(size: UIScreen.width / 20))
                            Text("Email: \(uvm.userList[index].email)")
                                .font(.system(size: UIScreen.width / 20))
                            Text("Phone: \(uvm.userList[index].phone)")
                                .font(.system(size: UIScreen.width / 20))
                        }
                        Spacer()
                    }
                    Divider().frame(height: 2).overlay(.black)
                    Text("Adress Information")
                        .font(.title)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding()
                    Text("Adress: \(uvm.userList[index].address.address)")
                        .font(.system(size: UIScreen.width / 20))
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding()
                    Text("City: \(uvm.userList[index].address.city ?? "null")")
                        .font(.system(size: UIScreen.width / 20))
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding()
                    Spacer()
                }.navigationTitle(Text("Profile"))
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(index: 0)
    }
}
