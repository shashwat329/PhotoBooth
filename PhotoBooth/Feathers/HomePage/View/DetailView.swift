//
//  DetailView.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//

import SwiftUI

struct DetailView: View {
    @State var item: ImageData
    @State var items: [ImageData]
    @State private var currentIndex: Int = 0

    var body: some View {
            TabView(selection: $currentIndex) {
                ForEach(items.indices, id: \.self) { index in
                    ScrollView{
                    VStack(spacing: 0) {
                        AsyncImageView(
                            url: URL(string: items[index].urls.full)!,
                            placeholder: AnyView(
                                ZStack {
                                    Color.gray.opacity(0.1)
                                    ShimmerView()
                                        .frame(height: 500)
                                        .tint(.blue)
                                }
                            )
                        )
                        Text(items[index].slug)
                            .font(.title3)
                    }
                    .tag(index)
                }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onAppear {
                if let initialIndex = items.firstIndex(where: { $0.id == item.id }) {
                    currentIndex = initialIndex
                }
            }
            HStack(spacing: 8) {
                let visibleRange = max(0, currentIndex - 2)...min(items.count - 1, currentIndex + 2)
                
                ForEach(visibleRange, id: \.self) { index in
                    Circle()
                        .fill(currentIndex == index ? Color.blue : Color.gray.opacity(0.4))
                        .frame(width: currentIndex == index ? 10 : 8,
                               height: currentIndex == index ? 10 : 8)
                        .animation(.easeInOut(duration: 0.2), value: currentIndex)
                }
            }
            .padding(.vertical, 10)
            .navigationBarTitleDisplayMode(.automatic)
    }
}
