//
//  UserView.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 11.06.21.
//

import SwiftUI

struct UserView: View {



    var userId: String?
    var results: [User]

    var user: User {
        guard userId != nil else { return User.testUser}

//        return dataController.UserDetails(for: userId!)
        
        return results.first(where: { user in
            user.id == userId
        })!

        
    }

    @State private var showAddress = false
    var body: some View {

        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Text(user.name)
                    Spacer()
                    Image(systemName: user.isActive ? "star.fill" : "star")
                        .foregroundColor( user.isActive ? Color.yellow : Color.gray)
                }
                .font(.title)
                .padding(.vertical)
                HStack() {
                    Text("Age: \(user.age)")
                    Spacer()
                    Text("Joined: \(user.formattedRegisteredDate)")
                }
                .font(.body)
                Text("Works at: \(user.company)")
                    .font(.subheadline)
                Text(user.email)
                    .textContentType(.emailAddress)
                    .padding(.top)
                HStack{
                    Text("Address:")
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.showAddress.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.right.circle")
                            .imageScale(.large)
                            .rotationEffect(.degrees(showAddress ? 90 : 0))
                            .padding()
                    }
                }
                if showAddress {
                    Text(user.address)
                        .transition(.opacity)
                }
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.tags, id: \.self) { tag in
                            Text(tag)
                                .foregroundColor(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 4)
                                .background(Color.blue)
                                .clipShape(Capsule())
                        }
                    }
                }

                Text(user.about)

//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack {
//                        ForEach(user.friends, id: \.id) { friend in
//                            NavigationLink(
//                                destination: Text(friend.name)) {
//                                Text(friend.name)
//                                padding(.top)
//                            }
//
//                        }
//                    }
//                }
                Spacer()


            }
            .padding()
        }



    }
}


