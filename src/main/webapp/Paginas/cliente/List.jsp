<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Cliente Items</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Cliente Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Cliente Items Found)<br />" rendered="#{cliente.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{cliente.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{cliente.pagingInfo.firstItem + 1}..#{cliente.pagingInfo.lastItem} of #{cliente.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{cliente.prev}" value="Previous #{cliente.pagingInfo.batchSize}" rendered="#{cliente.pagingInfo.firstItem >= cliente.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{cliente.next}" value="Next #{cliente.pagingInfo.batchSize}" rendered="#{cliente.pagingInfo.lastItem + cliente.pagingInfo.batchSize <= cliente.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{cliente.next}" value="Remaining #{cliente.pagingInfo.itemCount - cliente.pagingInfo.lastItem}"
                                   rendered="#{cliente.pagingInfo.lastItem < cliente.pagingInfo.itemCount && cliente.pagingInfo.lastItem + cliente.pagingInfo.batchSize > cliente.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{cliente.clienteItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdCliente"/>
                            </f:facet>
                            <h:outputText value="#{item.idCliente}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Email"/>
                            </f:facet>
                            <h:outputText value="#{item.email}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Telefono"/>
                            </f:facet>
                            <h:outputText value="#{item.telefono}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Ciudad"/>
                            </f:facet>
                            <h:outputText value="#{item.ciudad}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Pais"/>
                            </f:facet>
                            <h:outputText value="#{item.pais}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Nombre"/>
                            </f:facet>
                            <h:outputText value="#{item.nombre}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Apellido"/>
                            </f:facet>
                            <h:outputText value="#{item.apellido}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Password"/>
                            </f:facet>
                            <h:outputText value="#{item.password}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Estado"/>
                            </f:facet>
                            <h:outputText value="#{item.estado}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{cliente.detailSetup}">
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cliente.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{cliente.editSetup}">
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cliente.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{cliente.remove}">
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cliente.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{cliente.createSetup}" value="New Cliente"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
