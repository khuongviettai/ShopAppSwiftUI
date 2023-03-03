//
//  ContentView.swift
//  LearnSwiftUI
//
//  Created by Khương Viết Tài on 10/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex: Int = 0
   private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    var body: some View {
        ZStack{Color(.lightGray)
                .edgesIgnoringSafeArea(.all)
            ScrollView (.vertical, showsIndicators: false) {
                VStack(alignment: .leading){
                    TabBarView()
                    
                    TagLineView()
                        .padding()
                    SearchView()
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< categories.count, id: \.self) { i in
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                           
                        }
                        .padding()
                        
                    }
                   Text("Popular")
                        .font(.system(size: 24))
                        .foregroundColor(Color.white)
                        .fontWeight(.medium)
                        .padding(.horizontal)
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"))
                            }
                            .padding(.leading)
                        }
                        .padding(.horizontal)
                    }
                    Text("Best")
                         .font(.system(size: 24))
                         .foregroundColor(Color.white)
                         .fontWeight(.medium)
                         .padding(.horizontal)
                     ScrollView (.horizontal, showsIndicators: false) {
                         HStack {
                             ForEach(0 ..< 4) { index in
                                 ProductCardView(image: Image("chair_\(index + 1)"))
                             }
                             .padding(.leading)
                         }
                         .padding(.horizontal)
                     }
                     
                }
            }
            HStack {
                ButtonNavBar(image: Image("home")) {}
                ButtonNavBar(image: Image("Search")) {}
                ButtonNavBar(image: Image("star")) {}
                ButtonNavBar(image: Image("User")) {}
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding()
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarView: View {
    var body: some View {
        HStack{
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            Spacer()
            Button(action:{}) {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.system(size: 28))
            .foregroundColor(Color(.lightText))
        + Text("TAI")
            .font(.system(size: 30))
            .fontWeight(.bold)
            .foregroundColor(Color(.lightText))
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search ...", text: $search)
            }
            .padding()
            .background(Color(.white))
            .cornerRadius(10.0)
            .padding(.horizontal)
        }
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? .white : Color.black.opacity(0.6))
            if (isActive) {
                Color(.white)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
    }
}

struct ProductCardView: View {
    let image: Image
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 210, height: 200)
                .cornerRadius(20.0)
            Text("Luxyry chair")
                .font(.title3)
                .fontWeight(.bold)
            HStack {
                ForEach (0 ..< 5) {item in
                    Image("star")
                }
                Spacer()
                Text("$1.299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: 210)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct ButtonNavBar: View {
    let image: Image
        let action: () -> Void
        var body: some View {
            Button(action: action) {
                image
                    .frame(maxWidth: .infinity)
            }
        }
}
