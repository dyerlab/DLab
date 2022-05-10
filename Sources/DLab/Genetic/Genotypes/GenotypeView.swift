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
        GenotypeView( genotype: .constant( Genotype(raw:"A")))
        GenotypeView( genotype: .constant( Genotype(alleles: ("A","B"))))
        GenotypeView( genotype: .constant( Genotype(alleles: ("B","A"))))
    }
}
