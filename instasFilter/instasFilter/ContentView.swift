//
//  ContentView.swift
//  instasFilter
//
//  Created by Frederico Kuckelhaus on 14.06.21.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins




struct ContentView: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()

            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImageTo) {
            ImagePicker(image: $inputImage)
        }


    }

    func loadImage(){
        guard let inputImage = UIImage(named: "Thriller") else { return }

        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()

        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1

        guard let outputImg = currentFilter.outputImage else { return }

        if let cgImg = context.createCGImage(outputImg, from: outputImg.extent) {
            let uiImage = UIImage(cgImage: cgImg)
            image = Image(uiImage: uiImage)
        }
    }
    func loadImageTo(){
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        let imageSaver = ImageSaver()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
