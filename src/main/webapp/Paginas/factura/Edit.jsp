<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Factura</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Factura</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdFactura:"/>
                    <h:outputText value="#{factura.factura.idFactura}" title="IdFactura" />
                    <h:outputText value="Preciototal:"/>
                    <h:inputText id="preciototal" value="#{factura.factura.preciototal}" title="Preciototal" required="true" requiredMessage="The preciototal field is required." />
                    <h:outputText value="IdPedido:"/>
                    <h:selectOneMenu id="idPedido" value="#{factura.factura.idPedido}" title="IdPedido" required="true" requiredMessage="The idPedido field is required." >
                        <f:selectItems value="#{pedido.pedidoItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{factura.edit}" value="Save">
                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{factura.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{factura.listSetup}" value="Show All Factura Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
