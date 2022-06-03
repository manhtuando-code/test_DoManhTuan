import UIKit

protocol Stackable {
    associatedtype Element
    mutating func push(_ element: Element)
    func peek() -> Element?
    mutating func pop() -> Element?
    mutating func removeAll()
}

struct Stack<T>: Stackable {
    typealias Element = T
    fileprivate var elements = [Element]()
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    func peek() -> T? {
        return elements.last
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    mutating func removeAll() {
        elements.removeAll()
    }
}

var stackInt = Stack<Int>()

stackInt.push(3)
stackInt.push(5)


protocol Queuable {
    associatedtype Element
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
    mutating func removeAll()
    func peek() -> Element?
}

struct Queue<T>: Queuable {
    typealias Element = T
    fileprivate var elements = [Element]()
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard elements.isEmpty == false else {
            return nil
        }
        return elements.removeFirst()
    }
    
    mutating func removeAll() {
        elements.removeAll()
    }
    
    func peek() -> T? {
        return elements.first
    }
    
 
    
}
