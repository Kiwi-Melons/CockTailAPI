//
//  CockTailListView.swift
//  CockTailAPI
//
//  Created by Joyce Wu (student LM) on 12/18/24.
//


import SwiftUI

struct CockTailListView: View {
    
    @Binding var viewState: ViewState

    @State var data: FetchData = FetchData()
    
    var body: some View {
        
        ScrollView{
            ForEach(data.response.drinks){ drink in
                
                Button {
                    viewState = .webView
                } label: {
                    ZStack {
                        VStack{
                            AsyncImage(url: drink.strDrinkThumb){phase in
                                switch phase{
                                case.failure:
                                    Image("fnf")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                    
                                case.success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(10)
                                        .padding()
                                    
                                default:
                                    ProgressView()
                                }
                            }.padding()
                            
                            Text(drink.strDrink ?? " ")
                                .bold()
                                .padding(.horizontal)
                        }
                    } .shadow(radius: 15)
                        .foregroundColor(.black)
                }

            }
        }.task{
            await data.getData()
        }
        
    }
}

#Preview {
    CockTailListView(viewState: .constant(.articleList))
}
