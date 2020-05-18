<%-- 
    Document   : deletar
    Created on : 11/05/2020, 14:26:09
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String erro = null;
    Cliente cliente = null;
    int i = -1;

    if (request.getParameter("i") != null) {
        i = Integer.parseInt(request.getParameter("i"));
        cliente = Bd.getCliente().get(i);

        if (cliente == null) {
            erro = "Inidice invalido ";
        } else {
            if (cliente != null) {

                Bd.getCliente().remove(i);
                response.sendRedirect("listar.jsp");

            }

        }
    } else {

        erro = "indice invalido000 ";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar Cliente Web</title>
    </head>
    <body>
        <h1>Cliente Web App</h1>
        <h2> <a href="listar.jsp">Cliente</a></h2>
        <h3>Excluir</h3>
        <%if (erro != null) {%>
        <div style="color:red"><%=erro%></div>
        <%} else {%>

        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome do Fornecedor: <br/>
            <b><%=cliente.getNome()%>/></b><br/>
            RG: <br/>
            <b><%=cliente.getRg()%>/></b><br/>
            Email do Fornecedor: <br/>
            <b><%=cliente.getEmail()%>"</b><br/>
            Endereço do Fornecedor: <br/>
            <b><%=cliente.getEndereco()%>/></b><br/>
            CPF do Fornecedor: <br/>
            <b><%=cliente.getCpf()%>/></b><br/>
            Telefone do Fornecedor: <br/>
            <b><%=cliente.getTelefone()%>/></b><br/>
            <input type="submit" name="deletar" value="Excluir"/><br/>
        </form>
        <%}%>
        <h3><a href="Cliente/listar.jsp">CLIENTE</a></h3>
    </body>
</html>