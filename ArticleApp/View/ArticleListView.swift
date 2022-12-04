//
//  ArticleListView.swift
//  IconSplashSwiftUI
//
//  Created by Tiara H on 01/12/22.
//

import SwiftUI
import ActivityView
import CachedAsyncImage

struct ArticleListView: View {
    // MARK: - PROPERTIES
    @State var articles = dummyArticles.sorted { $0.title < $1.title }
    @State private var isLoading: Bool = true
    @State private var searchText: String = ""
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            List {
                ForEach(articles) { article in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: Text("Title \(article.title)")) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ArticleRow(article: article)
                        
                    } //: ZSTACK
                    
                } //: ForEach
                .onDelete { indexSet in
                    articles.remove(atOffsets: indexSet)
                }
                .redacted(reason: isLoading ? .placeholder : [])
                .onAppear {
                    fetchData()
                }
                .listRowSeparator(.hidden)
                
            } //: List
            .refreshable {
                print("refresh content")
            }
            .searchable(text: $searchText)
            .listStyle(.plain)
            .navigationTitle("Browse")
            
            
        } //: Navigation
        
    } //: BODY
    
    // MARK: - Function
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

// MARK: - PREVIEW
struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}

// MARK: - SUBVIEW
struct ArticleRow: View {
    
    @State var article: Article
    @State private var item: ActivityItem?
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            let url = URL(string: article.imageURL)
            
            CachedAsyncImage(url: url) { images in
                images
//                                            .resizeable()
                    .scaledToFill()
                
            } placeholder: {
                Color.gray.opacity(0.1)
//                RoundedRectangle(cornerRadius: 20)
//                    .background(.gray.opacity(0.1))
                
            }
            .frame(width: 120, height: 120)
            .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.system(.title3, design: .rounded))
                
                if article.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                        .padding(.vertical)
                }
            } //: VStack
            
        } //: HSTACK
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                
            } label: {
                Image(systemName: "pin")
            }
            .tint(.yellow)
            
            Button {
                
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
        }
        .contextMenu {
            Button {
                item = ActivityItem(items: "Article with title: \(article.title) will be shared!")
            } label: {
                HStack {
                    Text("Share articles")
                    Image(systemName: "square.and.arrow.up")
                }
            }
            
            Button {
                article.isFavorite.toggle()
            } label: {
                Text(article.isFavorite ? "Remove from Favorite" : "Mark as Favorite")
                Text("Mark as favorite")
                Image(systemName: "heart")
            }


        }
        
        .activitySheet($item)
    }
}
