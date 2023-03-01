//
//  UsersViewModel.swift
//  AlamofireTestProject
//
//  Created by Bhop on 28.02.2023.
//

import Foundation
import Alamofire

class UserViewModel : ObservableObject{
    @Published var userList = [User]()
    
    init(){
        getUsers()
    }
    
    func getUsers() {
        AF.request(Constants.URLs.usersURL, method: .get).responseDecodable(of: Users.self) { response in
            switch response.result {
            case .success(let data):
                let user = data.users
                self.userList.append(contentsOf: user)
            case .failure(let error):
                print(error)
            }
        }
    }
}
