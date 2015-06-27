/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import POJO.Factura;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import Controller.util.JsfUtil;
import Controller.util.PagingInfo;
import Facade.FacturaFacade;
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
public class FacturaController {

    public FacturaController() {
        pagingInfo = new PagingInfo();
        converter = new FacturaConverter();
    }
    private Factura factura = null;
    private List<Factura> facturaItems = null;
    private FacturaFacade jpaController = null;
    private FacturaConverter converter = null;
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

    public FacturaFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (FacturaFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "facturaJpa");
        }
        return jpaController;
    }

    public SelectItem[] getFacturaItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getFacturaItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Factura getFactura() {
        if (factura == null) {
            factura = (Factura) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFactura", converter, null);
        }
        if (factura == null) {
            factura = new Factura();
        }
        return factura;
    }

    public String listSetup() {
        reset(true);
        return "factura_list";
    }

    public String createSetup() {
        reset(false);
        factura = new Factura();
        return "factura_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(factura);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Factura was successfully created.");
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
        return scalarSetup("factura_detail");
    }

    public String editSetup() {
        return scalarSetup("factura_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        factura = (Factura) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentFactura", converter, null);
        if (factura == null) {
            String requestFacturaString = JsfUtil.getRequestParameter("jsfcrud.currentFactura");
            JsfUtil.addErrorMessage("The factura with id " + requestFacturaString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String facturaString = converter.getAsString(FacesContext.getCurrentInstance(), null, factura);
        String currentFacturaString = JsfUtil.getRequestParameter("jsfcrud.currentFactura");
        if (facturaString == null || facturaString.length() == 0 || !facturaString.equals(currentFacturaString)) {
            String outcome = editSetup();
            if ("factura_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit factura. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(factura);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Factura was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentFactura");
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
                JsfUtil.addSuccessMessage("Factura was successfully deleted.");
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

    public List<Factura> getFacturaItems() {
        if (facturaItems == null) {
            getPagingInfo();
            facturaItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return facturaItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "factura_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "factura_list";
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
        factura = null;
        facturaItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Factura newFactura = new Factura();
        String newFacturaString = converter.getAsString(FacesContext.getCurrentInstance(), null, newFactura);
        String facturaString = converter.getAsString(FacesContext.getCurrentInstance(), null, factura);
        if (!newFacturaString.equals(facturaString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
