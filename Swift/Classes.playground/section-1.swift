// Playground - noun: a place where people can play

import Foundation

class Resolution {
    var width = 0
    var height = 0
    
    init(width w: Int, height h: Int) {
        width = w
        height = h
    }
    
    convenience init() {
        self.init(width: 1280, height: 800)
    }
    
    func totalPixels() -> Int {
        return width * height
    }
}

let resolution = Resolution(width: 1280, height: 800)
let defaultResolution = Resolution()

defaultResolution.totalPixels()