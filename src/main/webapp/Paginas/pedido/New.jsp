<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Pedido</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Pedido</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{pedido.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Fecha (MM/dd/yyyy):"/>
                    <h:inputText id="fecha" value="#{pedido.pedido.fecha}" title="Fecha" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:inputText>
                    <h:outputText value="Formapago:"/>
                    <h:inputText id="formapago" value="#{pedido.pedido.formapago}" title="Formapago" />
                    <h:outputText value="Estado:"/>
                    <h:inputText id="estado" value="#{pedido.pedido.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
                    <h:outputText value="Idcliente:"/>
                    <h:selectOneMenu id="idcliente" value="#{pedido.pedido.idcliente}" title="Idcliente" >
                        <f:selectItems value="#{cliente.clienteItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="FacturaList:"/>
                    <h:selectManyListbox id="facturaList" value="#{pedido.pedido.jsfcrud_transform[jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method.arrayToList].facturaList}" title="FacturaList" size="6" converter="#{factura.converter}" >
                        <f:selectItems value="#{factura.facturaItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{pedido.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{pedido.listSetup}" value="Show All Pedido Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
