<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h1><h:outputText value="JavaServer Faces"/></h1>
                <h:form>
                    <h:commandLink action="#{producto.listSetup}" value="Show All Producto Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{pedido.listSetup}" value="Show All Pedido Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{factura.listSetup}" value="Show All Factura Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{cliente.listSetup}" value="Show All Cliente Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{categoria.listSetup}" value="Show All Categoria Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{administrador.listSetup}" value="Show All Administrador Items"/>
                </h:form>

        </body>
    </html>
</f:view>
