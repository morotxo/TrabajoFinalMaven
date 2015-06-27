<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Categoria</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Categoria</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{categoria.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Nombre:"/>
                    <h:inputText id="nombre" value="#{categoria.categoria.nombre}" title="Nombre" />
                    <h:outputText value="Estado:"/>
                    <h:inputText id="estado" value="#{categoria.categoria.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />
                    <h:outputText value="ProductoList:"/>
                    <h:selectManyListbox id="productoList" value="#{categoria.categoria.jsfcrud_transform[jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method.arrayToList].productoList}" title="ProductoList" size="6" converter="#{producto.converter}" >
                        <f:selectItems value="#{producto.productoItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{categoria.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{categoria.listSetup}" value="Show All Categoria Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
