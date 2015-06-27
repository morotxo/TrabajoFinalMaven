<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Administrador</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Administrador</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{administrador.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Nombre:"/>
                    <h:inputText id="nombre" value="#{administrador.administrador.nombre}" title="Nombre" />
                    <h:outputText value="Apellido:"/>
                    <h:inputText id="apellido" value="#{administrador.administrador.apellido}" title="Apellido" />
                    <h:outputText value="Telefono:"/>
                    <h:inputText id="telefono" value="#{administrador.administrador.telefono}" title="Telefono" />
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{administrador.administrador.email}" title="Email" />
                    <h:outputText value="Password:"/>
                    <h:inputText id="password" value="#{administrador.administrador.password}" title="Password" />
                    <h:outputText value="Estado:"/>
                    <h:inputText id="estado" value="#{administrador.administrador.estado}" title="Estado" required="true" requiredMessage="The estado field is required." />

                </h:panelGrid>
                <br />
                <h:commandLink action="#{administrador.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{administrador.listSetup}" value="Show All Administrador Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
