<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Cliente Detail</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Cliente Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdCliente:"/>
                    <h:outputText value="#{cliente.cliente.idCliente}" title="IdCliente" />
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{cliente.cliente.email}" title="Email" />
                    <h:outputText value="Telefono:"/>
                    <h:outputText value="#{cliente.cliente.telefono}" title="Telefono" />
                    <h:outputText value="Ciudad:"/>
                    <h:outputText value="#{cliente.cliente.ciudad}" title="Ciudad" />
                    <h:outputText value="Pais:"/>
                    <h:outputText value="#{cliente.cliente.pais}" title="Pais" />
                    <h:outputText value="Nombre:"/>
                    <h:outputText value="#{cliente.cliente.nombre}" title="Nombre" />
                    <h:outputText value="Apellido:"/>
                    <h:outputText value="#{cliente.cliente.apellido}" title="Apellido" />
                    <h:outputText value="Password:"/>
                    <h:outputText value="#{cliente.cliente.password}" title="Password" />
                    <h:outputText value="Estado:"/>
                    <h:outputText value="#{cliente.cliente.estado}" title="Estado" />

                    <h:outputText value="PedidoList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty cliente.cliente.pedidoList}" value="(No Items)"/>
                        <h:dataTable value="#{cliente.cliente.pedidoList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty cliente.cliente.pedidoList}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="IdPedido"/>
                                </f:facet>
                                <h:outputText value="#{item.idPedido}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Fecha"/>
                                </f:facet>
                                <h:outputText value="#{item.fecha}">
                                    <f:convertDateTime pattern="MM/dd/yyyy" />
                                </h:outputText>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Formapago"/>
                                </f:facet>
                                <h:outputText value="#{item.formapago}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Estado"/>
                                </f:facet>
                                <h:outputText value="#{item.estado}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Idcliente"/>
                                </f:facet>
                                <h:outputText value="#{item.idcliente}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{pedido.detailSetup}">
                                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][pedido.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="cliente" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.ClienteController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{pedido.editSetup}">
                                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][pedido.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="cliente" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.ClienteController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{pedido.destroy}">
                                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][pedido.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="cliente" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.ClienteController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{cliente.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{cliente.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{cliente.createSetup}" value="New Cliente" />
                <br />
                <h:commandLink action="#{cliente.listSetup}" value="Show All Cliente Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
