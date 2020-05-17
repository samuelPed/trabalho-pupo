/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.gov.sp.fatec.cadastro;

import java.util.ArrayList;

/**
 *
 * @author k3k1z3r0
 */
public class Bd {
    private static ArrayList<Cliente> uc;
    private static ArrayList<Fornecedor> uf;
    
    public static ArrayList<Cliente> getCliente()
    {
        if(uc == null)
        {
            uc = new ArrayList<>();
            Cliente usuario_cliente = new Cliente();
            usuario_cliente.setNome("Administrador do Sistema");
            usuario_cliente.setCpf("411.889.967-14");
            usuario_cliente.setEndereco("Rua Antonio Peixoto");
            usuario_cliente.setRg("123456789");
            usuario_cliente.setEmail("admon@empresa.com");
            usuario_cliente.setTelefone("123456789");
            
            
            uc.add(usuario_cliente);
            
        }
        
        return uc;
    }
    public static ArrayList<Fornecedor> getFornecedor()
    {
        if(uf == null)
        {
            uf = new ArrayList<>();
            Fornecedor usuario_fornecedor = new Fornecedor();
            usuario_fornecedor.setNome("Administrador do Sistema");
            usuario_fornecedor.setRazaoSocial("411.889.967-14");
            usuario_fornecedor.setEndereco("Rua Antonio Peixoto");
            usuario_fornecedor.setCnpj("411.889.967-14");
            usuario_fornecedor.setEmail("admon@empresa.com");
            usuario_fornecedor.setTelefone("411.889.967-14");
            
            
            uf.add(usuario_fornecedor);
            
        }
        
        return uf;
    }
    
}
