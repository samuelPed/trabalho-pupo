<%-- 
    Document   : editar
    Created on : 11/05/2020, 14:25:34
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Cliente"%>
<%
    String error = null;
    Cliente cliente = null;
    int i = -1;
    if (request.getParameter("i") != null) {
        i = Integer.parseInt(request.getParameter("i"));
        cliente = Bd.getCliente().get(i);
        if (cliente == null) {
            error = "Inidice invalido ";
        } else if (request.getParameter("editar") != null) {
            String nome = request.getParameter("nome");
            String rg = request.getParameter("rg");
            String email = request.getParameter("email");
            String endereco = request.getParameter("endereco");
            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
            if ((nome.isEmpty() || rg.isEmpty() || email.isEmpty() || endereco.isEmpty() || cpf.isEmpty() || telefone.isEmpty())) {
                error = "Nome invalido!";
            } else {
                Cliente editadoCliente = new Cliente();
                editadoCliente.setNome(nome);
                editadoCliente.setRg(rg);
                editadoCliente.setEmail(email);
                editadoCliente.setEndereco(endereco);
                editadoCliente.setCpf(cpf);
                editadoCliente.setTelefone(telefone);
                Bd.getCliente().set(i, editadoCliente);

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
        <title>Editar Cliente Web</title>
    </head>
    <body>
        <h1>Cliente Web App</h1>
        <h2> <a href="list.jsp">Usuários</a></h2>
        <h3>Editar</h3>
        <%if (error != null) {%>
        <div style="color:red"><%=error%></div>
        <%} else {%>

        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome do Cliente <br/>
            <input type="text" name="nome" value="<%=cliente.getNome()%>"/><br/>
            Rg do Cliente: <br/>
            <input type="text" name="rg" value="<%=cliente.getRg()%>"/><br/>
            Email do Cliente: <br/>
            <input type="email" name="email" value="<%=cliente.getEmail()%>"/><br/>
            Endereço do Cliente: <br/>
            <input type="text" name="endereco" value="<%=cliente.getEndereco()%>"/><br/>
            CPF do Cliente: <br/>
            <input type="number" name="cpf" value="<%=cliente.getCpf()%>"/><br/>
            Telefone do Cliente: <br/>
            <input type="number" name="telefone" value="<%=cliente.getTelefone()%>"/><br/>
            <input type="submit" name="editar" value="Editar"/><br/>
        </form>
        <%}%>
    </body>
</html>
