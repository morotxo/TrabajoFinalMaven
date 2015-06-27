<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Factura Items</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Factura Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Factura Items Found)<br />" rendered="#{factura.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{factura.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{factura.pagingInfo.firstItem + 1}..#{factura.pagingInfo.lastItem} of #{factura.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{factura.prev}" value="Previous #{factura.pagingInfo.batchSize}" rendered="#{factura.pagingInfo.firstItem >= factura.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{factura.next}" value="Next #{factura.pagingInfo.batchSize}" rendered="#{factura.pagingInfo.lastItem + factura.pagingInfo.batchSize <= factura.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{factura.next}" value="Remaining #{factura.pagingInfo.itemCount - factura.pagingInfo.lastItem}"
                                   rendered="#{factura.pagingInfo.lastItem < factura.pagingInfo.itemCount && factura.pagingInfo.lastItem + factura.pagingInfo.batchSize > factura.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{factura.facturaItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][factura.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{factura.editSetup}">
                                <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][factura.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{factura.remove}">
                                <f:param name="jsfcrud.currentFactura" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][factura.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{factura.createSetup}" value="New Factura"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
