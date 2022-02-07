//
//  HomeView.swift
//  FixedCostManager
//
//  Created by Yota on 2022/01/15.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm: HomeViewModel
    
    init(){
        vm = HomeViewModel()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                // 年
                Text(String(vm.year) + "年")
                // 月
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { proxy in
                        HStack {
                            ForEach(0..<vm.months.count) { num in
                                MonthTabItemView(isSelected: num + 1 == vm.month, name: "\(vm.months[num])月")
                                    .padding(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                                    .id(num)
                                    .onTapGesture(perform: {
                                        withAnimation {
                                            vm.selectMonth(index: num)
                                        }
                                    })
                            }
                        }
                        .onChange(of: vm.selectionMonth, perform: { index in
                            withAnimation {
                                proxy.scrollTo(index, anchor: .center)
                                vm.changeMonth(selection: index)
                            }
                        })
                    }
                }
                
                // 合計金額
                TabView(selection: $vm.selectionMonth) {
                    ForEach(0..<vm.months.count) { num in
                        ZStack {
                            Text("¥\(vm.getTotalCost())")
                                .font(
                                    .system(size: 32, weight: .black, design: .default))
                        }
                        .tag(num)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationBarTitle("ホーム", displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
