//
//  PhotoDetailView.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import SwiftUI

struct PhotoDetailView: View {
    @Environment(\.dismiss) var dismiss
    // letで値渡しにするとindex=0で失敗するので、@Bindingにし、self.$xxxの参照渡しにする
    @Binding var photoId: String
    @State private var photoDetailData : UserPhotoDetailData? = nil
    @State var imageData: Data?
    private let repository = UserPhotoRepository()
    
    func load() {
        repository.getPhotoDetail(photoId: photoId) { result in
            switch result {
            case .success(let userPhotoDetailData):
                photoDetailData = userPhotoDetailData
                fetchImage()
            case .failure(let moyaError):
                print(moyaError.localizedDescription)
            }
        }
    }
    
    func fetchImage() {
        Task {
            guard imageData == nil else { return }
            let (data, response) = try await URLSession.shared.data(from: URL(string: photoDetailData!.urls!.raw!)!)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return
            }
            imageData = data
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .buttonStyle(.borderless)
                
                if let imageData = imageData {
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                Text(photoDetailData?.description ?? "No description.")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    Image(systemName: "camera.fill")
                        .foregroundColor(.gray)
                        .padding(.leading, 16)
                        .padding(.trailing, 4)
                    
                    Text(photoDetailData?.exif?.name ?? "No camera data.")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                        .padding(.leading, 16)
                        .padding(.trailing, 4)
                    
                    Text(photoDetailData?.createdAt?.prefix(10) ?? "No created date.")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .onAppear {
                load()
            }
        }
    }
}

//struct PhotoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoDetailView(photoId: "0")
//    }
//}
