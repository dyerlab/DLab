//
//  SwiftUIView.swift
//
//
//  Created by Rodney Dyer on 5/10/22.
//

import SwiftUI

struct GenotypeView: View {
    @Binding var genotype: Genotype
    @State var reduced: Bool

    var body: some View {
        if reduced && genotype.masking == .MotherLeft {
            Text(String(":\(genotype.right)"))
        } else if reduced && genotype.masking == .MotherRight {
            Text(String("\(genotype.left):"))
        } else if reduced && genotype.masking == .Undefined {
            Text(String("\(genotype.left):\(genotype.right)"))
                .foregroundColor(.red)
        } else {
            Text(String("\(genotype.left):\(genotype.right)"))
        }
    }
}

struct GenotypeView_Previews: PreviewProvider {
    static var previews: some View {
        GenotypeView(genotype: .constant(Genotype.DefaultNULL()), reduced: false)
        GenotypeView(genotype: .constant(Genotype.DefaultHaploid()), reduced: false)
        GenotypeView(genotype: .constant(Genotype.DefaultHomozygote()), reduced: false)
        GenotypeView(genotype: .constant(Genotype.DefaultHeterozygote()), reduced: true)
        GenotypeView(genotype: .constant(Genotype.DefaultHeterozygoteMomLeft()), reduced: true)
        GenotypeView(genotype: .constant(Genotype.DefaultHeterozygoteMomRight()), reduced: true)
        GenotypeView(genotype: .constant(Genotype.DefaultHeterozygoteUndefined()), reduced: true)
    }
}
