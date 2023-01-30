//
//  ProfileView.swift
//  UniIkuraDon
//
//  Created by Takeshi Henmi on 2023/01/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showingUniFullScreenCover = false
    @State private var showingIkuraFullScreenCover = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("このアプリの登場人物")
                    .font(.title2)
                    .fontWeight(.bold)
                Group {
                    Button(action: {
                        self.showingUniFullScreenCover.toggle()
                    }) {
                        Image("UniProfileIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .cornerRadius(75)
                    }
                    .fullScreenCover(isPresented: $showingUniFullScreenCover) {
                        ProfileFullScreenView(iconName: "UniProfileIcon")
                    }
                    .buttonStyle(.borderless)
                    
                    HStack {
                        Text("うにお")
                            .font(.title3)
                            .fontWeight(.bold)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                    Text("スコティッシュ・フォールド、4歳、男性（去勢済み）、好きなおもちゃは長い紐、耳かき。声がでかくて汚い。人間語を話せそうなそぶりを見せるが「うに」以外の言葉は無視する。")
                    Spacer()
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.gray)
                        Text("日本、東京")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    .padding(.bottom, 16)
                }
                
                
                Group {
                    Button(action: {
                        self.showingIkuraFullScreenCover.toggle()
                    }) {
                        Image("IkuraProfileIcon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .cornerRadius(75)
                    }.fullScreenCover(isPresented: $showingIkuraFullScreenCover) {
                        ProfileFullScreenView(iconName: "IkuraProfileIcon")
                    }
                    .buttonStyle(.borderless)
                    
                    HStack {
                        Text("いくら")
                            .font(.title3)
                            .fontWeight(.bold)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color.blue)
                    }
                    Spacer()
                    Text("アメリカン・カール、4歳、男性（去勢済み）、好きなおもちゃはレーザー・ポインター。体が長く、足が短い。「ごはん」「ちゅーる」「食べる」「いくら」を認識。2021年にFIP：猫伝染性腹膜炎を克服。")
                    Spacer()
                    HStack {
                        Image(systemName: "location.fill")
                            .foregroundColor(.gray)
                        Text("日本、東京")
                            .foregroundColor(.gray)
                            .font(.callout)
                    }
                    .padding(.bottom, 16)
                }
                
                HStack {
                    Link(destination: URL(string: "https://twitter.com/UniLightning/")!) {
                        Image("TwitterIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 8)
                    }
                    .buttonStyle(.borderless)
                    
                    Link(destination: URL(string: "https://www.instagram.com/uni.theblacklightningcat/")!) {
                        Image("InstagramIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 8)
                    }
                    .buttonStyle(.borderless)
                    
                    Link(destination: URL(string: "https://www.youtube.com/channel/UCebDrnEmG7N3Ngi_UeIzz2A")!) {
                        Image("YoutubeIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding(.trailing, 8)
                    }
                    .buttonStyle(.borderless)
//
//                    Button(action: {
//                        let items = ["Uni Ikura Don APP!", Image("AppIcon"), URL(string: "https://google.com")!] as [Any]
//                        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
//                        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
//                        let rootViewController = windowScene?.windows.first?.rootViewController
//                        rootViewController?.present(activityController, animated: true, completion: {})
//
//                    }) {
//                        Image(systemName: "square.and.arrow.up")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 40, height: 40)
//                            .padding(.trailing, 8)
//                            .foregroundColor(Color.gray)
//                    }
//                    .buttonStyle(.borderless)
                }
                
                Divider()
                    .padding()
                
                Group {
                    Text("サードパーティソフトウェア")
                        .font(.headline)
                        .padding(.bottom, 16)
                    
                    Text("Alamofire")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("Copyright (c) 2014-2022 Alamofire Software Foundation (http://alamofire.org/)\n\nPermission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the \"Software\"), to deal\nin the Software without restriction, including without limitation the rights\n" +
                         "to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in\nall copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\n" +
                         "MPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN\nTHE SOFTWARE.")
                    .font(.caption)
                    .padding(.bottom, 16)
                    
                    Text("Unsplash API")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Unsplash grants you an irrevocable, nonexclusive, worldwide copyright license to download, copy, modify, distribute, perform, and use photos from Unsplash for free, including for commercial purposes, without permission from or attributing the photographer or Unsplash. This license does not include the right to compile photos from Unsplash to replicate a similar or competing service.")
                        .font(.caption)
                        .padding(.bottom, 16)
                }
            }.padding()
        }
    }
}

struct ProfileFullScreenView: View {
    let iconName: String
    @State private var magnifyBy = 1.0
    @State private var lastMagnificationValue = 1.0
    @Environment(\.dismiss) var dismiss
    
    var magnification: some Gesture {
        MagnificationGesture()
            .onChanged { value in
                // 前回の拡大率に対して今回の拡大率の割合を計算
                let changeRate = value / lastMagnificationValue
                // 前回からの拡大率の変更割合分を乗算する
                magnifyBy *= changeRate
                // 前回の拡大率を今回の拡大率で更新
                lastMagnificationValue = value
            }
            .onEnded { value in
                // 次回のジェスチャー時に1.0から始まる為、終了時に1.0に変更する
                lastMagnificationValue = 1.0
            }
    }
    
    var body: some View {
        ZStack {
            Image(iconName)
                .resizable()
                .scaleEffect(magnifyBy)
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .gesture(magnification)
                .background(Color(uiColor: UIColor(named: "DarkChoco")!))
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(Color.white)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding()
            .buttonStyle(.borderless)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
