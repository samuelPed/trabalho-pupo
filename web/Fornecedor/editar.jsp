<%-- 
    Document   : editar
    Created on : 11/05/2020, 14:26:59
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String error = null;
    Fornecedor fornecedor = null;
    int i = -1;
    if (request.getParameter("i") != null) {
        i = Integer.parseInt(request.getParameter("i"));
        fornecedor = Bd.getFornecedor().get(i);
        if (fornecedor == null) {
            error = "Inidice invalido ";
        } else if (request.getParameter("editar") != null) {
            String nome = request.getParameter("nome");
            String razaoSocial = request.getParameter("razaoSocial");
            String email = request.getParameter("email");
            String endereco = request.getParameter("endereco");
            String cnpj = request.getParameter("cnpj");
            String telefone = request.getParameter("telefone");
            if ((nome.isEmpty() || razaoSocial.isEmpty() || email.isEmpty() || endereco.isEmpty() || cnpj.isEmpty() || telefone.isEmpty())) {
                error = "Nome invalido!";
            } else {
                    Fornecedor editadoFornecedor = new Fornecedor();
                    editadoFornecedor.setNome(nome);
                    editadoFornecedor.setRazaoSocial(razaoSocial);
                    editadoFornecedor.setEmail(email);
                    editadoFornecedor.setEndereco(endereco);
                    editadoFornecedor.setCnpj(cnpj);
                    editadoFornecedor.setTelefone(telefone);
                    Bd.getFornecedor().set(i, editadoFornecedor);

                    response.sendRedirect("listar.jsp");
                }
            }
    
        } else {
            error = "indice invalido ";
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Fornecedor Web</title>
    </head>
    <body>
        <h1>Fornecedor Web App</h1>
        <h2> <a href="list.jsp">Usuários</a></h2>
        <h3>Editar</h3>
        <%if (error != null) {%>
        <div style="color:red"><%=error%></div>
        <%} else {%>

        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome do Fornecedor: <br/>
            <input type="text" name="nome" value="<%=fornecedor.getNome()%>"/><br/>
            Razão Social: <br/>
            <input type="text" name="razaoSocial" value="<%=fornecedor.getRazaoSocial()%>"/><br/>
            Email do Fornecedor: <br/>
            <input type="email" name="email" value="<%=fornecedor.getEmail()%>"/><br/>
            Endereço do Fornecedor: <br/>
            <input type="text" name="endereco" value="<%=fornecedor.getEndereco()%>"/><br/>
            CNPJ do Fornecedor: <br/>
            <input type="number" name="cnpj" value="<%=fornecedor.getCnpj()%>"/><br/>
            Telefone do Fornecedor: <br/>
            <input type="number" name="telefone" value="<%=fornecedor.getTelefone()%>"/><br/>
            <input type="submit" name="editar" value="Editar"/><br/>
        </form>
            <%} %>
    </body>
</html>
