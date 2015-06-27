<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Administrador Detail</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Administrador Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Idadmin:"/>
                    <h:outputText value="#{administrador.administrador.idadmin}" title="Idadmin" />
                    <h:outputText value="Nombre:"/>
                    <h:outputText value="#{administrador.administrador.nombre}" title="Nombre" />
                    <h:outputText value="Apellido:"/>
                    <h:outputText value="#{administrador.administrador.apellido}" title="Apellido" />
                    <h:outputText value="Telefono:"/>
                    <h:outputText value="#{administrador.administrador.telefono}" title="Telefono" />
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{administrador.administrador.email}" title="Email" />
                    <h:outputText value="Password:"/>
                    <h:outputText value="#{administrador.administrador.password}" title="Password" />
                    <h:outputText value="Estado:"/>
                    <h:outputText value="#{administrador.administrador.estado}" title="Estado" />


                </h:panelGrid>
                <br />
                <h:commandLink action="#{administrador.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrador.administrador][administrador.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{administrador.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrador.administrador][administrador.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{administrador.createSetup}" value="New Administrador" />
                <br />
                <h:commandLink action="#{administrador.listSetup}" value="Show All Administrador Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
