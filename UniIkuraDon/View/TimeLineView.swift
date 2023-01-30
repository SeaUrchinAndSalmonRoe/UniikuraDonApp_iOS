//
//  TimeLineView.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import SwiftUI

struct TimeLineView: View {
    @State private var showingFullScreenCover = false
    @State private var listItem = [UserPhotoListData]()
    @State var photoId = ""
    private let repository = UserPhotoRepository()
    
    func load() {
        repository.getPhotoListData { result in
            switch result {
            case .success(let userPhotoListData):
                listItem = userPhotoListData
            case .failure(let moyaError):
                print(moyaError.localizedDescription)
            }
        }
    }
    
    var body: some View {
        List(listItem.indices, id:\.self) { index in
            ListItemView(
                showingFullScreenCover: $showingFullScreenCover,
                userPhotoListData: listItem[index]
            )
            .onTapGesture {
                self.showingFullScreenCover = true
                self.photoId = listItem[index].id!
            }
            .fullScreenCover(isPresented: $showingFullScreenCover) {
                // 参照渡しにしないと1回目失敗する
                PhotoDetailView(photoId: self.$photoId)
            }
        }
        .listStyle(PlainListStyle())
        .onAppear(perform: load)
    }
}

struct ListItemView: View {
    @Binding var showingFullScreenCover: Bool
    @State var userPhotoListData: UserPhotoListData
    @State var imageData: Data?
    @State var canShowText = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let imageData = imageData {
                Image(uiImage: UIImage(data: imageData)!)
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                        canShowText = true
                    }
            } else {
                ProgressView("Downloading...")
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                    .padding(.vertical, 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray)
                            .opacity(0.2)
                            .padding()
                    )
            }
            
            if canShowText {
                ZStack {
                    Text(userPhotoListData.description ?? "No description.")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.white)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.5))
            }
        }
        .listRowInsets(EdgeInsets())
        .onAppear {
            fetch()
        }
    }
    
    func fetch() {
        Task {
            guard imageData == nil else { return }
            let (data, response) = try await URLSession.shared.data(from: URL(string: userPhotoListData.urls!.raw!)!)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return
            }
            imageData = data
        }
    }
    
    //    func fetch() {
    //            AsyncImage(
    //                url: imageUrl,
    //                transaction: Transaction(animation: .easeInOut(duration: 0.6))
    //            ) { phase in
    //                switch phase {
    //                case .success(let image):
    //                    image
    //                        .resizable()
    //                        .scaledToFit()
    //                        .frame(width: .infinity)
    //                        .onAppear(perform: {
    //                            tex = userPhotoListData.description ?? "No description."
    //                        })
    //                case .failure(_):
    //                    EmptyView()
    //                        .onAppear(perform: {
    //                            tex = ""
    //                        })
    //                case .empty:
    //                    ProgressView()
    //                        .frame(maxWidth: .infinity, alignment: .center)
    //                @unknown default:
    //                    EmptyView()
    //                }
    //            }
    //    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView()
    }
}
