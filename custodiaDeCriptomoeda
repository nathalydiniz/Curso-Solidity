// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract CustodiaDeCriptomoeda
{
    string public custodiante; // Empresa custodiante de criptpoativos
    string public cliente; // Investidor de criptpoativos
    uint256 public valor;  //Numerário investido pelo Cliente em criptpoativos na Custodiante
    uint256 private valorRendimentoDiario;

    constructor (
        string memory nomeCustodiante,
        string memory nomeCliente,
        uint256 valorAporte
        )
    public
    {
        custodiante = nomeCustodiante;
        cliente = nomeCliente;
        valorRendimentoDiario = valorAporte/250;
    }

    function simulaMulta ( uint256 diasAtrasoLiberacaoSaque) public view returns (uint256 valorMulta)
    {
        valorMulta = ((valorRendimentoDiario/2)*diasAtrasoLiberacaoSaque);
    }
    
     function acrescimoDeRendimento (uint256 valorAporte) public {
    
        if (valorAporte >= 10000 && valorAporte < 50000) {
            valorRendimentoDiario = valorAporte/200;
        } else if (valorAporte > 50000) {
            valorRendimentoDiario = valorAporte/180;
        }  
    }
}
