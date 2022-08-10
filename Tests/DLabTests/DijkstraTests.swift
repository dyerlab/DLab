//
//  DijkstraTests.swift
//  
//
//  Created by Rodney Dyer on 8/10/22.
//
@testable import DLab


import XCTest

final class DijkstraTests: XCTestCase {

    

    func testDijkstra() throws {
        
        let graph = Graph()
        graph.isDirected = true
        
        graph.addNode(label: "A", size: 1.0)
        graph.addNode(label: "B", size: 1.0)
        graph.addNode(label: "C", size: 1.0)
        graph.addNode(label: "D", size: 1.0)
        graph.addNode(label: "E", size: 1.0)
        
        graph.addEdge(from: "A", to: "B", weight: 1.0)
        graph.addEdge(from: "A", to: "D", weight: 4.0)
        graph.addEdge(from: "B", to: "D", weight: 5.0)
        graph.addEdge(from: "B", to: "C", weight: 2.0)
        graph.addEdge(from: "D", to: "E", weight: 8.0)
        
        
        if let n1 = graph.getNode(label: "A"),
           let n2 = graph.getNode(label: "E") {
            let path = Dijkstra(from: n1, to: n2 )
            
            print("Path: \(path)")
        }
        
        
        
    }

}
