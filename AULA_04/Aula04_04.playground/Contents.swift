import UIKit

//Protocolos

//Estrutura
//protocol SomeProtocol {
//
//}

protocol ReformarCampo {
    func plantarNovaGrama()
    func pintarNovasLinhas()
}

class EmpresaA: ReformarCampo {
    func plantarNovaGrama(){
        //contratarVariosEmpregados()
        //fazerOsEmpregadosPlantaremGrama()
    }

    func pintarNovasLinhas(){
        //contratarVariosEmpregados()
        //fazerOsEmpregadosPintaremAsLinhas()
    }
}

class EmpresaB: ReformarCampo {
    func plantarNovaGrama(){
        //comprarMaquinas()
        //usarMaquinasParaPlantarGrama()
    }

    func pintarNovasLinhas(){
        //comprarMaquinas()
        //usarMaquinasParaPintarLinhas()
    }
}
