//
//  MonthTabItemView.swift
//  FixedCostManager
//
//  Created by Yota on 2022/02/03.
//

import SwiftUI

struct MonthTabItemView: View{
    let isSelected: Bool
    let name:String
    
    var body: some View{
        if isSelected {
            Text(name)
                .foregroundColor(.white)
                .frame(width:50, height: 30)
                .background(Color.green)
                .clipShape(Capsule())
        } else {
            Text(name)
                .foregroundColor(Color(.label))
        }
       
    }
}

struct MonthTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        MonthTabItemView(isSelected: true, name: "1月")
    }
}
