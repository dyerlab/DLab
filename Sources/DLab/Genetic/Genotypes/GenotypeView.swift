//
//  SwiftUIView.swift
//  
//
//  Created by Rodney Dyer on 5/10/22.
//

import SwiftUI

struct GenotypeView: View {
    @Binding var genotype: Genotype
    
    var body: some View {
        Text("\(genotype.description)")
    }
}

struct GenotypeView_Previews: PreviewProvider {
    static var previews: some View {
        GenotypeView( genotype: .constant(Genotype()) )
    }
}
