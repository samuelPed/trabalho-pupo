<%-- 
    Document   : novo
    Created on : 11/05/2020, 14:26:35
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Fornecedor"%>
<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
        String erro = null;
        if (request.getParameter("add") != null) {
            String nome = request.getParameter("nome");
            String razaoSocial = request.getParameter("razaoSocial");
            String email = request.getParameter("email");
            String endereco = request.getParameter("endereco");
            String cnpj = request.getParameter("cnpj");
            String telefone = request.getParameter("telefone");
            if (nome.isEmpty() || razaoSocial.isEmpty() || email.isEmpty() || endereco.isEmpty() || cnpj.isEmpty() || telefone.isEmpty()) {
                %>
                        <h3>Campo vazio, por favor preencha todos os campos corretamente!</h3>
          <%
                } else {
                    Fornecedor fornecedor = new Fornecedor();
                    fornecedor.setNome(nome);
                    fornecedor.setRazaoSocial(razaoSocial);
                    fornecedor.setEmail(email);
                    fornecedor.setEndereco(endereco);
                    fornecedor.setCnpj(cnpj);
                    fornecedor.setTelefone(telefone);
                    Bd.getFornecedor().add(fornecedor);

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
            Nome do Fornecedor: <br/>
            <input type="text" name="nome"/><br/>
            Razão Social: <br/>
            <input type="text" name="razaoSocial"/><br/>
            Email do Fornecedor: <br/>
            <input type="email" name="email"/><br/>
            Endereço: <br/>
            <input type="text" name="endereco"/><br/>
            CNPJ do Fornecedor: <br/>
            <input type="number" name="cnpj"/><br/>
            Telefone: <br/>
            <input type="number" name="telefone"/><br/>
            <input type="submit" name="add" value="Adicionar"/><br/>
        </form>
    </body>
</html>
