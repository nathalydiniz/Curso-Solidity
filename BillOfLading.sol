// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

// O Bill of Lading, também conhecido como conhecimento de embarque marítimo, é o documento emitido pelo transportador acerca do conteúdo da carga. 
//O BL é o principal documento nos contratos de transporte marítimo e possui como principais atores o importador, o exportador e o armador.

contract BillOfLanding {
    
    uint public valueCargo;
    address public importer;
    address public exporter;
    address public carrier;
    string public portLoading;
    string public portDischarge;
    string public incoterms;
    Container public containerCargo;
    
    struct Container {
        uint serialNumber;
        string contentDescription;
        uint weight;
        uint volume;
    }
    
    constructor (
        uint _valueCargo,
        address _importer,
        address _exporter,
        address _carrier,
        string memory _portLoading,
        string memory _portDischarge
        ) public {
        valueCargo = _valueCargo;
        importer = _importer;
        exporter = _exporter;
        carrier = _carrier;
        portLoading = _portLoading;
        portDischarge = _portDischarge;
    }
    
    function setContainer (uint _serialNumber, string memory _contentDescription, uint _weight, uint _volume)
    public {
        containerCargo = Container (_serialNumber, _contentDescription, _weight, _volume);
    }
    
    function paymentCargo (address payable walletExporter) public payable {
        walletExporter.transfer(valueCargo);
    }
    
    // Demurrage, ou sobrestadia, é a indenização diária, devida ao transportador, quando o importador permanece em posse do contêiner por um período superior ao tempo acordado.
    function simulaDemurrage (uint _lateDays) public view returns (uint priceDemurrage) {
        priceDemurrage = ((valueCargo*2)/100)*_lateDays;
        return priceDemurrage;
    }
    
    function paymentDemurrage (uint _lateDays, uint priceDemurrage, address payable walletCarrier) public payable {
        require ( _lateDays > 0);
        walletCarrier.transfer(priceDemurrage);
    }
    
    //A responsabilidade pela contratação do seguro é estabelecida entre as partes no contrato comercial de compra e venda da carga e utiliza-se os INCOTERMS
    //(International Commercial Terms – Câmara Internacional do Comércio) para definir qual será a parte que suportará os riscos do transporte marítimo.
    function setIncoterms (string memory _inconterms) public {
        incoterms = _inconterms;
    }
 
}
