<%-- 
    Document   : deletar
    Created on : 11/05/2020, 14:34:48
    Author     : extra
--%>

<%@page import="br.gov.sp.fatec.cadastro.Bd"%>
<%@page import="br.gov.sp.fatec.cadastro.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    String erro = null;
    Fornecedor fornecedor = null;
    int i = -1;

    if(request.getParameter("i") != null ){
            i = Integer.parseInt(request.getParameter("i"));
        fornecedor = Bd.getFornecedor().get(i);
 
                    
        if(fornecedor == null){
            erro = "Inidice invalido ";
        }else{
            if(fornecedor != null){
                
                Bd.getFornecedor().remove(i);
                    response.sendRedirect("listar.jsp");
                
            }
           
                
                    
                    
            
            
    }
    }
    
            else{
            
              
                 erro = "indice invalido000 ";
                    }
        
        
    
       
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletar Fornecedor Web</title>
    </head>
    <body>
       <h1>Fornecedor Web App</h1>
       <h2> <a href="listar.jsp">Fornecedores</a></h2>
        <h3>Excluir</h3>
        <%if (erro != null){%>
        <div style="color:red"><%=erro%></div>
        <%}else{%>
      
        <form method="post">
            <input type="hidden" name="i" value="<%=i%>"/>
            Nome do Fornecedor: <br/>
            <b><%=fornecedor.getNome()%>/></b><br/>
            Razão Social: <br/>
            <b><%=fornecedor.getRazaoSocial()%>/></b><br/>
            Email do Fornecedor: <br/>
            <b><%=fornecedor.getEmail()%>"</b><br/>
            Endereço do Fornecedor: <br/>
            <b><%=fornecedor.getEndereco()%>/></b><br/>
            CNPJ do Fornecedor: <br/>
            <b><%=fornecedor.getCnpj()%>/></b><br/>
            Telefone do Fornecedor: <br/>
            <b><%=fornecedor.getTelefone()%>/></b><br/>
            <input type="submit" name="deletar" value="Excluir"/><br/>
        </form>
            <%}%>
    </body>
</html>
