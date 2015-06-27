<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Factura Detail</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Factura Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdFactura:"/>
                    <h:outputText value="#{factura.factura.idFactura}" title="IdFactura" />
                    <h:outputText value="Preciototal:"/>
                    <h:outputText value="#{factura.factura.preciototal}" title="Preciototal" />
                    <h:outputText value="IdPedido:"/>
                    <h:panelGroup>
                        <h:outputText value="#{factura.factura.idPedido}"/>
                        <h:panelGroup rendered="#{factura.factura.idPedido != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{pedido.detailSetup}">
                                <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura.idPedido][pedido.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="factura"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.FacturaController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{pedido.editSetup}">
                                <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura.idPedido][pedido.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="factura"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.FacturaController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{pedido.destroy}">
                                <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura.idPedido][pedido.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="factura"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.FacturaController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{factura.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{factura.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][factura.factura][factura.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{factura.createSetup}" value="New Factura" />
                <br />
                <h:commandLink action="#{factura.listSetup}" value="Show All Factura Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
