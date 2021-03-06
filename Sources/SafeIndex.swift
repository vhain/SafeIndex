// The MIT License (MIT)
//
// Copyright (c) 2016 Suyeol Jeon (xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

public struct SafeIndex<T: ForwardIndexType> {
    var index: T
    init(_ index: T) {
        self.index = index
    }
}

prefix operator ^ {}
public prefix func ^ <T: ForwardIndexType>(index: T) -> SafeIndex<T> {
    return SafeIndex(index)
}

public extension MutableIndexable {
    public subscript(safe: SafeIndex<Self.Index>?) -> Self._Element? {
        get {
            guard let safe = safe else { return nil }
            return (self.startIndex..<self.endIndex).contains(safe.index) ? self[safe.index] : nil
        }
      
        set {
            guard let safe = safe, value = newValue where (self.startIndex..<self.endIndex).contains(safe.index) else { return }
            self[safe.index] = value
        }
    }
}
