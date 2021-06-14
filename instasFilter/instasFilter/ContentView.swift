//
//  ContentView.swift
//  instasFilter
//
//  Created by Frederico Kuckelhaus on 14.06.21.
//

import SwiftUI




struct ContentView: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var isShowingPicker = false
    @State private var inputImage: UIImage?
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    isShowingPicker = true
                }
                HStack {
                    Text("Intensity")
                    Slider(value: self.$filterIntensity, in: 0...1, step: 0.05)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter") {
                        //                    change filter
                    }
                    Spacer()
                    Button("Save the picture"){
                        //                    save the picture
                    }
                }
            }
            .navigationTitle("InstaFilter")
            .sheet(isPresented: $isShowingPicker, onDismiss: loadImage, content: {
                ImagePicker(image: $inputImage)
            })
        }
        .padding([.bottom, .horizontal])


    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
