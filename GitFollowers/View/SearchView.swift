//
//  SearchView.swift
//  GitFollowers
//
//  Created by hajdu otto on 12/01/2023.
//

import SwiftUI

struct SearchView: View {
    
    @State var userName: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                Image("gh-logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .padding()
                
                TextField("Enter a username", text: $userName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                NavigationLink(destination: FollowersListView(userName: userName)) {
                    Text("Get Followers")
                        .frame(width: 250, height: 50)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
