<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Producto</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Producto</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdProducto:"/>
                    <h:outputText value="#{producto.producto.idProducto}" title="IdProducto" />
                    <h:outputText value="Descripcion:"/>
                    <h:inputTextarea rows="4" cols="30" id="descripcion" value="#{producto.producto.descripcion}" title="Descripcion" />
                    <h:outputText value="Precio:"/>
                    <h:inputText id="precio" value="#{producto.producto.precio}" title="Precio" />
                    <h:outputText value="Marca:"/>
                    <h:inputText id="marca" value="#{producto.producto.marca}" title="Marca" />
                    <h:outputText value="Stock:"/>
                    <h:inputText id="stock" value="#{producto.producto.stock}" title="Stock" />
                    <h:outputText value="Estado:"/>
                    <h:inputText id="estado" value="#{producto.producto.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
                    <h:outputText value="IdCATEGORIA:"/>
                    <h:selectOneMenu id="idCATEGORIA" value="#{producto.producto.idCATEGORIA}" title="IdCATEGORIA" required="true" requiredMessage="The idCATEGORIA field is required." >
                        <f:selectItems value="#{categoria.categoriaItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{producto.edit}" value="Save">
                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{producto.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{producto.listSetup}" value="Show All Producto Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
