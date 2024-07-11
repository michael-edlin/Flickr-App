//
//  CardView.swift
//  Flickr App
//
//  Created by Tyler Edlin on 7/10/24.
//

import SwiftUI

struct CardView: View {
    var title: String
    var image: Image
    var description: String
    var author: String
    var published: String
    var width: String
    var height: String
    
    var body: some View {
        VStack {
            cardTitle
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(image.resizable().aspectRatio(contentMode: .fill))
        .frame(height: 300)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
        .overlay(
            cardDetails
                .frame(height: 140)
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .offset(y: 80)
                .padding(20)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text("Image Card"))    .accessibilityHint(Text("Displays details of the image"))
    }
    
    private var cardTitle: some View {
        VStack {
            Text(title).font(.headline)
                .offset(y: -10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .background(
            Rectangle().fill(.ultraThinMaterial)
                .blur(radius: 20)
                .offset(y: -20)
        )
    }
    
    private var cardDetails: some View {
        VStack {
            Text(description)
                .font(.subheadline)
                .accessibilityLabel(Text("Description"))
                .accessibilityValue(Text(description))
            
            Spacer()
            
            HStack(spacing: 10) {
                VStack(alignment: .leading) {
                    Text("Author").font(.subheadline).foregroundStyle(.secondary)
                    Text(author)
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("Published").font(.subheadline).foregroundStyle(.secondary)
                    Text(published)
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("Dimensions").font(.subheadline).foregroundStyle(.secondary)
                    Text("\(width)x\(height)")
                }
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .offset(y: 10)
            
            Spacer()
            
            HStack {
                HStack {
                    Image(systemName: "ellipsis")
                    Divider()
                    Image(systemName: "sparkle.magnifyingglass")
                    Divider()
                    Image(systemName: "face.smiling")
                }
                .padding()
                .frame(height: 44)
                .background(.linearGradient(colors: [.clear, .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .cornerRadius(20)
                .offset(x: -20, y: 20)
                
                Spacer()
                
                HStack {
                    Image(systemName: "square.and.arrow.down")
                }
                .padding()
                .frame(height: 44)
                .background(.linearGradient(colors: [.clear, .black.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.linearGradient(colors: [.white.opacity(0.3), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                )
                .cornerRadius(20)
                .offset(x: 20, y: 20)
            }
        }
    }
}
