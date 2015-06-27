/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import POJO.Administrador;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import Controller.util.JsfUtil;
import Controller.util.PagingInfo;
import Facade.AdministradorFacade;
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
public class AdministradorController {

    public AdministradorController() {
        pagingInfo = new PagingInfo();
        converter = new AdministradorConverter();
    }
    private Administrador administrador = null;
    private List<Administrador> administradorItems = null;
    private AdministradorFacade jpaController = null;
    private AdministradorConverter converter = null;
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

    public AdministradorFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (AdministradorFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "administradorJpa");
        }
        return jpaController;
    }

    public SelectItem[] getAdministradorItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getAdministradorItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Administrador getAdministrador() {
        if (administrador == null) {
            administrador = (Administrador) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAdministrador", converter, null);
        }
        if (administrador == null) {
            administrador = new Administrador();
        }
        return administrador;
    }

    public String listSetup() {
        reset(true);
        return "administrador_list";
    }

    public String createSetup() {
        reset(false);
        administrador = new Administrador();
        return "administrador_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(administrador);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Administrador was successfully created.");
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
        return scalarSetup("administrador_detail");
    }

    public String editSetup() {
        return scalarSetup("administrador_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        administrador = (Administrador) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAdministrador", converter, null);
        if (administrador == null) {
            String requestAdministradorString = JsfUtil.getRequestParameter("jsfcrud.currentAdministrador");
            JsfUtil.addErrorMessage("The administrador with id " + requestAdministradorString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String administradorString = converter.getAsString(FacesContext.getCurrentInstance(), null, administrador);
        String currentAdministradorString = JsfUtil.getRequestParameter("jsfcrud.currentAdministrador");
        if (administradorString == null || administradorString.length() == 0 || !administradorString.equals(currentAdministradorString)) {
            String outcome = editSetup();
            if ("administrador_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit administrador. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(administrador);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Administrador was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentAdministrador");
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
                JsfUtil.addSuccessMessage("Administrador was successfully deleted.");
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

    public List<Administrador> getAdministradorItems() {
        if (administradorItems == null) {
            getPagingInfo();
            administradorItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return administradorItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "administrador_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "administrador_list";
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
        administrador = null;
        administradorItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Administrador newAdministrador = new Administrador();
        String newAdministradorString = converter.getAsString(FacesContext.getCurrentInstance(), null, newAdministrador);
        String administradorString = converter.getAsString(FacesContext.getCurrentInstance(), null, administrador);
        if (!newAdministradorString.equals(administradorString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
