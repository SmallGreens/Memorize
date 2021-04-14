	//
//  ContentView.swift
//  Memorize
//
//  Created by Matt Yin on 2021/4/14.
//
// 与 UI 相关的程序，加入 SwiftUI 模块
    
import SwiftUI

// struct 结构体，在C 语言中，它是 变量的容器。
// 但是在swift 中，它更加强大，它作为一个容器，不仅可以放置 变量，还可以放置函数。
struct ContentView: View {
    var body: some View {
        /*
         Hstack, zstack 都是组合视图。
         hstack 是水平显示的组合视图，而 zstack 是将其中元素覆盖叠加
         
         */
        HStack{
            // 0..<4 从 0 到 4，不包含4
            ForEach(0..<4) { index in
                CardView(isFaceUp: true)
            }
        }
            // 将 view 的相关操作写在最外层，效果是对 hstack 中的所有元素都起作用
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}
    
struct CardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack{
            if(isFaceUp){
                // 函数式语言的特点，每个函数返回的都是 view，可以链式调用
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                // 添加 emoji: 在 xcode 中，Edit 栏下，
                // 可以看到 `Emoji & Symbols` 选项卡。
                Text("😂")
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}
    
//
//    ZStack(content: { // 可以省略这里的 content，进而进一步的省略掉小括号
//        if(isFaceUp){
//            RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
//            RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
//            Text("😂")
//        }else{
//            RoundedRectangle(cornerRadius: 10.0).fill()
//        }
//    })

// 一段 “glue” 胶水代码，用于将当前的页面显示在 preview 界面上。
// -- preview 界面默认显示在窗口的右侧，点击 resume 可以显示 preview 页面。
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
