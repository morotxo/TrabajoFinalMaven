<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Producto Items</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Producto Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Producto Items Found)<br />" rendered="#{producto.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{producto.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{producto.pagingInfo.firstItem + 1}..#{producto.pagingInfo.lastItem} of #{producto.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{producto.prev}" value="Previous #{producto.pagingInfo.batchSize}" rendered="#{producto.pagingInfo.firstItem >= producto.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{producto.next}" value="Next #{producto.pagingInfo.batchSize}" rendered="#{producto.pagingInfo.lastItem + producto.pagingInfo.batchSize <= producto.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{producto.next}" value="Remaining #{producto.pagingInfo.itemCount - producto.pagingInfo.lastItem}"
                                   rendered="#{producto.pagingInfo.lastItem < producto.pagingInfo.itemCount && producto.pagingInfo.lastItem + producto.pagingInfo.batchSize > producto.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{producto.productoItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdProducto"/>
                            </f:facet>
                            <h:outputText value="#{item.idProducto}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Descripcion"/>
                            </f:facet>
                            <h:outputText value="#{item.descripcion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Precio"/>
                            </f:facet>
                            <h:outputText value="#{item.precio}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Marca"/>
                            </f:facet>
                            <h:outputText value="#{item.marca}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Stock"/>
                            </f:facet>
                            <h:outputText value="#{item.stock}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Estado"/>
                            </f:facet>
                            <h:outputText value="#{item.estado}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdCATEGORIA"/>
                            </f:facet>
                            <h:outputText value="#{item.idCATEGORIA}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{producto.detailSetup}">
                                <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][producto.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{producto.editSetup}">
                                <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][producto.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{producto.remove}">
                                <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][producto.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{producto.createSetup}" value="New Producto"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
