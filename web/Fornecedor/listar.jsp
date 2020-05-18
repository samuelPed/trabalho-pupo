<%-- 
    Document   : listar
    Created on : 11/05/2020, 14:27:17
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fornecedor -  Web App</title>
    </head>
    <body>
        <h1>Fornecedor Web App</h1>
        <h2>Fornecedores</h2>
        <h3>Lista</h3>
        <table border="1"> 
            <tr>
                <th>Nome do Fornecedor</th>
                <th>Razão Social</th>
                <th>E-mail</th>
                <th>Endereço</th>
                <th>CNPJ</th>
                <th>Telefone</th>
                <th>Comandos</th>
            </tr>
            <%for (Fornecedor fornecedor : Bd.getFornecedor()) {%>

            <tr>
                <td><%= fornecedor.getNome()%></td>
                <td><%= fornecedor.getRazaoSocial()%></td>
                <td><%= fornecedor.getEmail()%></td>
                <td><%= fornecedor.getEndereco()%></td>
                <td><%= fornecedor.getCnpj()%></td>
                <td><%= fornecedor.getTelefone()%></td>
                <td>
                    <% int i = Bd.getFornecedor().indexOf(fornecedor);%>  
                    <a href="editar.jsp?i=<%=i%>">Alterar</a><br/>
                    <a href="deletar.jsp?i=<%=i%>">Excluir</a><br/>     
                </td>
            </tr>
            <%}%>
            <tr>
                <th colspan="3" align="center"><a href="../index.jsp">Voltar ao inicio</a></th>
                <th colspan="4" align="center"><a href="novo.jsp">Adicionar novo Fornecedor</a></th>
            </tr>
        </table>
    </body>

</html>
