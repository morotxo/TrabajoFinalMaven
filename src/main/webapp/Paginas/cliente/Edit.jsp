<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Cliente</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Cliente</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdCliente:"/>
                    <h:outputText value="#{cliente.cliente.idCliente}" title="IdCliente" />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{cliente.cliente.email}" title="Email" required="true" requiredMessage="The email field is required." />
                    <h:outputText value="Telefono:"/>
                    <h:inputText id="telefono" value="#{cliente.cliente.telefono}" title="Telefono" required="true" requiredMessage="The telefono field is required." />
                    <h:outputText value="Ciudad:"/>
                    <h:inputText id="ciudad" value="#{cliente.cliente.ciudad}" title="Ciudad" required="true" requiredMessage="The ciudad field is required." />
                    <h:outputText value="Pais:"/>
                    <h:inputText id="pais" value="#{cliente.cliente.pais}" title="Pais" required="true" requiredMessage="The pais field is required." />
                    <h:outputText value="Nombre:"/>
                    <h:inputText id="nombre" value="#{cliente.cliente.nombre}" title="Nombre" required="true" requiredMessage="The nombre field is required." />
                    <h:outputText value="Apellido:"/>
                    <h:inputText id="apellido" value="#{cliente.cliente.apellido}" title="Apellido" required="true" requiredMessage="The apellido field is required." />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{cliente.cliente.password}" title="Password" required="true" requiredMessage="The password field is required." />
                    <h:outputText value="Estado:"/>
                    <h:inputText id="estado" value="#{cliente.cliente.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
                    <h:outputText value="PedidoList:"/>
                    <h:selectManyListbox id="pedidoList" value="#{cliente.cliente.jsfcrud_transform[jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method.arrayToList].pedidoList}" title="PedidoList" size="6" converter="#{pedido.converter}" >
                        <f:selectItems value="#{pedido.pedidoItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{cliente.edit}" value="Save">
                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{cliente.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{cliente.listSetup}" value="Show All Cliente Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
