<%-- 
    Document   : listar
    Created on : 11/05/2020, 14:26:19
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente -  Web App</title>
    </head>
    <body>
        <h1>Cliente Web App</h1>
        <h2>Clientes</h2>
        <h3>Lista</h3>
       
        <table border="1"> 
            <tr>
                <th>Nome do Fornecedor</th>
                <th>RG</th>
                <th>E-mail</th>
                <th>Endereço</th>
                <th>CPF</th>
                <th>Telefone</th>
                <th>Comandos</th>
            </tr>
            <%for (Cliente cliente : Bd.getCliente()) {%>

            <tr>
                <td><%= cliente.getNome()%></td>
                <td><%= cliente.getRg()%></td>
                <td><%= cliente.getEmail()%></td>
                <td><%= cliente.getEndereco()%></td>
                <td><%= cliente.getCpf()%></td>
                <td><%= cliente.getTelefone()%></td>
                <td>
                    <% int i = Bd.getCliente().indexOf(cliente);%>  
                    <a href="editar.jsp?i=<%=i%>">Alterar</a><br/>
                    <a href="deletar.jsp?i=<%=i%>">Excluir</a><br/>    
                </td>
            </tr>
            <%}%>
            <tr>
                <th colspan="3" align="center"><a href="../index.jsp">Voltar ao inicio</a></th>
                <th colspan="4" align="center"><a href="novo.jsp">Adicionar novo Cliente</a></th>
            </tr>
        </table>
    </body>
</html>
