/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import POJO.Pedido;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import Controller.util.JsfUtil;
import Controller.util.PagingInfo;
import Facade.PedidoFacade;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author david13mo
 */
public class PedidoController {

    public PedidoController() {
        pagingInfo = new PagingInfo();
        converter = new PedidoConverter();
    }
    private Pedido pedido = null;
    private List<Pedido> pedidoItems = null;
    private PedidoFacade jpaController = null;
    private PedidoConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "com.mycompany_ProyectoFinalPW_war_1.0-SNAPSHOTPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public PedidoFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (PedidoFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "pedidoJpa");
        }
        return jpaController;
    }

    public SelectItem[] getPedidoItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getPedidoItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Pedido getPedido() {
        if (pedido == null) {
            pedido = (Pedido) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPedido", converter, null);
        }
        if (pedido == null) {
            pedido = new Pedido();
        }
        return pedido;
    }

    public String listSetup() {
        reset(true);
        return "pedido_list";
    }

    public String createSetup() {
        reset(false);
        pedido = new Pedido();
        return "pedido_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(pedido);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Pedido was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("pedido_detail");
    }

    public String editSetup() {
        return scalarSetup("pedido_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        pedido = (Pedido) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentPedido", converter, null);
        if (pedido == null) {
            String requestPedidoString = JsfUtil.getRequestParameter("jsfcrud.currentPedido");
            JsfUtil.addErrorMessage("The pedido with id " + requestPedidoString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String pedidoString = converter.getAsString(FacesContext.getCurrentInstance(), null, pedido);
        String currentPedidoString = JsfUtil.getRequestParameter("jsfcrud.currentPedido");
        if (pedidoString == null || pedidoString.length() == 0 || !pedidoString.equals(currentPedidoString)) {
            String outcome = editSetup();
            if ("pedido_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit pedido. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(pedido);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Pedido was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentPedido");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Pedido was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Pedido> getPedidoItems() {
        if (pedidoItems == null) {
            getPagingInfo();
            pedidoItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return pedidoItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "pedido_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "pedido_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        pedido = null;
        pedidoItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Pedido newPedido = new Pedido();
        String newPedidoString = converter.getAsString(FacesContext.getCurrentInstance(), null, newPedido);
        String pedidoString = converter.getAsString(FacesContext.getCurrentInstance(), null, pedido);
        if (!newPedidoString.equals(pedidoString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
