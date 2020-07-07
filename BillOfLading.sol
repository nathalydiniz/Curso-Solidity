// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

// O Bill of Lading, também conhecido como conhecimento de embarque marítimo, é o documento emitido pelo transportador acerca do conteúdo da carga. 
//O BL é o principal documento nos contratos de transporte marítimo e possui como principais atores o importador, o exportador e o armador.

contract BillOfLanding {
    
    uint public valueCargo;
    
    struct importer {
        string nameImporter;
        address payable walletImporter;
    }
    
    struct exporter {
        string nameExporter;
        address payable walletExporter;    
    }
    
    struct carrier {
        string nameCarrier;
        address payable walletCarrier;
    }
    
    struct loading {
        string namePort;
        uint dateLoading;
    }
    
    struct discharge {
        string namePort;
        uint dateDischarge;
    }
    
    address payable public walletImporter;
    
    address payable public walletExporter;
    
    address payable public walletCarrier;
    
    constructor () public {
        uint _dateDischarge;
        uint dateLoading = now;
        uint _lateDays;
    }
    
    function paymentCargo (uint valueCargo, address payable walletExporter) public payable {
        walletExporter.transfer(valueCargo);
    }
    
    // Demurrage, ou sobrestadia, é a indenização diária, devida ao transportador, quando o importador permanece em posse do contêiner por um período superior ao tempo acordado.
    function simulaDemurrage (uint lateDays, uint priceDemurrage) public {
        priceDemurrage = ((valueCargo * 2) / 100) * lateDays;
        
    }
    
    function paymentDemurrage (uint _lateDays, uint priceDemurrage, address payable walletCarrier) public payable {
        require ( _lateDays > 0);
        walletCarrier.transfer(priceDemurrage);
    }
    
    //A responsabilidade pela contratação do seguro é estabelecida entre as partes no contrato comercial de compra e venda da carga e utiliza-se os INCOTERMS
    //(International Commercial Terms – Câmara Internacional do Comércio) para definir qual será a parte que suportará os riscos do transporte marítimo.
    function store(string memory incoterms) public {
        
    }    
}
