//
//  HomeView 2.swift
//  PhotoBooth
//
//  Created by shashwat singh on 28/10/25.
//


import SwiftUI

struct HomeView: View {
    let columns = [GridItem(.adaptive(minimum: 120), spacing: 16)]
    @StateObject private var vm = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                if vm.isLoading {
                    SkeletonView()
                } else if let errorMessage = vm.errorMessage {
                    VStack {
                        Text("⚠️ \(errorMessage)")
                            .foregroundColor(.red)
                        Button("Retry") {
                            Task { await vm.loadData() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(vm.imageData) { data in
                                NavigationLink {
                                    DetailView(item: data, items: vm.imageData)
//                                    SwiftUIView()
                                } label: {
                                    AsyncImage(url: URL(string: data.urls.small)) { phase in
                                        switch phase {
                                        case .empty:
                                                ShimmerView()
                                                .frame(width: 150, height: 150)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .scaledToFit()
//                                                .frame(width: 120, height: 120)
                                                .clipped()
                                                .cornerRadius(10)
                                        case .failure:
                                            Image(systemName: "photo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 120, height: 120)
                                                .foregroundColor(.gray)
                                        @unknown default:
                                            EmptyView()
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .refreshable {
                        await vm.loadData()
                    }
                }
            }
            .task {
                await vm.loadData()
            }
            .navigationTitle("PhotoBooth".uppercased())
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}
