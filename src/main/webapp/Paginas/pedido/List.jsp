<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Pedido Items</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Pedido Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Pedido Items Found)<br />" rendered="#{pedido.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{pedido.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{pedido.pagingInfo.firstItem + 1}..#{pedido.pagingInfo.lastItem} of #{pedido.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{pedido.prev}" value="Previous #{pedido.pagingInfo.batchSize}" rendered="#{pedido.pagingInfo.firstItem >= pedido.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{pedido.next}" value="Next #{pedido.pagingInfo.batchSize}" rendered="#{pedido.pagingInfo.lastItem + pedido.pagingInfo.batchSize <= pedido.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{pedido.next}" value="Remaining #{pedido.pagingInfo.itemCount - pedido.pagingInfo.lastItem}"
                                   rendered="#{pedido.pagingInfo.lastItem < pedido.pagingInfo.itemCount && pedido.pagingInfo.lastItem + pedido.pagingInfo.batchSize > pedido.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{pedido.pedidoItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][pedido.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{pedido.editSetup}">
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][pedido.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{pedido.remove}">
                                <f:param name="jsfcrud.currentPedido" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][pedido.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{pedido.createSetup}" value="New Pedido"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
