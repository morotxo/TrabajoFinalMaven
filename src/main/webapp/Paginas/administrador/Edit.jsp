<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Administrador</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Administrador</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Idadmin:"/>
                    <h:outputText value="#{administrador.administrador.idadmin}" title="Idadmin" />
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
                <h:commandLink action="#{administrador.edit}" value="Save">
                    <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrador.administrador][administrador.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{administrador.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][administrador.administrador][administrador.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{administrador.listSetup}" value="Show All Administrador Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
