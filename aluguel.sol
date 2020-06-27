// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.6.10;

contract Aluguel
{
    string public locador;
    string public locatario;
    uint256 private valor;
    uint256 constant numeroMaximoLegaldeAlugueisParaMulta = 3;
    
    constructor (
        string memory nomeLocador,
        string memory nomeLocatario,
        uint256 valorDoAluguel
        )
    public
    {
        locador = nomeLocador;
        locatario = nomeLocatario;
        valor = valorDoAluguel;
    }

    function valorAtualDoAluguel () public view returns (uint256) {
        return valor;
     }
     
    function simulaMulta ( uint256 mesesRestantes,
                     uint256 totalMesesContato)   
    public
    view
    returns (uint256 valorMulta) {
        
        valorMulta = valor*2;
        valorMulta = valorMulta/totalMesesContato;
        valorMulta = valorMulta*mesesRestantes;
    }
}
