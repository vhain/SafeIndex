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

import XCTest
import SafeIndex

class SafeIndexTests: XCTestCase {
    
    func testSafeIndex() {
        let arr = ["A", "B", "C"]
        XCTAssertEqual(arr[^0], "A")
        XCTAssertEqual(arr[^1], "B")
        XCTAssertEqual(arr[^2], "C")
        XCTAssertNil(arr[^3])
      
        var mutableArr = ["A", "B", "C"]
        XCTAssertEqual(mutableArr[^0], "A")
        XCTAssertEqual(mutableArr[^1], "B")
        XCTAssertEqual(mutableArr[^2], "C")
        XCTAssertNil(mutableArr[^3])
        mutableArr[^2] = "D"
        XCTAssertEqual(mutableArr[^2], "D")
    }
}
