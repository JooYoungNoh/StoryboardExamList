//
//  GridRowView.swift
//  ExampleList
//
//  Created by 노주영 on 2023/11/20.
//

import SwiftUI

struct GridRowView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Text("< Back")
                        .font(.custom("NotoSansKR-Bold", size: 25))
                        .foregroundStyle(.black)
                        .bold()
                    
                })
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
            Grid(horizontalSpacing: 15) {
                
                GridRow(alignment: .top) {
                    Text("\(0)")
                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                        .background(Color(uiColor: UIColor.systemGray2))
                        .cornerRadius(8)
                    Image(systemName: "record.circle.fill")
                        .gridColumnAlignment(.leading)
                    Image(systemName: "record.circle.fill")
                    Image(systemName: "record.circle.fill")
                    Text("\(0)")
                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                        .background(Color(uiColor: UIColor.systemGray2))
                        .cornerRadius(8)
                }
                .font(.largeTitle)
                
                GridRow(alignment: .bottom) {
                    Text("\(0)")
                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                        .background(Color(uiColor: UIColor.systemGray2))
                        .cornerRadius(8)
                    Image(systemName: "record.circle.fill")
                    Image(systemName: "record.circle.fill")
                    Image(systemName: "record.circle.fill")
                    Text("\(0)")
                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                        .background(Color(uiColor: UIColor.systemGray2))
                        .cornerRadius(8)
                }
                .font(.largeTitle)
                
                GridRow {
                    ForEach(1...5, id: \.self) { index in
                        if index%2 == 1 {
                            Text("\(index)")
                                .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                                .background(Color(uiColor: UIColor.systemGray2))
                                .cornerRadius(8)
                        } else {
                            //빈 셀 추가
                            Color.clear.gridCellUnsizedAxes([.horizontal, .vertical])
                        }
                    }
                }
                
                Text("\(16)")
                    .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                    .background(Color(uiColor: UIColor.systemGray2))
                    .cornerRadius(8)
                
                GridRow {
                    Text("\(17)")
                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                        .background(Color(uiColor: UIColor.systemGray2))
                        .cornerRadius(8)
                        .gridCellColumns(2)
                    Text("\(18)")
                        .frame(minWidth: 50, maxWidth: .infinity, minHeight: 100)
                        .background(Color(uiColor: UIColor.systemGray2))
                        .cornerRadius(8)
                        .gridCellColumns(5)
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
    }
}
