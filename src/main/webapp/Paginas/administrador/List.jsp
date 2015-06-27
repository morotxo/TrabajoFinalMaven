<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Administrador Items</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Administrador Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Administrador Items Found)<br />" rendered="#{administrador.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{administrador.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{administrador.pagingInfo.firstItem + 1}..#{administrador.pagingInfo.lastItem} of #{administrador.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{administrador.prev}" value="Previous #{administrador.pagingInfo.batchSize}" rendered="#{administrador.pagingInfo.firstItem >= administrador.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{administrador.next}" value="Next #{administrador.pagingInfo.batchSize}" rendered="#{administrador.pagingInfo.lastItem + administrador.pagingInfo.batchSize <= administrador.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{administrador.next}" value="Remaining #{administrador.pagingInfo.itemCount - administrador.pagingInfo.lastItem}"
                                   rendered="#{administrador.pagingInfo.lastItem < administrador.pagingInfo.itemCount && administrador.pagingInfo.lastItem + administrador.pagingInfo.batchSize > administrador.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{administrador.administradorItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Idadmin"/>
                            </f:facet>
                            <h:outputText value="#{item.idadmin}"/>
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
                                <h:outputText value="Telefono"/>
                            </f:facet>
                            <h:outputText value="#{item.telefono}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Email"/>
                            </f:facet>
                            <h:outputText value="#{item.email}"/>
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
                            <h:commandLink value="Show" action="#{administrador.detailSetup}">
                                <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][administrador.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{administrador.editSetup}">
                                <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][administrador.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{administrador.remove}">
                                <f:param name="jsfcrud.currentAdministrador" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][administrador.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{administrador.createSetup}" value="New Administrador"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
