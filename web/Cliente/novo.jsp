<%-- 
    Document   : novo
    Created on : 11/05/2020, 14:25:52
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
        String erro = null;
        if (request.getParameter("add") != null) {
            String nome = request.getParameter("nome");
            String rg = request.getParameter("rg");
            String email = request.getParameter("email");
            String endereco = request.getParameter("endereco");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
            if (nome.isEmpty() || rg.isEmpty() || email.isEmpty() || endereco.isEmpty() || cpf.isEmpty() || telefone.isEmpty()) {
                %>
                        <h3>Campo vazio, por favor preencha todos os campos corretamente!</h3>
          <%
                } else {
                    Cliente cliente = new Cliente();
                    cliente.setNome(nome);
                    cliente.setRg(rg);
                    cliente.setEmail(email);
                    cliente.setEndereco(endereco);
                    cliente.setCpf(cpf);
                    cliente.setTelefone(telefone);
                    Bd.getCliente().add(cliente);

                    response.sendRedirect("listar.jsp");
                }
            }
        
    
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo - Fornecedor Web App</title>
    </head>
    <body>
        <h1>Fornecedor Web App</h1>
        <h2> <a href="listar.jsp">Fornecedor</a></h2>
        <h3>Novo</h3>
        <form method="post">
            Nome do Cliente: <br/>
            <input type="text" name="nome"/><br/>
            Rg: <br/>
            <input type="text" name="rg"/><br/>
            Email do Cliente: <br/>
            <input type="email" name="email"/><br/>
            Endereço: <br/>
            <input type="text" name="endereco"/><br/>
            CPF do Cliente: <br/>
            <input type="number" name="cpf"/><br/>
            Telefone: <br/>
            <input type="number" name="telefone"/><br/>
            <input type="submit" name="add" value="Adicionar"/><br/>
        </form>
    </body>
</html>
