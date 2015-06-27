<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Categoria Detail</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Categoria Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdCATEGORIA:"/>
                    <h:outputText value="#{categoria.categoria.idCATEGORIA}" title="IdCATEGORIA" />
                    <h:outputText value="Nombre:"/>
                    <h:outputText value="#{categoria.categoria.nombre}" title="Nombre" />
                    <h:outputText value="Estado:"/>
                    <h:outputText value="#{categoria.categoria.estado}" title="Estado" />

                    <h:outputText value="ProductoList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty categoria.categoria.productoList}" value="(No Items)"/>
                        <h:dataTable value="#{categoria.categoria.productoList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty categoria.categoria.productoList}">
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
                                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][producto.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="categoria" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.CategoriaController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{producto.editSetup}">
                                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][producto.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="categoria" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.CategoriaController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{producto.destroy}">
                                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][producto.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="categoria" />
                                    <f:param name="jsfcrud.relatedControllerType" value="Facade.CategoriaController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{categoria.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{categoria.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{categoria.createSetup}" value="New Categoria" />
                <br />
                <h:commandLink action="#{categoria.listSetup}" value="Show All Categoria Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
