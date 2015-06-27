<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Pedido Detail</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Pedido Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdPedido:"/>
                    <h:outputText value="#{pedido.pedido.idPedido}" title="IdPedido" />
                    <h:outputText value="Fecha:"/>
                    <h:outputText value="#{pedido.pedido.fecha}" title="Fecha" >
                        <f:convertDateTime pattern="MM/dd/yyyy" />
                    </h:outputText>
                    <h:outputText value="Formapago:"/>
                    <h:outputText value="#{pedido.pedido.formapago}" title="Formapago" />
                    <h:outputText value="Estado:"/>
                    <h:outputText value="#{pedido.pedido.estado}" title="Estado" />
                    <h:outputText value="Idcliente:"/>
                    <h:panelGroup>
                        <h:outputText value="#{pedido.pedido.idcliente}"/>
                        <h:panelGroup rendered="#{pedido.pedido.idcliente != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{cliente.detailSetup}">
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido.idcliente][cliente.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="pedido"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.PedidoController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{cliente.editSetup}">
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido.idcliente][cliente.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="pedido"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.PedidoController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{cliente.destroy}">
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido.idcliente][cliente.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="pedido"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.PedidoController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>

                    <h:outputText value="FacturaList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty pedido.pedido.facturaList}" value="(No Items)"/>
                        <h:dataTable value="#{pedido.pedido.facturaList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty pedido.pedido.facturaList}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="IdFactura"/>
                                </f:facet>
                                <h:outputText value="#{item.idFactura}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Preciototal"/>
                                </f:facet>
                                <h:outputText value="#{item.preciototal}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="IdPedido"/>
                                </f:facet>
                                <h:outputText value="#{item.idPedido}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{factura.detailSetup}">
                                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][factura.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="pedido" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.PedidoController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{factura.editSetup}">
                                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][factura.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="pedido" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.PedidoController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{factura.destroy}">
                                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][factura.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="pedido" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.PedidoController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{pedido.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{pedido.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][pedido.pedido][pedido.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{pedido.createSetup}" value="New Pedido" />
                <br />
                <h:commandLink action="#{pedido.listSetup}" value="Show All Pedido Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
