//
//  statefulPreviewWrapper.swift
//  swiftUI-demo
//
//  Created by Đoàn Văn Quang on 11/5/25.
//

import SwiftUI

//// Wrapper cho collection (nếu cần)
//struct StatefulPreviewWrapper<Value: MutableCollection & RandomAccessCollection & RangeReplaceableCollection, Content: View>: View where Value.Index == Int {
//    @State private var value: Value
//    var content: (Binding<Value>) -> Content
//
//    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
//        _value = State(initialValue: value)
//        self.content = content
//    }
//
//    var body: some View {
//        content($value)
//    }
//}

// Overload cho các kiểu đơn giản như Bool, Int, String...
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}
