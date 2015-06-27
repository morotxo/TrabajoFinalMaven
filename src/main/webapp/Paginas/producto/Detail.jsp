<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Producto Detail</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Producto Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="IdProducto:"/>
                    <h:outputText value="#{producto.producto.idProducto}" title="IdProducto" />
                    <h:outputText value="Descripcion:"/>
                    <h:outputText value="#{producto.producto.descripcion}" title="Descripcion" />
                    <h:outputText value="Precio:"/>
                    <h:outputText value="#{producto.producto.precio}" title="Precio" />
                    <h:outputText value="Marca:"/>
                    <h:outputText value="#{producto.producto.marca}" title="Marca" />
                    <h:outputText value="Stock:"/>
                    <h:outputText value="#{producto.producto.stock}" title="Stock" />
                    <h:outputText value="Estado:"/>
                    <h:outputText value="#{producto.producto.estado}" title="Estado" />
                    <h:outputText value="IdCATEGORIA:"/>
                    <h:panelGroup>
                        <h:outputText value="#{producto.producto.idCATEGORIA}"/>
                        <h:panelGroup rendered="#{producto.producto.idCATEGORIA != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{categoria.detailSetup}">
                                <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto.idCATEGORIA][categoria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="producto"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.ProductoController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{categoria.editSetup}">
                                <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto.idCATEGORIA][categoria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="producto"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.ProductoController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{categoria.destroy}">
                                <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto.idCATEGORIA][categoria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="producto"/>
                                <f:param name="jsfcrud.relatedControllerType" value="Facade.ProductoController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{producto.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{producto.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentProducto" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][producto.producto][producto.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{producto.createSetup}" value="New Producto" />
                <br />
                <h:commandLink action="#{producto.listSetup}" value="Show All Producto Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
