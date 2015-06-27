<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Categoria Items</title>
            <link rel="stylesheet" type="text/css" href="/ProyectoFinalPW/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Categoria Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Categoria Items Found)<br />" rendered="#{categoria.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{categoria.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{categoria.pagingInfo.firstItem + 1}..#{categoria.pagingInfo.lastItem} of #{categoria.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{categoria.prev}" value="Previous #{categoria.pagingInfo.batchSize}" rendered="#{categoria.pagingInfo.firstItem >= categoria.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{categoria.next}" value="Next #{categoria.pagingInfo.batchSize}" rendered="#{categoria.pagingInfo.lastItem + categoria.pagingInfo.batchSize <= categoria.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{categoria.next}" value="Remaining #{categoria.pagingInfo.itemCount - categoria.pagingInfo.lastItem}"
                                   rendered="#{categoria.pagingInfo.lastItem < categoria.pagingInfo.itemCount && categoria.pagingInfo.lastItem + categoria.pagingInfo.batchSize > categoria.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{categoria.categoriaItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="IdCATEGORIA"/>
                            </f:facet>
                            <h:outputText value="#{item.idCATEGORIA}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Nombre"/>
                            </f:facet>
                            <h:outputText value="#{item.nombre}"/>
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
                            <h:commandLink value="Show" action="#{categoria.detailSetup}">
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][categoria.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{categoria.editSetup}">
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][categoria.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{categoria.remove}">
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['Facade.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][categoria.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{categoria.createSetup}" value="New Categoria"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
